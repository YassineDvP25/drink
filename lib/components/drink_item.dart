import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkItem extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final int itemPrice;
  const DrinkItem({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10).r,
            child: Card(
              elevation: 6,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10).r,
                child: SizedBox(height: 90.h, width: double.infinity),
              ),
            ),
          ),
          Positioned(
            top: -15,
            left: 25,
            bottom: 64,
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
                Image.asset(itemImage, fit: BoxFit.fitHeight),
              ],
            ),
          ),
          Positioned(
            top: 75,left: 170,
            // right: 127,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                Text(
                  '20 flavors of your drinks',
                  style: TextStyle(fontSize: 15,fontFamily: 'PlayfairDisplay',),
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
                border: Border.all(color: Colors.black45),
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
    );
  }
}
