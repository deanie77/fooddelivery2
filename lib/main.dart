import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery2/blocs/autocomplete/bloc/autocomplete_bloc.dart';
import 'package:fooddelivery2/blocs/basket/basket_bloc.dart';
import 'package:fooddelivery2/blocs/geolocation/geolocation_bloc.dart';
import 'package:fooddelivery2/blocs/placedetails/placedetails_bloc.dart';
import 'package:fooddelivery2/blocs/voucher/voucher_bloc.dart';
import 'package:fooddelivery2/config/app_router.dart';
import 'package:fooddelivery2/config/theme.dart';
import 'package:fooddelivery2/pages/pages.dart';
import 'package:fooddelivery2/repositories/geolocations/geolocation_repository.dart';
import 'package:fooddelivery2/repositories/places/places_repository.dart';
import 'package:fooddelivery2/repositories/voucher/voucher_repository.dart';
import 'package:fooddelivery2/simple_bloc_observer.dart';

import 'blocs/filter/filter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(const LoadAutocomplete()),
          ),
          BlocProvider(
            create: (context) => GeolocationBloc(
              geolocationRepository: context.read<GeolocationRepository>(),
            )..add(LoadGeolocation()),
          ),
          BlocProvider(
            create: (context) => PlacedetailsBloc(
              placesRepository: context.read<PlacesRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => FilterBloc()..add(LoadFilter()),
          ),
          BlocProvider(
            create: (context) =>
                VoucherBloc(voucherRepository: VoucherRepository())
                  ..add(
                    LoadVouchers(),
                  ),
          ),
          BlocProvider(
            create: (context) => BasketBloc(
              voucherBloc: BlocProvider.of<VoucherBloc>(context),
            )..add(StartBasket()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hambayi Delivery',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }
}
