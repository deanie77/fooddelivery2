import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;
  //final String imageUrl;

  const MenuItem(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.category,
      required this.description,
      required this.price});

  @override
  List<Object?> get props =>
      [id, restaurantId, name, category, description, price];

  static List<MenuItem> menuItems = [
    const MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Pizza',
        category: 'Pizza',
        description: 'Pizza with the touch of a mother\'s love',
        price: 5.99),
    const MenuItem(
        id: 2,
        restaurantId: 1,
        name: 'Mohito',
        category: 'Drinks',
        description: 'Cocktail for the centuries',
        price: 2.99),
    const MenuItem(
        id: 3,
        restaurantId: 1,
        name: 'Zambezi',
        category: 'Drinks',
        description: 'Locally crafted award winning beer',
        price: 1.99),
    const MenuItem(
        id: 4,
        restaurantId: 1,
        name: 'Cake',
        category: 'Eatery',
        description: 'Baked with all the love in the world',
        price: 8.99),
    const MenuItem(
        id: 5,
        restaurantId: 1,
        name: 'Pizza',
        category: 'Pizza',
        description: 'Pizza with the touch of a mother\'s love',
        price: 5.99),
    const MenuItem(
        id: 6,
        restaurantId: 1,
        name: 'Pizza',
        category: 'Pizza',
        description: 'Pizza with the touch of a mother\'s love',
        price: 5.99),
    const MenuItem(
        id: 7,
        restaurantId: 1,
        name: 'Pizza',
        category: 'Pizza',
        description: 'Pizza with the touch of a mother\'s love',
        price: 5.99),
  ];
}
