import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:shoppist/core/services/home_widget_listener.dart';
import 'package:shoppist/core/services/notification_controller.dart';
import 'package:shoppist/features/application.dart';
import 'package:shoppist/core/services/bloc_observer.dart';
import 'package:shoppist/core/services/injection.dart' as di;
import 'package:shoppist/features/home/views/home_page.dart';
import 'package:shoppist/firebase_options.dart';
import 'package:shoppist/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  /// Dependency injection
  await di.init();
  /// Bloc observing for debug
  if (!kReleaseMode) Bloc.observer = AppBlocObserver();
  /// Notifications
  await NotificationController.init();
  /// Widgets
  HomeWidget.registerInteractivityCallback(backgroundCallback);
  homeWidgetListener();
  /// App
  runApp(TranslationProvider(child: const Application()));
}
