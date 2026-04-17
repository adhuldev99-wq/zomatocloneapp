import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:zomato/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool ischecked = false;

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
                    Text(
                      "Log in or Sign up",
                      style: TextStyle(color: Colors.black),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.red,
                          value: ischecked,
                          onChanged: (value) {
                            setState(() {
                              ischecked = value!;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Text("Remember my login for faster sign-in"),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          phonevalidation();
                        },
                        child: Text("Continue", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //google login
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("assets/images/google.png"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            //email login
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.email, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text("By continuing, you agree to our"),
                    Text("Terms of services privacy policy content policy"),
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
