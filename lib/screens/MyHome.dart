import 'package:flutter/material.dart';
import 'package:youtube/models/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../API.dart';

class MyHome extends StatefulWidget {
  String search;

  MyHome(this.search);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Future<List<Video>> _listVideos(String search) {
    API api = API();
    return api.search(search);
  }

  @override
  void initState() {
    super.initState();
    print("chamado 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("chamado 2 - didChangeDependencies");
  }

  @override
  void didUpdateWidget(MyHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("chamado 2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("chamado 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("chamado 3 - build");

    return FutureBuilder<List<Video>>(
      future: _listVideos(widget.search),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];

                    return GestureDetector(
                        onTap: () {
                          FlutterYoutube.playYoutubeVideoById(
                              apiKey: API_KEY,
                              videoId: video.id,
                              autoPlay: true,
                              fullScreen: true);
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.image),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(video.title),
                              subtitle: Text(video.channel),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 3,
                        color: Colors.red,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                child: Text("There are no data to see"),
              );
            }
            break;
        }
      },
    );
  }
}
