import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  const Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  List<Object?> get props => [id, title, description, imageUrl];

  static List<Promo> promos = [
    const Promo(
        id: 1,
        title: 'FREE Delivery on Your First 3 Orders.',
        description:
            'Place an order of \$10 or more and the delivery fee is on us',
        imageUrl:
            'assets/images/restaurants/alex-haney-CAhjZmVk5H4-unsplash.jpg'),
    const Promo(
        id: 2,
        title: '20% off on Selected Restaurants.',
        description:
            'Get a discount at more than 200+ restaurants',
        imageUrl:
            'assets/images/restaurants/mgg-vitchakorn-vBOxsZrfiCw-unsplash.jpg'),
  ];
}
