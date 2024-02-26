import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:nativeco/pages/splash.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Gemini.init(
    apiKey: dotenv.get('GEMINI_API_KEY', fallback: "no-key-found"),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nativeco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, primaryColor: Colors.green),
      home: SplashScreen(),
    );
  }
}
