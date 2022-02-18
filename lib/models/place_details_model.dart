class PlaceDetailsModel {
  final String placeId;
  final String name;
  final double lat;
  final double lng;

  PlaceDetailsModel(
      {this.placeId = '',
      this.name = '',
      required this.lat,
      required this.lng});

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlaceDetailsModel(
      placeId: json['place_id'],
      name: json['name'],
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
    );
  }
}
