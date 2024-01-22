import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fx_app_challenge/data/di/get_it_di.dart' as get_it;
import 'package:fx_app_challenge/providers/provider.dart';
import 'package:fx_app_challenge/view/screens/home.dart';

import 'package:provider/provider.dart';

void main() {
  unawaited(get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.allProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
