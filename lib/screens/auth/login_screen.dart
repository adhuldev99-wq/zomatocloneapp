import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:zomato/screens/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void phonevalidation() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      showMessage('Phone number is required');
      return;
    }
    if (phone.length != 10) {
      showMessage('Enter valid 10 digit number');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return OtpScreen(number: phone);
        },
      ),
    );
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Text(msg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            width: double.infinity,
            child: Image.asset("assets/images/image2.png", fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "India's #1 Food Delivery\n"
                      "        and Dining App",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Log in or Sign up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        //Country Code Box
                        Container(
                          height: 56,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CountryCodePicker(
                            initialSelection: 'IN',
                            showDropDownButton: false,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            onChanged: (country) {},
                          ),
                        ),

                        SizedBox(width: 10),

                        //Phone Number Field
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter phone number",
                              counterText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE23744),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          phonevalidation();
                        },
                        child: Text("Continue"),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
