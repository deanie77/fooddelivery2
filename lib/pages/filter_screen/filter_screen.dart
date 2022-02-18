import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery2/blocs/filter/filter_bloc.dart';
import 'package:fooddelivery2/models/models.dart';
import 'package:fooddelivery2/widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter-screen';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomCategoryFilter(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is FilterLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: const RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();
                        var prices = state.filter.priceFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                            .where(
                              (restaurant) => categories.any(
                                (category) =>
                                    restaurant.tags.contains(category),
                              ),
                            )
                            .where(
                              (restaurant) => prices.any(
                                (price) =>
                                    restaurant.priceCategory.contains(price),
                              ),
                            )
                            .toList();

                        Navigator.pushNamed(
                            context, '/restaurant-listing-screen',
                            arguments: restaurants);
                      },
                      child: Text(
                        'Apply',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    );
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
