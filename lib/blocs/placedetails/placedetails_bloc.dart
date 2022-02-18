import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooddelivery2/models/place_details_model.dart';
import 'package:fooddelivery2/repositories/places/places_repository.dart';

part 'placedetails_event.dart';
part 'placedetails_state.dart';

class PlacedetailsBloc extends Bloc<PlacedetailsEvent, PlacedetailsState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  PlacedetailsBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(PlacedetailsLoading()) {
    on<LoadPlacedetails>(_onLoadPlacedetails);
  }

  void _onLoadPlacedetails(
      LoadPlacedetails event, Emitter<PlacedetailsState> emit) async {
    emit(PlacedetailsLoading());
    try {
      _placesSubscription?.cancel();
      final PlaceDetailsModel placeDetails =
          await _placesRepository.getPlace(event.placeId);
      emit(PlacedetailsLoaded(placeDetails: placeDetails));
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _placesSubscription?.cancel();
    return super.close();
  }
}
