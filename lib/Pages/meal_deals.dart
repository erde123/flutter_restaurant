// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_restaurant_aplication/Components/card.dart';
import 'package:flutter_restaurant_aplication/Provider/menu_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Styles/colors.dart';
import '../Styles/typhography.dart';

class MealDealsPage extends ConsumerStatefulWidget {
  const MealDealsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MealDealsPage> createState() => _MealDealsPageState();
}

class _MealDealsPageState extends ConsumerState<MealDealsPage> {
  @override
  Widget build(BuildContext context) {
    final listMenu = ref.watch(menuProvider);
    final double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: grey3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Center(
                  child: Text(
                    "Meal Deals",
                    style: h1(
                      color: primary,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: listMenu.when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                            child: CardMenu(
                              item: data[index],
                              width: sizeWidth,
                              isAll: true,
                            ),
                          );
                        },
                      );
                    },
                    error: (error, s) => Text(error.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            child: GestureDetector(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primary,
                    width: 2.0,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
