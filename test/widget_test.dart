import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppist/features/home/widgets/home_empty_list_widget.dart';
import 'package:shoppist/i18n/strings.g.dart';

void main() {
  group('widget', () {
    group('home_empty_widget', () {
      // setUpAll(() {});
      testWidgets('check_empty_text_existence', (widgetTester) async {
        await widgetTester.pumpWidget(
          TranslationProvider(
            child: const MaterialApp(
              home: Scaffold(
                body: HomeEmptyListWidget(),
              ),
            ),
          ),
        );

        expect(find.byType(Text), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
        // expect(find.text('It`s too empty here, maybe create a new one?'), findsOneWidget);
        // expect(find.text('Что-то пустовато тут, может создать что-нибудь?'), findsOneWidget);
      });
    });
  });
}
