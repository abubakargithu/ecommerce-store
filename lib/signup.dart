import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:language/otpscreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _countryCode = '+91'; // Default code
  String _flagUrl = 'https://flagcdn.com/w320/in.png'; // Default flag URL
  String _phoneNumber = '';
  String? _errorText;

  final FocusNode _phoneFocusNode = FocusNode();

  final Map<String, int> _countryPhoneLengths = {
    '+91': 10, // India
    '+92': 10, // Pakistan
    '+1': 10, // USA and Canada (commonly used length for mobile numbers)
    '+44': 10, // United Kingdom
    '+61': 9, // Australia
    '+49': 11, // Germany
    '+33': 9, // France
    '+39': 10, // Italy
    '+55': 11, // Brazil
    '+52': 10, // Mexico
    '+81': 10, // Japan
    '+86': 11, // China
    // Add more countries as needed
  };

  final List<Map<String, String>> _countries = [
    {'name': 'India', 'code': '+91', 'flag': 'https://flagcdn.com/w320/in.png'},
    {
      'name': 'Pakistan',
      'code': '+92',
      'flag': 'https://flagcdn.com/w320/pk.png'
    },
    {'name': 'USA', 'code': '+1', 'flag': 'https://flagcdn.com/w320/us.png'},
    {
      'name': 'United Kingdom',
      'code': '+44',
      'flag': 'https://flagcdn.com/w320/gb.png'
    },
    {'name': 'Canada', 'code': '+1', 'flag': 'https://flagcdn.com/w320/ca.png'},
    {
      'name': 'Australia',
      'code': '+61',
      'flag': 'https://flagcdn.com/w320/au.png'
    },
    {
      'name': 'Germany',
      'code': '+49',
      'flag': 'https://flagcdn.com/w320/de.png'
    },
    {
      'name': 'France',
      'code': '+33',
      'flag': 'https://flagcdn.com/w320/fr.png'
    },
    {'name': 'Italy', 'code': '+39', 'flag': 'https://flagcdn.com/w320/it.png'},
    {
      'name': 'Brazil',
      'code': '+55',
      'flag': 'https://flagcdn.com/w320/br.png'
    },
    {
      'name': 'Mexico',
      'code': '+52',
      'flag': 'https://flagcdn.com/w320/mx.png'
    },
    {'name': 'Japan', 'code': '+81', 'flag': 'https://flagcdn.com/w320/jp.png'},
    {'name': 'China', 'code': '+86', 'flag': 'https://flagcdn.com/w320/cn.png'},
    // Add more countries as needed
  ];

  void _updateCountryInfo(String phoneNumber) {
    setState(() {
      _phoneNumber = phoneNumber;
      _errorText = null;

      if (phoneNumber.isNotEmpty) {
        String prefix = phoneNumber.substring(
            0, 1); // Use more precise logic for prefix matching
        for (var country in _countries) {
          if (country['code']!.startsWith(prefix)) {
            _countryCode = country['code']!;
            _flagUrl = country['flag']!;

            int? expectedLength = _countryPhoneLengths[_countryCode];
            if (expectedLength != null &&
                phoneNumber.length != expectedLength) {
              _errorText =
                  'Invalid phone number length for the selected country.';
            }
            break;
          }
        }
      }
    });
  }

  void _selectCountry() async {
    final selectedCountry = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Country'),
        children: _countries.map((country) {
          return SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, country);
            },
            child: Row(
              children: [
                Image.network(country['flag']!, width: 30, height: 20),
                SizedBox(width: 10),
                Text(country['name']!),
              ],
            ),
          );
        }).toList(),
      ),
    );

    if (selectedCountry != null) {
      setState(() {
        _countryCode = selectedCountry['code']!;
        _flagUrl = selectedCountry['flag']!;
        _updateCountryInfo(_phoneNumber); // Validate with the new country code
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.2,
                ),
                Text(
                  "Trend MARK",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, // Add this line
                    color: Colors.black,
                    letterSpacing: 1.5,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(
                  width: width * 0.11,
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Text(
              'Sign up to continue',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _selectCountry,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[300]!,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          _flagUrl,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, color: Colors.red);
                          },
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          _countryCode,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        focusNode: _phoneFocusNode,
                        onChanged: _updateCountryInfo,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: _phoneFocusNode.hasFocus ||
                                    _errorText != null
                                ? Colors.purple // Color when focused or error
                                : Colors.grey[700]!, // Default color
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                          border: InputBorder.none,
                          errorText: _errorText,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  _phoneFocusNode.hasFocus || _errorText != null
                                      ? Colors.purple
                                      : Colors.grey[300]!,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.purple), // Border color when focused
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .purple), // Border color when error occurs
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .purple), // Border color when error occurs and focused
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior
                              .always, // Always show label above the text field
                        ),
                      ),
                      Container(
                        height: 1.0,
                        color: _phoneFocusNode.hasFocus || _errorText != null
                            ? Colors.purple
                            : Colors
                                .transparent, // Line color based on focus and error
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.08),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  backgroundColor:
                      Colors.purple, // Background color of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Get.to(() => OtpScreen());
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: height * 0.05), // Space between button and text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(color: Colors.grey[700]),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(color: Colors.purple),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle tap on Terms & Conditions
                      },
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Colors.purple),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle tap on Privacy Policy
                      },
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
