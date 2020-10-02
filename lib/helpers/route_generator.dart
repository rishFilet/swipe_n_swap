import 'package:flutter/material.dart';

import '../features/login/presentation/pages/login.dart';
import '../features/login/presentation/pages/login_options.dart';
import '../features/login/presentation/pages/home.dart';
import '../features/login/presentation/pages/signup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoginOptions(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => SignupPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Ops, something went wrong'),
        ),
      ),
    );
  }
}
