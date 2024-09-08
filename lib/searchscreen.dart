import 'package:flutter/material.dart';

class EightScreen extends StatefulWidget {
  const EightScreen({super.key});

  @override
  State<EightScreen> createState() => _EightScreenState();
}

class _EightScreenState extends State<EightScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: height,
          width: width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: Row(children: [
                  SizedBox(
                    height: height * 0.07,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                    child: CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Container(
                    height: height * 0.06,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.circular(10.0), // Circular border
                      border: Border.all(
                          color: Colors.grey), // Optional: Border color
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.search,
                              color: Colors.grey), // Left side search icon
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(SearchScreen());
                            },
                            child: Icon(Icons.camera_alt, color: Colors.grey),
                          ), // Right side camera icon
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'Popular Search',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.016,
              ),
              Divider(
                height: height * 0.000001,
                color: Color.fromARGB(255, 201, 200, 200),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.17,
                width: width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hoodie for Men",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 133, 133, 133),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: const Color.fromARGB(255, 170, 170, 170),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Container(
                      height: height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hoodie for Men",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 133, 133, 133),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: const Color.fromARGB(255, 170, 170, 170),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Container(
                      height: height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hoodie for Men",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 133, 133, 133),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: const Color.fromARGB(255, 170, 170, 170),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Container(
                      height: height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hoodie for Men",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 133, 133, 133),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 170, 170, 170),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  const Text(
                    'Hot Deals This Week',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: width * 0.32,
                  ),
                  const Text(
                    'View All',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing:
                              10.0, // Horizontal spacing between items
                          mainAxisSpacing: 10.0,
                          mainAxisExtent:
                              height * 0.37 // Vertical spacing between items
                          ),
                      itemCount:
                          10, // Total number of items (2 columns * 5 rows = 10 items)
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200.0, // Fixed height for each container
                          width: (width - 30) /
                              2, // Width calculated to fit within screen with spacing
                          margin: EdgeInsets.only(
                            top: index < 2
                                ? 10.0
                                : 0.0, // Top margin for the first row
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
                                topRight:
                                    Radius.circular(10)), // Rounded corners
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
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_yv_Ouav1k6Y53PJX3PtQvUHovBWIALQ3lQ&s")),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: height * 0.002,
                              ),
                              Expanded(
                                  child: Container(
                                width: width * 0.448,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Text(
                                      "Glidan mens Classic",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color: const Color.fromARGB(
                                              60, 59, 59, 59),
                                        ),
                                        SizedBox(
                                          width: width * 0.005,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: width * 0.005,
                                        ),
                                        Text(
                                          '(64)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: const Color.fromARGB(
                                                255, 103, 103, 103),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 10,
                                          color: const Color.fromARGB(
                                              60, 59, 59, 59),
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          '200 Sold',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: const Color.fromARGB(
                                                255, 103, 103, 103),
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
                                          r'$120.00', // Dollar sign displayed correctly
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          r'$56.00', // Dollar sign displayed correctly
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                60, 59, 59, 59),
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
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
