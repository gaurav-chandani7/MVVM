part of 'country_bloc.dart';

@immutable
abstract class CountryEvent {}

class FetchAllCountryList extends CountryEvent {}

class SortCountries extends CountryEvent {
  final SortBy sortBy;
  SortCountries({required this.sortBy});
}
