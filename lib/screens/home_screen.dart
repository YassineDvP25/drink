import 'package:drinks/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10).r,
        child: Column(
          children: [
            verticalSpace(70),

            SizedBox(
              height: 180.h,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 40, horizontal: 10).r,
                    child: Card(
                      elevation: 6,
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 10,
                            ).r,
                        child: SizedBox(height: 90.h, width: double.infinity),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: 25,
                    bottom: 55,

                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 8.h,
                          width: 70.w,
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
                        Image.asset(
                          'assets/drink/Chocolate.png',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 70,
                    right: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mishkate', style: TextStyle(fontSize: 20)),
                        Text(
                          '20 flavors of your drinks',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    // top: 30,
                    bottom: 70,
                    // left: 100,
                    right: 40,
                    child: Container(
                      height: 26.h,
                      width: 26.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black38),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16.sp,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
