
import 'package:drinks/routes/routes.dart';
import 'package:drinks/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    
            
      

      
      default:
        return null;
    }
  }
}
