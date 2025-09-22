import 'package:drinks/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkDetailScreen extends StatefulWidget {
  final int index;
  const DrinkDetailScreen({super.key, required this.index});

  @override
  State<DrinkDetailScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  PageController controller = PageController(viewportFraction: 0.50);
  double currentPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 1;
      });
    });
    super.initState();
  }

  final drinks = DrinkModel.drinksList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              final scale = 1 - (currentPage - index).abs() * 1;
              final transtaleY = 1 - (currentPage - index).abs() * 70;
              final transtaleX = 1 - (currentPage - index).abs() * 70;
              return Transform.translate(
                offset: Offset(transtaleY, transtaleX),

                child: Transform.scale(
                  scale: scale.clamp(0.5, 1),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            drinks[index].image,
                            fit: BoxFit.contain,
                            height: 800,
                          ),
                          Positioned(
                            left: 45,
                            bottom: index == 0 ? 160 : 190,
                            child: Container(
                              height: 15.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 1,
                                    offset: Offset.zero,
                                    blurRadius: 36.r,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
