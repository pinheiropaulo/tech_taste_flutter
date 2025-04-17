import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/src/data/categories_data.dart';
import 'package:tech_taste/src/data/restaurant_data.dart';
import 'package:tech_taste/src/model/restaurant.dart';
import 'package:tech_taste/src/ui/home/components/category_widget.dart';
import 'package:tech_taste/src/ui/home/components/restaurant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              size: 26,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/logo.png", width: 147),
              ),
              TextFormField(),
              Text("Escolha por categoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem Avaliados"),
              Column(
                spacing: 16,
                children: List.generate(
                  restaurantData.listRestaurant.length,
                  (index) {
                    Restaurant restaurant =
                        restaurantData.listRestaurant[index];

                    return RestaurantWidget(restaurant: restaurant);
                  },
                ),
              ),
              SizedBox(height: 64)
            ],
          ),
        ),
      ),
    );
  }
}
