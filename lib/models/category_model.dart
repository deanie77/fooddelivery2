import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final Image image;

  const CategoryModel({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];

  static List<CategoryModel> categories = [
    CategoryModel(
        id: 1,
        name: 'Pizza',
        image: Image.asset('assets/images/icons/pizza.png')),
    CategoryModel(
        id: 2,
        name: 'Burger',
        image: Image.asset('assets/images/icons/fast-food.png')),
    CategoryModel(
        id: 3,
        name: 'Eatery',
        image: Image.asset('assets/images/icons/restaurant.png')),
    CategoryModel(
        id: 4,
        name: 'Dessert',
        image: Image.asset('assets/images/icons/ice-cream.png')),
    CategoryModel(
        id: 5,
        name: 'Bakery',
        image: Image.asset('assets/images/icons/donut.png')),
    CategoryModel(
        id: 6,
        name: 'Groceries',
        image: Image.asset('assets/images/icons/vegetables.png')),
    CategoryModel(
        id: 7,
        name: 'Drinks',
        image: Image.asset('assets/images/icons/cocktail.png')),
  ];
}
