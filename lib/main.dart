import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppist/features/application.dart';
import 'package:shoppist/services/bloc_observer.dart';
import 'package:shoppist/services/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  Bloc.observer = AppBlocObserver();
  runApp(const Application());
}
