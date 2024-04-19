import 'package:flutter_restaurant_aplication/Model/menu_model.dart';
import 'package:flutter_restaurant_aplication/Services/menu_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuServices = Provider<MenuServices>((ref) => MenuServices());
final menuProvider = FutureProvider<List<ModelMenu>>((ref) async {
  return ref.read(menuServices).getMenu();
});