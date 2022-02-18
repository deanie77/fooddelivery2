part of 'placedetails_bloc.dart';

abstract class PlacedetailsState extends Equatable {
  const PlacedetailsState();

  @override
  List<Object> get props => [];
}

class PlacedetailsLoading extends PlacedetailsState {}

class PlacedetailsLoaded extends PlacedetailsState {
  final PlaceDetailsModel placeDetails;

  const PlacedetailsLoaded({required this.placeDetails});

  @override
  List<Object> get props => [];
}

class PlacedetailsError extends PlacedetailsState {}
