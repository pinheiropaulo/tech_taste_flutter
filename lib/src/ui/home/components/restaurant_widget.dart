import 'package:flutter/material.dart';
import 'package:tech_taste/src/model/restaurant.dart';
import 'package:tech_taste/src/ui/restaurant/restaurant_screen.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return RestaurantScreen(
              restaurant: restaurant,
            );
          },
        ));
      },
      child: Row(
        spacing: 12,
        children: [
          Image.asset("assets/images/${restaurant.imagePath}", width: 96),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: List.generate(
                  restaurant.stars.toInt(),
                  (index) {
                    return Image.asset("assets/images/others/star.png",
                        width: 16);
                  },
                ),
              ),
              Text(
                "${restaurant.distance}km",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
