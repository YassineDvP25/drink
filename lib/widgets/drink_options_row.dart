import 'package:drinks/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkOptionsRow extends StatefulWidget {
  const DrinkOptionsRow({super.key});

  @override
  State<DrinkOptionsRow> createState() => _DrinkOptionsRowState();
}

class _DrinkOptionsRowState extends State<DrinkOptionsRow> {
  String selected = "Iced"; 
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 🔥 Toggle Hot / Iced
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            
            children: [
              _buildToggleButton("Hot"),
              _buildToggleButton("Iced"),
            ],
          ),
        ),
        horizantalSpace(100),

        // ➕➖ Counter
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 15).r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30).r,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // زر -
              GestureDetector(
                onTap: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.remove, size: 20),
                ),
              ),

              // العدد
              Text(
                "$quantity",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // زر +
              GestureDetector(
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.add, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🔘 دالة بناء زر التبديل
  Widget _buildToggleButton(String label) {
    final bool isSelected = selected == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = label;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15).r,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
