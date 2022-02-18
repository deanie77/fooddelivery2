import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooddelivery2/models/place_autocomplete_model.dart';
import 'package:fooddelivery2/repositories/places/places_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading()) {
    on<LoadAutocomplete>(_onLoadAutocomplete);
  }

  void _onLoadAutocomplete(
      LoadAutocomplete event, Emitter<AutocompleteState> emit) async {
    _placesSubscription?.cancel();
    final List<PlaceAutocompleteModel> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);
    emit(AutocompleteLoaded(autocomplete: autocomplete));
  }
}
