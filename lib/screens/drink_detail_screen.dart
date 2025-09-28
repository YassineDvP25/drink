import 'package:drinks/functions/drink_cup_size.dart';
import 'package:drinks/helpers/spacing.dart';
import 'package:drinks/models/drink_model.dart';
import 'package:drinks/widgets/drink_options_row.dart';
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
  int drinkSizeSelected = 2;
  List cupsSizeText = ['Small', 'Mediume', 'Large'];

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10).r,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drinks[currentPage.round()].name,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                      Text(
                        '20 flavors of this drink',
                        style: TextStyle(
                          fontSize: 10.sp,

                          fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$ ${drinks[currentPage.round()].prix}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: drinks.length,
              itemBuilder: (context, index) {
                final scale = 1 - (currentPage - index).abs() * 1;
                final transtaleY = 1 - (currentPage - index).abs() * 6;
                final transtaleX = 1 - (currentPage - index).abs() * 50;

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
                              left: 25,
                              bottom: index == 0 ? 160 : 140,
                              child: Container(
                                height: 20.h,
                                width: 145.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      offset: Offset.zero,
                                      blurRadius: 45.r,
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
            Positioned(
              bottom: 150,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(3, (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              drinkSizeSelected = index;
                          
                            });
                          },
                          child: Container(
                            height:  60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              color:
                                  drinkSizeSelected == index
                                      ? Colors.amber
                                      : Colors.white,
                            ),

                            child: Image.asset(
                              'assets/drinks/cup.png',
                              scale: drinkCupSize(index),
                            ),
                          ),
                        ),
                        verticalSpace(4),
                        Text(
                          cupsSizeText[index],
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight:  drinkSizeSelected == index ? FontWeight.bold : FontWeight.normal
                            // fontFamily: 'PlayfairDisplay',
                          ),
                        ),
                      ],
                    );
                  }),
                  Column(
                    children: [
                      Container(
                        height: 73,
                        width: 73,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),

                        child: Icon(Icons.arrow_forward, size: 23.sp),
                      ),
                      verticalSpace(10),
                      Text(
                        'More',
                        style: TextStyle(
                          fontSize: 15.sp,
                          // fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(bottom: 50, left: 16, child: DrinkOptionsRow()),
          ],
        ),
      ),
    );
  }
}
