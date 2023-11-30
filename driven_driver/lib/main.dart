import 'package:driven_driver/models/onbording.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driven Driver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 80, 37, 153)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _OnboardingScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
            child: Image(
          image: AssetImage("../images/logo.jpeg"),
        )),
        floatingActionButton: SizedBox(
          width: 200,
          height: 50,
          child: FloatingActionButton(
            onPressed: _OnboardingScreen,
            child: const Text(
              "Get Started!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
