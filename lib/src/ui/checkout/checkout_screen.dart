import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/src/model/dish.dart';
import 'package:tech_taste/src/ui/_core/bag_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text("Limpar"),
            onPressed: () {
              bagProvider.clearBag();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pedidos",
                textAlign: TextAlign.center,
              ),
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return ListTile(
                      leading: Image.asset(
                        "assets/images/dishes/default.png",
                        width: 160,
                      ),
                      title: Text(
                        dish.name,
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              bagProvider.addAllDishes([dish]);
                            },
                          ),
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              bagProvider.removeDish(dish);
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
