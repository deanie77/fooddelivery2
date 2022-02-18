import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';
import 'package:fooddelivery2/widgets/customer_app_bar.dart';
import 'package:fooddelivery2/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: CategoryModel.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(
                        category: CategoryModel.categories[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promo: Promo.promos[index]);
                  },
                ),
              ),
            ),
            const FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Top Rated',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
                  )),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Restaurant.restaurants.length,
              itemBuilder: (context, index) {
                return RestaurantCard(
                  restaurant: Restaurant.restaurants[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
