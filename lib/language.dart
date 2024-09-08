import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:language/signup.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'English (UK)';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: height * 0.08,
                width: width,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 25,
                      ),
                    ),
                    Text(
                      "Language",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Container(
                        height: height * 0.03,
                        width: width * 0.1,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 57, 122, 244),
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final language = languages[index];
                      bool isSelected =
                          selectedLanguage == language['language'];

                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        height: height * 0.08,
                        width: width,
                        child: Card(
                          elevation: 05,
                          margin: EdgeInsets.zero,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: isSelected
                                  ? Border.all(
                                      width: 1.5,
                                      color: Colors.blue,
                                    )
                                  : Border.all(
                                      width: 1, color: Colors.transparent),
                            ),
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 5),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(language['flag']!),
                                radius: 15,
                              ),
                              title: Text(language['language']!),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(language['translation']!),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedLanguage = language['language']!;
                                });
                              },
                              selected: isSelected,
                              selectedTileColor: Colors.blue[100],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> languages = [
  {
    'language': 'English (UK)',
    'flag': 'https://flagcdn.com/w320/gb.png',
    'translation': '(English)'
  },
  {
    'language': 'Egypt (Syria)',
    'flag': 'https://flagcdn.com/w320/eg.png',
    'translation': '(العربية)'
  },
  {
    'language': 'India',
    'flag': 'https://flagcdn.com/w320/in.png',
    'translation': '(हिंदी)'
  },
  {
    'language': 'Pakistan',
    'flag': 'https://flagcdn.com/w320/pk.png',
    'translation': '(اردو)'
  },
  {
    'language': 'Bangladesh',
    'flag': 'https://flagcdn.com/w320/bd.png',
    'translation': '(বাংলাদেশ)'
  },
  {
    'language': 'Philippines',
    'flag': 'https://flagcdn.com/w320/ph.png',
    'translation': '(Tagalog)'
  },
  {
    'language': 'Iran',
    'flag': 'https://flagcdn.com/w320/ir.png',
    'translation': '(فارسی)'
  },
  {
    'language': 'Nepal',
    'flag': 'https://flagcdn.com/w320/np.png',
    'translation': '(नेपाल)'
  },
  {
    'language': 'Sri Lanka (Sinhala)',
    'flag': 'https://flagcdn.com/w320/lk.png',
    'translation': '(සිංහල)'
  },
  {
    'language': 'United States (Tamil)',
    'flag': 'https://flagcdn.com/w320/us.png',
    'translation': '(தமிழ்)'
  },
  {
    'language': 'China',
    'flag': 'https://flagcdn.com/w320/cn.png',
    'translation': '(中文)'
  },
  {
    'language': 'Japan',
    'flag': 'https://flagcdn.com/w320/jp.png',
    'translation': '(日本語)'
  },
  {
    'language': 'Germany',
    'flag': 'https://flagcdn.com/w320/de.png',
    'translation': '(Deutsch)'
  },
  {
    'language': 'France',
    'flag': 'https://flagcdn.com/w320/fr.png',
    'translation': '(Français)'
  },
  {
    'language': 'Spain',
    'flag': 'https://flagcdn.com/w320/es.png',
    'translation': '(Español)'
  },
  {
    'language': 'Russia',
    'flag': 'https://flagcdn.com/w320/ru.png',
    'translation': '(Русский)'
  },
  {
    'language': 'Brazil',
    'flag': 'https://flagcdn.com/w320/br.png',
    'translation': '(Português)'
  },
  {
    'language': 'South Korea',
    'flag': 'https://flagcdn.com/w320/kr.png',
    'translation': '(한국어)'
  },
  {
    'language': 'Italy',
    'flag': 'https://flagcdn.com/w320/it.png',
    'translation': '(Italiano)'
  },
  {
    'language': 'Turkey',
    'flag': 'https://flagcdn.com/w320/tr.png',
    'translation': '(Türkçe)'
  },
];
