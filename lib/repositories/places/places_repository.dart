import 'dart:convert';

import 'package:fooddelivery2/models/place_autocomplete_model.dart';
import 'package:fooddelivery2/models/place_details_model.dart';
import 'package:fooddelivery2/secret.dart';
import 'package:http/http.dart' as http;

class PlacesRepository {
  final String types = 'geocode';

  Future<List<PlaceAutocompleteModel>> getAutocomplete(
      String searchInput) async {
    final String key = await Secret().getSecret();
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results
        .map((place) => PlaceAutocompleteModel.fromJson(place))
        .toList();
  }

  Future<PlaceDetailsModel> getPlace(String placeId) async {
    final String key = await Secret().getSecret();
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json['results'] as Map<String, dynamic>;

    return PlaceDetailsModel.fromJson(results);
  }
}
