import 'package:fooddelivery2/models/models.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutocompleteModel>> getAutocomplete(String searchInput);
}
