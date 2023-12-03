import 'package:driven_driver/models/onbording.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _onboardingScreen();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onboardingScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Lottie.network(
            "https://lottie.host/ccefdb59-1052-4b05-a2b9-3ad3d7de0fa1/TdHArGc987.json",
            repeat: false,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.forward().whenComplete(() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding()),
                  ));
            },
          ),
        )
        // floatingActionButton: SizedBox(
        //   width: 200,
        //   height: 50,
        //   child: FloatingActionButton(
        //     onPressed: _onboardingScreen,
        //     child: const Text(
        //       "Get Started!",
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  );}
}
