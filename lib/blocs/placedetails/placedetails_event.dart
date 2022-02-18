part of 'placedetails_bloc.dart';

abstract class PlacedetailsEvent extends Equatable {
  const PlacedetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadPlacedetails extends PlacedetailsEvent {
  final String placeId;

  const LoadPlacedetails({required this.placeId});

  @override
  List<Object> get props => [];
}
