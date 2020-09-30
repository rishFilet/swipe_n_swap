import 'package:flutter/material.dart';
import 'package:swipe_swap/features/login/presentation/pages/login.dart';
import 'package:swipe_swap/features/login/presentation/pages/login_options.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoginOptions(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
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
