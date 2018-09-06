import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_taipei_park_example/generated/i18n.dart';
import 'package:flutter_taipei_park_example/parklist/parkspot_list_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
          S.delegate.resolution(fallback: Locale("zh", "en")),
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new ParkSpotListPage(),
    );
  }
}
