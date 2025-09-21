import 'package:drinks/components/drink_item.dart';
import 'package:drinks/helpers/spacing.dart';
import 'package:drinks/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10).r,
        child: Column(
          children: [
            verticalSpace(50),
            Expanded(
              child: ListView.builder(
                itemCount: DrinkModel.drinksList.length,

                itemBuilder: (context, index) {
                  var drink = DrinkModel.drinksList[index];
                  return DrinkItem(
                    itemImage: drink.image,
                    itemName: drink.name,
                    itemPrice: drink.prix,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
