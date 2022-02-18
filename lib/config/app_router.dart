import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/models.dart';
import 'package:fooddelivery2/pages/pages.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      case LocationPage.routeName:
        return LocationPage.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case BasketScreenEdit.routeName:
        return BasketScreenEdit.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case OrderConfirmationScreen.routeName:
        return OrderConfirmationScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
          restaurant: settings.arguments as Restaurant
        );
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
          restaurants: settings.arguments as List<Restaurant>
        );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
