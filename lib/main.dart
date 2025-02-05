import 'package:flutter/material.dart';
import 'package:flutter_application_7/api_helper.dart';
import 'package:flutter_application_7/boc/quote_bloc.dart';
import 'package:flutter_application_7/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
      home:BlocProvider(create: (context)=>QuoteBloc(apiHelper: ApiHelper()),child: HomePage(),),
    );
  }
}
