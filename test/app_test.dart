import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:srsp4/main.dart';

class TestTranslations extends AssetLoader {
  const TestTranslations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      jsonDecode(File('$path/${locale.languageCode}.json').readAsStringSync())
          as Map<String, dynamic>;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/shared_preferences'),
          (call) async => call.method == 'getAll' ? <String, Object>{} : true,
        );
    await EasyLocalization.ensureInitialized();
  });

  for (final size in [const Size(320, 640), const Size(800, 1000)]) {
    testWidgets('Favorites and language at $size', (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale('ru'), Locale('en')],
          path: 'assets/translations',
          assetLoader: const TestTranslations(),
          startLocale: const Locale('ru'),
          fallbackLocale: const Locale('ru'),
          saveLocale: false,
          child: const MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Мой магазин'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.shopping_bag));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Добавить в избранное').first);
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(
          of: find.byType(BottomNavigationBar),
          matching: find.byIcon(Icons.favorite),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Блокнот'), findsOneWidget);
      await tester.tap(find.byTooltip('Убрать из избранного'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Пока здесь пусто'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.person).last);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Английский').last);
      await tester.pumpAndSettle();
      expect(find.text('App language'), findsOneWidget);
      expect(find.text('Catalog'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
