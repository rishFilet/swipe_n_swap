import 'package:flutter/material.dart';

class BackButtonNavBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: IconButton(
        padding: EdgeInsets.only(left: 16),
        icon: Icon(Icons.arrow_back),
        splashColor: Colors.white,
        highlightColor: Colors.white,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
