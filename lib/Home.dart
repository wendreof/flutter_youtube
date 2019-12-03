import 'package:flutter/material.dart';
import 'package:youtube/models/CustomSearchDelegate.dart';
import 'package:youtube/screens/Library.dart';
import 'package:youtube/screens/MyHome.dart';
import 'package:youtube/screens/Subscriptions.dart';
import 'package:youtube/screens/Trending.dart';

// import 'package:youtube/models/CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = "";
  int _mainIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      MyHome(_result),
      Subscriptions(),
      Trending(),
      Library(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _result = res;
              });
              print("resultado: digitado " + res);
            },
          ),

          // IconButton(
          //   icon: Icon(Icons.videocam),
          //   onPressed: () {
          //     print("ação: videocam");
          //   },
          // ),

          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {
          //     print("ação: conta");
          //   },
          // )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_mainIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _mainIndex,
        onTap: (index) {
          setState(() {
            _mainIndex = index;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              // backgroundColor: Colors.orange,
              title: Text("Home"),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              //  backgroundColor: Colors.red,
              title: Text("Trending"),
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              //  backgroundColor: Colors.blue,
              title: Text("Subscriptions"),
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              //  backgroundColor: Colors.green,
              title: Text("Library"),
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
