import 'package:flutter_restaurant_aplication/Model/restaurant_model.dart';
import 'package:flutter_restaurant_aplication/Services/restaurant_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantServices = Provider<RestaurantServices>((ref) => RestaurantServices());
final restaurantProvider = FutureProvider<List<ModelRestaurant>>((ref) async {
  return ref.read(restaurantServices).getRestaurant();
});