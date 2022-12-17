import 'package:bloc/bloc.dart';
import 'package:flutter_with_bloc/model/app_exception.dart';
import 'package:flutter_with_bloc/model/country.dart';
import 'package:flutter_with_bloc/model/repositories/country_repo.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(const CountryInitial()) {
    on<FetchAllCountryList>((event, emit) async {
      emit(const CountryListLoading());
      try {
        var list = await CountryRepo().fetchAllCountries();
        list.sort(
          (a, b) => a.name!.common!.compareTo(b.name!.common!),
        );
        emit(CountryListLoaded(data: list));
      } catch (e) {
        if (e is AppException) {
          emit(CountryListError("${e.prefix}${e.message ?? ''}"));
        }
        emit(CountryListError(e.toString()));
      }
    });

    on<SortCountries>((event, emit) {
      switch (event.sortBy) {
        case SortBy.NAME_ASC:
          state.countryList
              ?.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));
          emit(SortedByNameAsc(data: state.countryList!));
          break;
        case SortBy.NAME_DSC:
          state.countryList
              ?.sort((a, b) => b.name!.common!.compareTo(a.name!.common!));
          emit(SortedByNameDsc(data: state.countryList!));
          break;
        case SortBy.AREA_ASC:
          state.countryList?.sort((a, b) => a.area!.compareTo(b.area!));
          emit(SortedByAreaAsc(data: state.countryList!));
          break;
        case SortBy.AREA_DSC:
          state.countryList?.sort((a, b) => b.area!.compareTo(a.area!));
          emit(SortedByAreaDsc(data: state.countryList!));
          break;
        case SortBy.POPULATION_ASC:
          state.countryList
              ?.sort((a, b) => a.population!.compareTo(b.population!));
          emit(SortedByPopulationAsc(data: state.countryList!));
          break;
        case SortBy.POPULATION_DSC:
          state.countryList
              ?.sort((a, b) => b.population!.compareTo(a.population!));
          emit(SortedByPopulationDsc(data: state.countryList!));
          break;
      }
    });
  }
}
