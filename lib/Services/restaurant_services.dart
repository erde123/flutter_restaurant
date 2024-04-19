import 'dart:async';

import 'package:flutter_restaurant_aplication/Model/restaurant_model.dart';


class RestaurantServices {
  final List<Map<String, dynamic>> body = [
    {
      "id": "1",
      "nama": "KFC Broadway",
      "location": "122 Queen Street",
      "category": ["fried chicken", "American"],
      "image": "assets/images/comet.jpg"
    },
    {
      "id": "2",
      "nama": "McDonald's Times Square",
      "location": "1500 Broadway",
      "category": ["burgers", "fast food", "American"],
      "image": "assets/images/comet.jpg"
    },
    {
      "id": "3",
      "nama": "Pizza Hut Central",
      "location": "340 West 42nd Street",
      "category": ["pizza", "Italian", "fast food"],
      "image": "assets/images/comet.jpg"
    },
    {
      "id": "4",
      "nama": "Subway Union Square",
      "location": "45 East 17th Street",
      "category": ["sandwiches", "fast food", "American"],
      "image": "assets/images/comet.jpg"
    },
    {
      "id": "5",
      "nama": "Taco Bell Midtown",
      "location": "200 West 34th Street",
      "category": ["Mexican", "fast food", "American"],
      "image": "assets/images/comet.jpg"
    },
    {
      "id": "6",
      "nama": "Sushi Samba",
      "location": "87 Seventh Avenue South",
      "category": ["sushi", "Japanese", "Brazilian"],
      "image": "assets/images/comet.jpg"
    }
  ];
  Future<List<ModelRestaurant>> getRestaurant() async {
    try {
      List<ModelRestaurant> result =
          body.map((e) => ModelRestaurant.fromJson(e)).toList();
      return result;
    } catch (e) {
      print("Error in getRestaurant(): $e");
      rethrow;
    }
  }
}
