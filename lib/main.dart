import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:shoppist/features/application.dart';
import 'package:shoppist/core/services/bloc_observer.dart';
import 'package:shoppist/core/services/injection.dart' as di;
import 'package:shoppist/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(TranslationProvider(child: const Application()));
}
