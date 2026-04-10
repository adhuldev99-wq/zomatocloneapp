import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zomato/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE23744),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset("assets/images/splogo.png", width: 240),
            Row(
              children: [
                const SizedBox(width: 40),
                // ignore: deprecated_member_use
                Expanded(child: Divider(color: Colors.white.withOpacity(0.2))),
                const SizedBox(width: 40),
              ],
            ),
            Text(
              "AN ETERNAL COMPANY",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
