import 'package:flutter/material.dart';
import 'package:crypto_price_viewer/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Info',
      theme: ThemeData.dark(), // Dark mode all the way!
      home: HomeScreen(),
    );
  }
}
