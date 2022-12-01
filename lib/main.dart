import 'package:Pedagodino/screens/login.dart';
import 'package:Pedagodino/screens/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/splash.png"),
        splashIconSize: double.infinity,
        nextScreen: showHome ? const LoginScreen() : const OnboardingScreen(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Title of the app"),
      ),
      body: Container(
        child: Center(
          child: Text("Home page"),
        ),
      ),
    );
  }
}
