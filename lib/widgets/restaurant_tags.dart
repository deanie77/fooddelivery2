import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';

class RestaurantTags extends StatelessWidget {
  const RestaurantTags({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(children:
          restaurant.tags.map((tag) => restaurant.tags.indexOf(tag) == restaurant.tags.length - 1 ? Text(
              tag,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black),
            ) : Text(
              '$tag, ',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black),
            )).toList()
    );
  }
}
