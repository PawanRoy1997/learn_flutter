import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/main.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAppState = context.watch<MyAppState>();
    var favourites = myAppState.favourites;

    return ListView.builder(
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        var pair = favourites[index];
        return ListItem(pair: pair);
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var icon = Icons.favorite;
    return Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Icon(icon, color: Theme.of(context).colorScheme.onSecondary),
          Text(
            pair.asPascalCase,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          )
        ]));
  }
}
