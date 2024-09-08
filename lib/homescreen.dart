import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:language/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<HomeScreen> {
  var height, width;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          title: UserInfo(),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 5), // Changed to 5 for consistency
          height: height,
          width: width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.005,
                ),
                SearchBar(),
                SizedBox(
                  height: height * 0.011,
                ),
                CarouselExample(),
                SizedBox(
                  height: height * 0.008,
                ),
                PopularText(),
                SizedBox(
                  height: height * 0.005,
                ),
                Category(),
                SizedBox(
                  height: height * 0.005,
                ),
                Popular(),
                PopularCategory(),
                SizedBox(
                  height: height * 0.01,
                ),
                NewArrival(),
                SizedBox(
                  height: height * 0.005,
                ),
                NewArrivalCategory(),
                // Your existing code here
              ],
            ),
          ),
        ),
        //////////////// bottomNavigationBar //////////////////////////
        bottomNavigationBar: SizedBox(
          height: height * 0.09,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(Icons.home, "Home", 0, 28, 15),
                _buildBottomNavItem(
                    Icons.favorite_border_outlined, "Wishlist", 1, 28, 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CartPage()), // Navigate to CartPage
                    // );
                  },
                  child: _buildBottomNavItem(
                      Icons.shopping_cart_outlined, "Cart", 2, 28, 15),
                ),
                _buildBottomNavItem(
                    Icons.account_circle_outlined, "Profile", 3, 28, 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /////////////////// BottomNavigationBar Widget //////////////////
  Widget _buildBottomNavItem(IconData icon, String label, int index,
      double iconSize, double textSize) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 12.0 : 0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.shade100
              : Colors.transparent, // Highlight when selected
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            if (isSelected) // Only show label if the item is selected
              SizedBox(width: 4),
            if (isSelected) // Only show label if the item is selected
              Text(
                label,
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

///////// AppBar ///////////////////////////
class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Example network image URL; replace with actual user's profile photo URL or logic
    const String? profileImageUrl =
        'https://example.com/profile_photo.jpg'; // Replace with a real URL or use null for testing fallback

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor:
                  Colors.grey[200], // Background color for the avatar
              child: profileImageUrl != null
                  ? ClipOval(
                      child: Image.network(
                        profileImageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback in case of network error
                          return const Icon(Icons.person,
                              size: 30, color: Colors.grey);
                        },
                      ),
                    )
                  : const Icon(Icons.person,
                      size: 30,
                      color: Colors
                          .grey), // Default icon when no image is available
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGreeting(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Charan BP', // Replace with dynamic name if needed
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_active,
              size: 30, color: Colors.yellow),
          onPressed: () {
            // Define your notification action here
          },
        ),
      ],
    );
  }
}

