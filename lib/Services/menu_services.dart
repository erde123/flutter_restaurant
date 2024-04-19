import 'dart:async';

import 'package:flutter_restaurant_aplication/Model/menu_model.dart';

class MenuServices {
  final List<Map<String, dynamic>> body = [
    {
      "name": "Cheeseburger",
      "description":
          "Juicy beef patty topped with melted cheese, lettuce, tomato, and pickles, served on a toasted bun.",
      "price": 9.99,
      "category": "Burgers",
      "rating": 4.5,
      "image": "assets/images/comet.jpg"
    },
    {
      "name": "Margherita Pizza",
      "description":
          "Classic Italian pizza topped with tomato sauce, fresh mozzarella cheese, basil leaves, and a drizzle of olive oil.",
      "price": 11.50,
      "category": "Pizzas",
      "rating": 4.8,
      "image": "assets/images/comet.jpg"
    },
    {
      "name": "Caesar Salad",
      "description":
          "Crisp romaine lettuce tossed in Caesar dressing with croutons and shaved Parmesan cheese.",
      "price": 8.75,
      "category": "Salads",
      "rating": 4.2,
      "image": "assets/images/comet.jpg"
    },
    {
      "name": "Spaghetti Carbonara",
      "description":
          "Spaghetti pasta tossed in a creamy sauce with crispy bacon, Parmesan cheese, and black pepper.",
      "price": 12.99,
      "category": "Pasta",
      "rating": 4.6,
      "image": "assets/images/comet.jpg"
    },
    {
      "name": "Chocolate Brownie Sundae",
      "description":
          "Warm chocolate brownie topped with vanilla ice cream, whipped cream, chocolate sauce, and a cherry.",
      "price": 6.99,
      "category": "Desserts",
      "rating": 4.3,
      "image": "assets/images/comet.jpg"
    }
  ];
  Future<List<ModelMenu>> getMenu() async {
    try {
      List<ModelMenu> result =
          body.map((e) => ModelMenu.fromJson(e)).toList();
      return result;
    } catch (e) {
      print("Error in getMenu(): $e");
      rethrow;
    }
  }
}
