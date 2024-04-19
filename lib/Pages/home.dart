// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_restaurant_aplication/Components/card.dart';
import 'package:flutter_restaurant_aplication/Components/search_box.dart';
import 'package:flutter_restaurant_aplication/Pages/meal_deals.dart';
import 'package:flutter_restaurant_aplication/Pages/most_popular.dart';
import 'package:flutter_restaurant_aplication/Provider/menu_provider.dart';
import 'package:flutter_restaurant_aplication/Provider/restaurant_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Styles/colors.dart';
import '../Styles/typhography.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int _selectedIndex = 0;
  final datad = false;

  var screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  var listBottomNavigation = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.pin_drop),
        label: 'Discovery',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        label: 'Bookmark',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(ZondIcons.trophy),
        label: 'Top Foodie',
        backgroundColor: Colors.white),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        backgroundColor: Colors.white),
  ];

  List<BottomNavigationBarItem> getBottomNavigationItems() {
    return listBottomNavigation;
  }

  List<Widget> getScreens() {
    return screens;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationItems = getBottomNavigationItems();
    final currentScreens = getScreens();

    return Scaffold(
      body: currentScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primary,
        unselectedItemColor: grey1,
        showUnselectedLabels: true,
        items: bottomNavigationItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

final List<String> imageList = [
  'assets/images/comet.jpg',
  'assets/images/comet.jpg',
  'assets/images/comet.jpg',
  'assets/images/comet.jpg',
  'assets/images/comet.jpg',
  'assets/images/comet.jpg',
];
final List<String> typeList = [
  'Thai Cuisine',
  'Western Cuisine',
  'Chinese Cuisine',
  'Indian Cuisine',
  'French Cuisine',
  'Italian Cuisine',
];
final List<String> typeCount = [
  '10',
  '12',
  '8',
  '10',
  '2',
  '6',
];
int _currentSlide = 0;

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final listRestaurant = ref.watch(restaurantProvider);
    final listMenu = ref.watch(menuProvider);
    return Scaffold(
      backgroundColor: grey3,
      appBar: AppBar(
        title: Text(
          "Sydney CBD",
          style: h1(),
        ),
        centerTitle: true,
        backgroundColor: grey3,
        surfaceTintColor: grey3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Box
            SearchBox(),
            SizedBox(
              height: 16,
            ),
            // Carousel
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.width * (9 / 16),
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    initialPage: _currentSlide,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    },
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            Image.asset(
                              imageList[itemIndex],
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.6,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [
                                      0.69,
                                      0.78,
                                      0.86,
                                      0.93,
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black.withOpacity(0.2),
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 20,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      typeList[itemIndex],
                                      style: custom(
                                        fontSize: 22,
                                        color: Colors.white,
                                        bold: false,
                                      ),
                                    ),
                                    Text(
                                      typeCount[itemIndex],
                                      style: custom(
                                        fontSize: 16,
                                        color: Colors.white,
                                        bold: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 0,
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imageList.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: index == _currentSlide ? grey1 : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            // Most Popular (row space around)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
                    style: h1(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MostPopularPages(),
                        ),
                      );
                    },
                    child: Text(
                      "Lihat Semua",
                      style: body2(color: grey1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 280, // Set a fixed height or use Expanded
              child: listRestaurant.when(
                data: (data) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: 16.0, left: index == 0 ? 16 : 0, bottom: 12),
                        child: CardRestaurant(
                          item: data[index],
                          width: 200,
                        ),
                      );
                    },
                  );
                },
                error: (error, s) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

            // Meal Deals (row space around)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meal Deals",
                    style: h1(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDealsPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Lihat Semua",
                      style: body2(color: grey1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 300, // Set a fixed height or use Expanded
              child: listMenu.when(
                data: (data) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: 16.0, left: index == 0 ? 16 : 0, bottom: 16),
                        child: CardMenu(
                          item: data[index],
                          width: 200,
                          isAll: false,
                        ),
                      );
                    },
                  );
                },
                error: (error, s) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
