import 'package:carouseleffect/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart' as flutter;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Future<Object?> Customdialogbox(BuildContext context) {
  return showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      context: context,
      pageBuilder: (context, _, __) => Center(
              child: Stack(children: [
            Container(
              height: 620,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 34,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 10,
                        left: 10,
                        child: Text(
                          "This app has the animations of the rive login or signup to explore the animations in this app!!",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Positioned.fill(top: 140, child: singinForm())
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Define the action on button press
                  print('Image button pressed');
                  // Add any action you want to perform on tap
                },
                child: flutter.Image.asset(
                  fit: BoxFit.fill,
                  'assets/icons/Close.png',
                  width: 50.0, // Set the width of the image
                  height: 50.0, // Set the height of the image
                ),
              ),
            ),
          ])));
}

class singinForm extends StatelessWidget {
  const singinForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTexteditor = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Form(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        const Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
              child: Text(
            "Email",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16.0),
          child: TextFormField(
            controller: emailTexteditor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(14.0), // Set the border radius here
                  borderSide: BorderSide(
                    strokeAlign: 1,
                    color: Colors.grey, // Set the border color
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SvgPicture.asset("assets/icons/email.svg"),
                )),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Center(
              child: Text(
            "Password",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFormField(
            obscureText: true,
            controller: passwordController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(14.0), // Set the border radius here
                  borderSide: BorderSide(
                    strokeAlign: 1,
                    color: Colors.grey, // Set the border color
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SvgPicture.asset("assets/icons/password.svg"),
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: Container(
            height: 60,
            width: 260,
            decoration: const BoxDecoration(
                color: Color(0xFFF77D8E),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(25))),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            children: [
              SizedBox(
                width: 112,
                child: const Divider(
                  color: Color.fromARGB(255, 152, 152, 152),
                ),
              ),
              Text(
                "OR",
                style: TextStyle(
                  color: Color.fromARGB(255, 146, 146, 146),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 112,
                child: const Divider(
                  color: Color.fromARGB(255, 152, 152, 152),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/email_box.svg",
                  height: 45,
                )),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/apple_box.svg",
                  height: 45,
                )),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/google_box.svg",
                  height: 45,
                ))
          ],
        )
      ]),
    ));
  }
}
