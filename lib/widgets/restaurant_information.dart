import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';
import 'package:fooddelivery2/widgets/widgets.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformation({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 10,),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(height: 10,),
          Text(
            '${restaurant.distance}km away - \$${restaurant.deliveryFee} delivery fee',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10,),
          Text(
            'Restaurant Information',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 5,),
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
