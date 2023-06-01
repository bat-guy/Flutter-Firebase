import 'package:flutter/material.dart';
import 'package:flutter_firebase/common/constants.dart';
import 'package:flutter_firebase/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew item;
  const BrewTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[item.strength],
            backgroundImage: AssetImage(Assets.coffeeIcon),
            radius: 25,
          ),
          title: Text(item.name),
          subtitle: Text(interpolate(Strings.takesPlaceholderSugars, [item.sugar])),
        ),
      ),
    );
  }
}
