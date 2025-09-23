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
      backgroundColor: const Color.fromARGB(255, 149, 138, 138),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10).r,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Drink Name'),
                      Text('20 flavors of this drink'),
                    ],
                  ),
                  Text('Prix'),
                ],
              ),
            ),
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
                              left: 30,
                              bottom: index == 0 ? 160 : 190,
                              child: Container(
                                height: 20.h,
                                width: 145.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      offset: Offset.zero,
                                      blurRadius: 40.r,
                                      color: const Color.fromARGB(
                                        255,
                                        38,
                                        37,
                                        37,
                                      ),
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
      ),
    );
  }
}
