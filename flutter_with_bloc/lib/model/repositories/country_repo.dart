import 'package:flutter_with_bloc/model/country.dart';
import 'package:flutter_with_bloc/model/services/base_service.dart';
import 'package:flutter_with_bloc/model/services/country_service.dart';

class CountryRepo {
  final BaseService _countryService = CountryService();
  Future<List<Country>> fetchAllCountries() async {
    dynamic response = await _countryService.getResponse("all");
    final jsonData = response as List;
    List<Country> listOfCountries =
        jsonData.map((e) => Country.fromJson(e)).toList();
    return listOfCountries;
  }
}
