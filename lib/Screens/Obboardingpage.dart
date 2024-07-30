import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carouseleffect/Screens/carousel.dart';
import 'package:carouseleffect/Screens/loginpage.dart';
import 'package:carouseleffect/constants.dart';
import 'package:carouseleffect/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rive/rive.dart';
import 'package:flutter/widgets.dart' as flutter;

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active",
        autoplay:
            false); //this autplay off is to set that it should not load again when u restart the app.
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const RiveAnimation.asset("assets/Riveassets/shapes.riv"),
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: flutter.Image.asset("assets/background/Spline.png"),
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            )),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                TyperAnimatedText(
                                    "Learn design & code with joy",
                                    textStyle: Ksecondarytext.copyWith(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        height: 1.2),
                                    speed: Duration(milliseconds: 180)),
                              ]),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'This is the app with rive animations and carousel slider in the home page. This app exibits the different types animations.',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: GestureDetector(
                          onTap: () async {
                            _btnAnimationController.isActive = true;
                            await Future.delayed(Duration(milliseconds: 900));
                            await Customdialogbox(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const MainScreen()));
                          },
                          child: SizedBox(
                            height: 64,
                            width: 260,
                            child: Stack(
                              children: [
                                RiveAnimation.asset(
                                  "assets/Riveassets/button.riv",
                                  controllers: [_btnAnimationController],
                                ),
                                Positioned.fill(
                                    child: Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(Icons.arrow_right_alt),
                                    AnimatedTextKit(
                                        pause: Duration(milliseconds: 0),
                                        isRepeatingAnimation: true,
                                        repeatForever: true,
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                              textDirection: TextDirection.ltr,
                                              speed:
                                                  Duration(milliseconds: 100),
                                              "Click to view the design",
                                              textStyle:
                                                  Ksecondarytext.copyWith(
                                                      fontSize: 16),
                                              colors: [
                                                Colors.black,
                                                Colors.red,
                                                Colors.yellow,
                                                Colors.green,
                                              ]),
                                        ])
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
