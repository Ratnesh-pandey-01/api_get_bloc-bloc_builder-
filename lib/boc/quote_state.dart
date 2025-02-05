import 'package:flutter_application_7/data_model.dart';

abstract class QuoteState {}

class QuotesInitialState extends QuoteState {}

class QuotesLoadingState extends QuoteState {}

class QuotesLoadedState extends QuoteState {
  QuoteDataModel resData;
  QuotesLoadedState({required this.resData});
}

class QuoteErrorState extends QuoteState {
  String errorMsg;
  QuoteErrorState({required this.errorMsg});
}
