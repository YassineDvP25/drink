import 'package:drinks/components/drink_item.dart';
import 'package:drinks/helpers/spacing.dart';
import 'package:drinks/models/drink_model.dart';
import 'package:drinks/screens/drink_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20).r,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: DrinkModel.drinksList.length,

                itemBuilder: (context, index) {
                  var drink = DrinkModel.drinksList[index];
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double offset = 0.0;
                      if (controller.hasClients) {
                        offset = controller.offset / 200 - index;
                      }
                      offset = offset.clamp(0, 1);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),

                        child: DrinkItem(
                          itemImage: drink.image,
                          itemName: drink.name,
                          itemPrice: drink.prix,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                
                                builder: (context) {
                                  return DrinkDetailScreen(
                                    index: index,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
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
