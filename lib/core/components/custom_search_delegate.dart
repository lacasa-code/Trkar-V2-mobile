import 'package:flutter/material.dart';
import '../extensions/string.dart';

class CustomSearchDelegate extends SearchDelegate {
  var suggestion2 = [
    'car',
    'part',
    'tyres',
    'place',
  ];

  @override
  String get searchFieldLabel => 'search_hint'.translate;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    // return null;
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
    // return List.generate(
    //   10,
    //   (index) => ListTile(
    //     leading: const Icon(
    //       Icons.search,
    //     ),
    //     title: Text('Suggesction $index'),
    //   ),
    // );
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var results = suggestion2
        .where(
          (name) => name.toLowerCase().contains(query),
        )
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (content, index) => ListTile(
        leading: const Icon(Icons.arrow_left),
        title: Text(
          results[index],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? []
        : suggestion2
            .where((element) => element.toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (content, index) => ListTile(
        leading: const Icon(Icons.arrow_left),
        title: Text(
          suggestions[index],
        ),
      ),
    );
  }
}
