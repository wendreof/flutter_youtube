import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("result: pesquiasa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("result: digitado: " + query);

    List<String> list = List();

    if (query.isNotEmpty) {
      list = ["Switch", "Nintendo", "Kojima", "Death Stranding"]
          .where((text) => text.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, list[index]);
              },
              title: Text(list[index]),
            );
          });
    } else {
      return Center(
        child: Text("Nenhum resultado p/ a pesquisa"),
      );
    }
  }
}
