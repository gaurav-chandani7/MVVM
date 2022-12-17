part of 'country_bloc.dart';

@immutable
abstract class CountryState {
  final List<Country>? countryList;
  final SortBy? sortBy;
  final String? errorMessage;
  const CountryState({this.countryList, this.errorMessage, this.sortBy});
}

enum SortBy {
  NAME_ASC,
  NAME_DSC,
  POPULATION_ASC,
  POPULATION_DSC,
  AREA_ASC,
  AREA_DSC
}

class CountryInitial extends CountryState {
  const CountryInitial() : super();
}

class CountryListLoading extends CountryState {
  const CountryListLoading() : super();
}

class CountryListLoaded extends CountryState {
  const CountryListLoaded(
      {required List<Country> data, SortBy? sortBy = SortBy.NAME_ASC})
      : super(countryList: data, sortBy: sortBy);
}

class CountryListError extends CountryState {
  const CountryListError([String? message]) : super(errorMessage: message);
}

class SortedByNameAsc extends CountryListLoaded {
  const SortedByNameAsc({required List<Country> data})
      : super(data: data, sortBy: SortBy.NAME_ASC);
}

class SortedByNameDsc extends CountryListLoaded {
  const SortedByNameDsc({required List<Country> data})
      : super(data: data, sortBy: SortBy.NAME_DSC);
}

class SortedByAreaAsc extends CountryListLoaded {
  const SortedByAreaAsc({required List<Country> data})
      : super(data: data, sortBy: SortBy.AREA_ASC);
}

class SortedByAreaDsc extends CountryListLoaded {
  const SortedByAreaDsc({required List<Country> data})
      : super(data: data, sortBy: SortBy.AREA_DSC);
}

class SortedByPopulationAsc extends CountryListLoaded {
  const SortedByPopulationAsc({required List<Country> data})
      : super(data: data, sortBy: SortBy.POPULATION_ASC);
}

class SortedByPopulationDsc extends CountryListLoaded {
  const SortedByPopulationDsc({required List<Country> data})
      : super(data: data, sortBy: SortBy.POPULATION_DSC);
}
