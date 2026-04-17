import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zomato/auth/login_screen.dart';
import 'package:zomato/screens/notification_screen.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  const OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _secondsRemaining = 20;
  Timer? _timer;
  void startTimer() {
    _secondsRemaining = 20;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "We have sent a verification code to",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  widget.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                Pinput(
                  length: 6,
                  separatorBuilder: (index) => SizedBox(width: 14),
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 55,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 55,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onCompleted: (pin) {
                    if (pin == "121212") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return NotificationScreen();
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                    }
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: _secondsRemaining > 0
                      ? Text(
                          "Didn't get the OTP?, Resend SMS in ${_secondsRemaining}s",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      : GestureDetector(
                          onTap: () {
                            startTimer(); // restart time
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 70),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Go back to login methods",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
