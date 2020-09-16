import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import './features/login/presentation/pages/home.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwipeNSwap',
      home: Scaffold(body: HomePage())));
}
