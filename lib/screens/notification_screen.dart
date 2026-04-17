import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato/screens/home_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            //
            const Text(
              "Enable notification to get updates\nabout offers, order status and more",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 30),

            // animated
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// Background animation
                  Lottie.asset("assets/animations/Delivering_pizzas.json"),

                  /// Bell animation on top
                  Positioned(
                    top: 40,
                    left: 40,
                    child: Lottie.asset(
                      "assets/animations/bell_notification.json.json",
                      height: 80,
                      width: 100,
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 40,
                    child: Lottie.asset(
                      "assets/animations/shoppingbag.json",
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text("Enable Notification"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                child: Text("Not Now"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
