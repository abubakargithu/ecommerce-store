import 'package:flutter/material.dart';

class NineScreen extends StatefulWidget {
  const NineScreen({super.key});

  @override
  State<NineScreen> createState() => _NineScreenState();
}

class _NineScreenState extends State<NineScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
              width: width * 0.1,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.06,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  height: height * 0.08, // Height of the search bar
                  width: width * 0.7,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 184, 184, 184), // Border color
                      width: width * 0.0009, // Border width
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search,
                          color: const Color.fromARGB(
                              255, 184, 184, 184)), // Search icon
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 184, 184,
                                    184) // Change the hint text color here
                                ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.camera_alt_outlined,
                          color: const Color.fromARGB(
                              255, 184, 184, 184)), // Camera icon
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
              width: width * 0.1,
            ),
            Container(
              height: height * 0.3,
              width: width * 0.6,
              color: Colors.transparent,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-12fpsJVoO46mIcfKXt_M8I4BYn9rNtEFdw&s', // Replace with your image URL
                filterQuality: FilterQuality.high,
                fit: BoxFit
                    .fill, // Adjust this to control how the image fits in the container
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Trends not Found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Did you type accidentally miatype? Double-check your spelling',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 184, 184, 184)),
            ),
            Text(
              'and try again',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 184, 184, 184)),
            ),
          ],
        ),
      ),
    );
  }
}
