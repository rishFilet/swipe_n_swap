import 'package:flutter/material.dart';

import './features/login/presentation/pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwipeNSwap',
      home: Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    ),
  );
}
