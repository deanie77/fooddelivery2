import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery2/blocs/autocomplete/bloc/autocomplete_bloc.dart';
import 'package:fooddelivery2/blocs/geolocation/geolocation_bloc.dart';
import 'package:fooddelivery2/blocs/placedetails/placedetails_bloc.dart';
import 'package:fooddelivery2/widgets/gmap.dart';
import 'package:fooddelivery2/widgets/location_search_box.dart';

class LocationPage extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlacedetailsBloc, PlacedetailsState>(
        builder: (context, state) {
          if (state is PlacedetailsLoading) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<GeolocationBloc, GeolocationState>(
                    builder: (context, state) {
                      if (state is GeolocationLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GeolocationLoaded) {
                        return Gmap(
                            lat: state.position.latitude,
                            lng: state.position.longitude);
                      } else {
                        return const Text('Something went wrong');
                      }
                    },
                  ),
                ),
                const Location(),
                const AddLocationButton(),
              ],
            );
          } else if (state is PlacedetailsLoaded) {
            return Stack(
              children: [
                Gmap(lat: state.placeDetails.lat, lng: state.placeDetails.lng),
                const Location(),
                const AddLocationButton(),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: [
              const LocationSearchBox(),
              BlocBuilder<AutocompleteBloc, AutocompleteState>(
                builder: (context, state) {
                  if (state is AutocompleteLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is AutocompleteLoaded) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      height: 300,
                      color: state.autocomplete.isNotEmpty
                          ? Colors.black.withOpacity(0.6)
                          : Colors.transparent,
                      child: ListView.builder(
                        itemCount: state.autocomplete.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              state.autocomplete[index].description,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            onTap: () {
                              context.read<PlacedetailsBloc>().add(
                                  LoadPlacedetails(
                                      placeId:
                                          state.autocomplete[index].placeId));
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class AddLocationButton extends StatelessWidget {
  const AddLocationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          child: Text(
            'Add Location',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
