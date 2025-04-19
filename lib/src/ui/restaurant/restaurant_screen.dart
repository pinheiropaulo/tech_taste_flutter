import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/src/model/dish.dart';
import 'package:tech_taste/src/model/restaurant.dart';
import 'package:tech_taste/src/ui/_core/bag_provider.dart';
import 'package:tech_taste/src/ui/_core/components/app_bar.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: restaurant.name,
      ),
      body: Center(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/${restaurant.imagePath}",
              width: 160,
              height: 160,
            ),
            Text(
              "Mais pedidos",
              style: TextStyle(fontSize: 24),
            ),
            Column(
              spacing: 10,
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  leading: Image.asset(
                    "assets/images/dishes/default.png",
                    width: 160,
                  ),
                  title: Text(dish.name),
                  subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        context.read<BagProvider>().addAllDishes([dish]);
                      },
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
