import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery2/blocs/basket/basket_bloc.dart';
import 'package:fooddelivery2/models/models.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/delivery-time-screen';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const DeliveryTimeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const DeliveryTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Time Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Date',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Delivery is today'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text('Today')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Delivery is tomorrow'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text('Tomorrow')),
                ],
              ),
            ),
            Text(
              'Choose the time',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: DeliveryTime.deliveryTime.length,
                  itemBuilder: (context, index) {
                    return BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        return Card(
                          child: TextButton(
                              onPressed: () {
                                context.read<BasketBloc>().add(
                                    SelectDeliveryTime(
                                        DeliveryTime.deliveryTime[index]));
                              },
                              child: Text(
                                DeliveryTime.deliveryTime[index].value,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              )),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: const RoundedRectangleBorder(),
                    primary: Theme.of(context).colorScheme.primary),
                child: const Text('Select'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
