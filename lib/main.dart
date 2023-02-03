import 'package:flutter/material.dart';
import 'package:mapa_flutter/ui/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'ui/mapPage.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF2D836B)),
        textTheme: const TextTheme(
            titleSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            bodySmall: TextStyle(fontSize: 16.0)),
      ),
      routes: {
        '/': (context) => const HomePage(title: 'Mapa'),
        '/map': (context) => const LiveLocationPage(),
      },
    );
  }
}

//Allow to create custom primary swatch (MaterialColor can't take hex color)
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
