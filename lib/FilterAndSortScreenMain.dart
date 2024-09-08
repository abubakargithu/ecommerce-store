import 'package:flutter/material.dart';

class TenScreen extends StatefulWidget {
  const TenScreen({super.key});

  @override
  State<TenScreen> createState() => _TenScreenState();
}

class _TenScreenState extends State<TenScreen> {
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
              SizedBox(
                height: height * 0.03,
              ),
              ///////////// this place cell search bar //////////////////
              SearchBar(),
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                child: Container(
                    height: height,
                    width: width,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Category(),
                        Positioned(
                          bottom: height * 0.000000000000000,
                          left: width * 0.25,
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 05,
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.47,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  const Icon(
                                    Icons.swap_vert,
                                    size: 30,
                                    weight: 0.001,
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showSortBottomSheet(
                                          context); // Show bottom sheet on tap
                                    },
                                    child: Text(
                                      'Sort',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  Container(
                                    height: height * 0.04,
                                    color: Colors.black,
                                    width: width * 0.002,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Icon(Icons.filter_alt),
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(FilterScreen());
                                    },
                                    child: Text(
                                      'Filter',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSortBottomSheet(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  // List of sort options
  final sortOptions = [
    'Most Suitable',
    'Popularity',
    'Top Rated',
    'Price High To Low',
    'Price low To High',
    'Latest Arrival',
    'Discount',
  ];

  // Use StatefulBuilder to manage state inside the bottom sheet
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      int selectedIndex = 0; // Initial selected index
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Wrap(
              children: [
                Center(
                  child: Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(height: height * 0.04),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: sortOptions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Colors.grey[300]
                                    : Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                maxRadius: 7,
                                child: Container(
                                  height: height * 0.015,
                                  width: width * 0.03,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: selectedIndex == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Text(
                              sortOptions[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: selectedIndex == index
                                    ? Colors.black
                                    : const Color.fromARGB(255, 141, 140, 140),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

/////////////searchBar //////////////////////
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width * 0.05,
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
          maxRadius: 15,
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Container(
          height: height * 0.06, // Height of the search bar
          width: width * 0.76,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 246, 246),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromARGB(255, 184, 184, 184), // Border color
              width: width * 0.0009, // Border width
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.search,
                  color:
                      const Color.fromARGB(255, 184, 184, 184)), // Search icon
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
                  color:
                      const Color.fromARGB(255, 184, 184, 184)), // Camera icon
            ],
          ),
        ),
      ],
    );
  }
}

//////////////// page view widget//////////////////////////
class Category extends StatefulWidget {
  const Category({super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

////////// catgeory listview builder /////////////////////////
class _CategoryState extends State<Category> {
  int _selectedIndex = 0; // Default to the first index
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: height * 0.06,
          width: width,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 15 : 5,
                  right: 5,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                      _pageController
                          .jumpToPage(index); // Sync PageView with ListView
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
                  child: Text(
                    'Women', // Change text based on index
                    style: TextStyle(
                      color:
                          _selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemCount: 7, // Number of pages
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: GridExample(),
              );
            },
          ),
        ),
      ],
    );
  }
}

///////// this is our gridview ////////////////////////////
class GridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Horizontal spacing between items
            mainAxisSpacing: 10.0,
            mainAxisExtent: height * 0.37 // Vertical spacing between items
            ),
        itemCount: 10, // Total number of items (2 columns * 5 rows = 10 items)
        itemBuilder: (context, index) {
          return Container(
            height: 200.0, // Fixed height for each container
            width: (width - 30) /
                2, // Width calculated to fit within screen with spacing
            margin: EdgeInsets.only(
              top: index < 2 ? 10.0 : 0.0, // Top margin for the first row
              left: index % 2 == 0
                  ? 10.0
                  : 0.0, // Left margin for the first column
              right: index % 2 != 0
                  ? 10.0
                  : 0.0, // Right margin for the second column
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)), // Rounded corners
            ),
            child: Column(
              children: [
                Container(
                  height: height * 0.25,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEmTMFfG4_mfEvzJOndYWsP4ledZqahT_Uig&s")),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Positioned(
                        right: width * 0.01,
                        top: height * 0.007,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.black54),
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            maxRadius: 12,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.347,
                        bottom: height * 0.1935,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black54,
                              size: 20,
                            )),
                      )
                    ],
                  ),
                ),
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
        });
  }
}
