import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';

class CategoryBox extends StatelessWidget {
  final CategoryModel category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = Restaurant.restaurants
        .where(
          (restaurant) => restaurant.tags.contains(category.name),
        )
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/restaurant-listing-screen',
            arguments: restaurants);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: category.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
