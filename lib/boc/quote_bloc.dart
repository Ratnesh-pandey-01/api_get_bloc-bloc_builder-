import 'package:flutter_application_7/api_helper.dart';
import 'package:flutter_application_7/boc/quote_event.dart';
import 'package:flutter_application_7/boc/quote_state.dart';
import 'package:flutter_application_7/data_model.dart';
import 'package:flutter_application_7/urls/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  ApiHelper apiHelper;

  QuoteBloc({required this.apiHelper}) : super(QuotesInitialState()) {
    on<GetQuotesEvent>(
      (event, emit) async {
        emit(QuotesLoadingState());

        var resJson = await apiHelper.getApi(url: Urls.getQuotesUrl);
        if (resJson != null) {
          var mResData = QuoteDataModel.fromJson(resJson);
          emit(QuotesLoadedState(resData: mResData));
        } else {
          emit(QuoteErrorState(errorMsg: " problem"));
        }
      },
    );
  }
}
