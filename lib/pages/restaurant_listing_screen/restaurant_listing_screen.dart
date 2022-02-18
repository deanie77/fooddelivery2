import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';
import 'package:fooddelivery2/widgets/widgets.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant-listing-screen';

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(
        restaurants: restaurants,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;

  const RestaurantListingScreen({Key? key, required this.restaurants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(
              restaurant: restaurants[index],
            );
          },
        ),
      ),
    );
  }
}
