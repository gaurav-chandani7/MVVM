import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc/constants/app_constants.dart' as AppConstants;
import 'package:flutter_with_bloc/view/widgets/country_list_widget.dart';
import 'package:flutter_with_bloc/view_model/bloc/country_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountryBloc>(context).add(FetchAllCountryList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryListLoading || state is CountryInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CountryListLoaded) {
            return CountryListWidget(
              state: state,
            );
          }
          if (state is CountryListError) {
            return Text(state.errorMessage ?? AppConstants.GENERIC_ERROR_MESSAGE);
          }
          return Container();
        },
      )),
    );
  }
}
