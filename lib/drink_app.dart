
import 'package:drinks/routes/app_router.dart';
import 'package:drinks/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkApp extends StatelessWidget {
  final AppRouter approuter;
  const DrinkApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
  
    return ScreenUtilInit(
      designSize: Size(375, 812),

      child: MaterialApp(
      
        initialRoute: Routes.onboardingScreen,

        debugShowCheckedModeBanner: false,
        onGenerateRoute: approuter.generateRoute,
      ),
    );
  }
}