///////////// Search Bar /////////////////////////////////
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width * 0.03,
        ),
        Container(
          height: height * 0.06,
          width: width * 0.74,
          decoration: BoxDecoration(
            border: Border.all(width: width * 0.002),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                size: 20, // Adjust the size of the icon
              ),
              hintText: 'Search here...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0), // Adjust vertical padding to center content
              suffixIcon: Icon(Icons.mic),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.01,
        ),
        InkWell(
          onTap: () {
            Get.to(() => EightScreen());
          },
          child: Container(
            height: height * 0.06,
            width: width * 0.17,
            decoration: BoxDecoration(
              border: Border.all(width: 0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.tune, // Icon resembling the one in your image
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

////////// circur Slider ////////////////////
class CarouselExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: height * 0.200,

        viewportFraction:
            0.85, // Adjust to control the item width relative to the available space
        enlargeCenterPage: true,
      ),
      items: [
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 195, 193, 212),
          ),
          child: Stack(
            children: [
              Positioned(
                left: width * 0.05,
                top: height * 0.02,
                child: Text(
                  '50%offer',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: width * 0.05,
                top: height * 0.08,
                child: Text(
                  'on everything today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              Positioned(
                  left: width * 0.05,
                  top: height * 0.13,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Reduce the border radius here
                      ),
                    ),
                    child: Text('Get Now'),
                  )),
              Positioned(
                right: width * 0.03,
                top: height * 0.02,
                child: Container(
                  height: height * 0.195,
                  width: width * 0.32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/trend-mart.appspot.com/o/Men_Shirts.png?alt=media&token=a9055ef8-d79d-4cdc-a091-331607cfd936')),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 195, 193, 212),
          ),
          child: Stack(
            children: [
              Positioned(
                left: width * 0.05,
                top: height * 0.02,
                child: Text(
                  '50%offer',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: width * 0.05,
                top: height * 0.08,
                child: Text(
                  'on everything today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              Positioned(
                  left: width * 0.05,
                  top: height * 0.13,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Reduce the border radius here
                      ),
                    ),
                    child: Text('Get Now'),
                  )),
              Positioned(
                right: width * 0.03,
                top: height * 0.02,
                child: Container(
                  height: height * 0.195,
                  width: width * 0.32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/trend-mart.appspot.com/o/Men_Shirts.png?alt=media&token=a9055ef8-d79d-4cdc-a091-331607cfd936')),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 195, 193, 212),
          ),
          child: Stack(
            children: [
              Positioned(
                left: width * 0.05,
                top: height * 0.02,
                child: Text(
                  '50%offer',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: width * 0.05,
                top: height * 0.08,
                child: Text(
                  'on everything today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              Positioned(
                  left: width * 0.05,
                  top: height * 0.13,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Reduce the border radius here
                      ),
                    ),
                    child: Text('Get Now'),
                  )),
              Positioned(
                right: width * 0.03,
                top: height * 0.02,
                child: Container(
                  height: height * 0.195,
                  width: width * 0.32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/trend-mart.appspot.com/o/Men_Shirts.png?alt=media&token=a9055ef8-d79d-4cdc-a091-331607cfd936')),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 195, 193, 212),
          ),
          child: Stack(
            children: [
              Positioned(
                left: width * 0.05,
                top: height * 0.02,
                child: Text(
                  '50%offer',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: width * 0.05,
                top: height * 0.08,
                child: Text(
                  'on everything today',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              Positioned(
                  left: width * 0.05,
                  top: height * 0.13,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Reduce the border radius here
                      ),
                    ),
                    child: Text('Get Now'),
                  )),
              Positioned(
                right: width * 0.03,
                top: height * 0.02,
                child: Container(
                  height: height * 0.195,
                  width: width * 0.32,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/trend-mart.appspot.com/o/Men_Shirts.png?alt=media&token=a9055ef8-d79d-4cdc-a091-331607cfd936')),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

////////// popular brand text///////////////
class PopularText extends StatelessWidget {
  const PopularText({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width * 0.04,
        ),
        Text(
          'Popular Brand',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
///////////// cateogry left to right////////////////

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int _selectedIndex = 0; // Start with "All" selected by default

  final List<String> categories = [
    'All',
    'Cloth',
    'Shoes',
    'Bags'
  ]; // Add more categories if needed

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.06,
      width: width,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 15 : 5,
              right: 5,
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == index
                    ? Colors.black
                    : const Color.fromARGB(255, 246, 246, 246),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  if (index == 0) // Display icon only for the first category
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  Text(
                    categories[index],
                    style: TextStyle(
                      color:
                          _selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

////////////// Mostpopular viewall ///////////////////////
class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.045,
      width: width,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.04,
          ),
          Text(
            "Most Popular",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'View All',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(width: width * 0.055),
        ],
      ),
    );
  }
}

//////////// Mostpopular Category //////////////////
class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.36,
      width: width,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: width * 0.028, right: width * 0.029),
            height: height,
            width: width * 0.42,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXPgBbHSc5UoT5tu2RbADX5N8jfy4vjLdQmA&s")),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10))),
                SizedBox(
                  height: height * 0.002,
                ),
                Expanded(
                    child: Container(
                  width: width * 0.448,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        "Daily Cream",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: const Color.fromARGB(60, 59, 59, 59),
                          ),
                          SizedBox(
                            width: width * 0.005,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.005,
                          ),
                          Text(
                            '(64)',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 103, 103, 103),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: const Color.fromARGB(60, 59, 59, 59),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            '180 Sold',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 103, 103, 103),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Row(
                        children: [
                          Text(
                            r'$40.00', // Dollar sign displayed correctly
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            r'$56.00', // Dollar sign displayed correctly
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(60, 59, 59, 59),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}

///////////////// new Arrival //////////////////////

class NewArrival extends StatelessWidget {
  const NewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.045,
      width: width,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.04,
          ),
          Text(
            "New Arrival",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(), // Takes up the remaining space between texts
          Text(
            'View All',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),

          SizedBox(
              width: width * 0.055), // Optional: Add some padding on the right
        ],
      ),
    );
  }
}

/////////////// New Arrival Category//////////////
class NewArrivalCategory extends StatelessWidget {
  const NewArrivalCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.36,
      width: width,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: width * 0.028, right: width * 0.029),
            height: height,
            width: width * 0.42,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYsUOmd_J_bVEMz2F5ABmgpWexg8sS7Fu-2w&s")),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10))),
                SizedBox(
                  height: height * 0.002,
                ),
                Expanded(
                    child: Container(
                  width: width * 0.448,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        "Blue Finger Ring",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: const Color.fromARGB(60, 59, 59, 59),
                          ),
                          SizedBox(
                            width: width * 0.005,
                          ),
                          Text(
                            '4.4',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.005,
                          ),
                          Text(
                            '(60)',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 103, 103, 103),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: const Color.fromARGB(60, 59, 59, 59),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            '220 Sold',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 103, 103, 103),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Row(
                        children: [
                          Text(
                            r'$144.00', // Dollar sign displayed correctly
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            r'$166.00', // Dollar sign displayed correctly
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(60, 59, 59, 59),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
