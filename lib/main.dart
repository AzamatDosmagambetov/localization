import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:localization_app/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'es']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Locales',
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        home: const HomePage(),
      ),
    );
  }
}
