import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const String routeName = '/order-confirmation-screen';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const OrderConfirmationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confrimation Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Home Page'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
