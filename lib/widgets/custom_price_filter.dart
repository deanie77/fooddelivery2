import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery2/blocs/filter/filter_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilters
                .asMap()
                .entries
                .map(
                  (price) => InkWell(
                    onTap: () {
                      context.read<FilterBloc>().add(UpdatePriceFilter(
                            priceFilter:
                                state.filter.priceFilters[price.key].copyWith(
                              value:
                                  !state.filter.priceFilters[price.key].value,
                            ),
                          ),);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: state.filter.priceFilters[price.key].value
                          ? Theme.of(context).primaryColor.withAlpha(100)
                          : Colors.white,
                      ),
                      child: Text(
                        state.filter.priceFilters[price.key].price.price,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
