import 'package:flutter/material.dart';
import 'package:flutter_application_7/boc/quote_bloc.dart';
import 'package:flutter_application_7/boc/quote_event.dart';
import 'package:flutter_application_7/boc/quote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuoteBloc>(context).add(GetQuotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
        if (state is QuotesLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuoteErrorState) {
          return Container(
            child: Text("${state.errorMsg}"),
          );
        } else if (state is QuotesLoadedState) {
          var mDataModel = state.resData;
          return ListView.builder(
              itemCount: mDataModel.quotes.length,
              itemBuilder: (_, index) {
                var eachmodel = mDataModel.quotes[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 7,
                    child: ListTile(
                      title: Text(eachmodel.quote),
                      subtitle: Text(eachmodel.author),
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }
}
