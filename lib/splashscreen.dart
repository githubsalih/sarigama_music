import 'dart:async';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sarigama_music1/src/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(
                "assets/images/istockphoto-939443944-612x612.jpg"),
            fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.1, sigmaY: 1.1),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 7, 4, 4).withOpacity(0.6)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                height: 300.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/image-removebg-preview.png",
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        AnimatedTextKit(
                            pause: const Duration(milliseconds: 0),
                            animatedTexts: [
                              RotateAnimatedText("sarigama",
                                  textStyle: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontFamily: "GrapeNuts",
                                      fontSize: 50.0,
                                      decoration: TextDecoration.none,
                                      color:
                                          Color.fromARGB(255, 244, 240, 240))),
                              RotateAnimatedText("music",
                                  textStyle: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontFamily: "GrapeNuts",
                                      fontSize: 45.0,
                                      decoration: TextDecoration.none,
                                      color:
                                          Color.fromARGB(255, 239, 235, 235))),
                            ])
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Version 1.0.0',
                          style: TextStyle(
                              fontSize: 15.0,
                              decoration: TextDecoration.none,
                              color: Colors.white60),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  gotoLogin() async {
    Timer(const Duration(seconds: 4), (() {
      checkScreen(context);
    }));
  }

  void checkScreen(context) async {
    final data = await SharedPreferences.getInstance();
    final value = data.getBool(sharedCheck) ?? false;
    if (value == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const LoginPage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) =>  const HomePage()));
    }
  }
}