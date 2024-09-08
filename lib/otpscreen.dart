import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:language/homescreen.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  int _resendOtpTimer = 41;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendOtpTimer();
  }

  void _startResendOtpTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendOtpTimer > 0) {
        setState(() {
          _resendOtpTimer--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    // Add your OTP verification logic here
    print("Entered OTP: $otp");
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1) {
      // Move to the next field if the current field is filled
      if (index < _focusNodes.length - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else if (value.isEmpty) {
      // Move to the previous field if the current field is empty
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  "CHANGE NUMBER",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 36, 36, 36),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.355,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child:
                      Icon(Icons.close, color: Color.fromARGB(255, 36, 36, 36)),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
            Text(
              "Enter OTP sent to +91 7259575032",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                // Add your change number logic here
              },
              child: Text(
                "CHANGE NUMBER",
                style: TextStyle(
                    color: Colors.purple[600],
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 40,
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                    ),
                    onChanged: (value) => _onOtpChanged(value, index),
                  ),
                );
              }),
            ),
            SizedBox(height: height * 0.05),
            Text(
              "Resend OTP in $_resendOtpTimer s",
              style: TextStyle(color: Colors.grey[500], fontSize: 14.0),
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              onPressed: () {
                Get.to(() => HomeScreen()); // Navigate to FirstScreen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.purple, // Set the background color to purple
                padding: EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Center(
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0), // Set the text color to white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
