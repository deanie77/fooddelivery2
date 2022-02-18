import 'package:equatable/equatable.dart';

import 'models.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  const Restaurant(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.tags,
      required this.menuItems,
      required this.deliveryTime,
      required this.priceCategory,
      required this.deliveryFee,
      required this.distance});

  @override
  List<Object?> get props =>
      [id, imageUrl, name, tags, deliveryTime, priceCategory, deliveryFee, distance];

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        imageUrl:
            'assets/images/restaurants/alex-haney-CAhjZmVk5H4-unsplash.jpg',
        name: 'Bar Rouge',
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryTime: 30,
        priceCategory: '\$',
        deliveryFee: 2.99,
        distance: 0.1),
    Restaurant(
        id: 2,
        imageUrl:
            'assets/images/restaurants/mgg-vitchakorn-vBOxsZrfiCw-unsplash.jpg',
        name: 'Pa Rouge',
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList(),
        deliveryTime: 30,
        priceCategory: '\$',
        deliveryFee: 2.99,
        distance: 0.1),
    Restaurant(
        id: 3,
        imageUrl:
            'assets/images/restaurants/pablo-merchan-montes-Orz90t6o0e4-unsplash.jpg',
        name: 'La Rouge',
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList(),
        deliveryTime: 30,
        priceCategory: '\$',
        deliveryFee: 2.99,
        distance: 0.1),
    Restaurant(
        id: 4,
        imageUrl:
            'assets/images/restaurants/stefan-johnson-xIFbDeGcy44-unsplash.jpg',
        name: 'Kapoto',
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList(),
        deliveryTime: 30,
        priceCategory: '\$',
        deliveryFee: 2.99,
        distance: 0.1),
  ];
}
