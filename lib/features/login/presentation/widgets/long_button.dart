import 'package:flutter/material.dart';

typedef _LongButtonAction();

class LongButton extends StatelessWidget {
  final String title;
  final _LongButtonAction action;

  LongButton(this.title, {this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: FlatButton(
          onPressed: action,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          color: Color(0xFFD0D0D0),
          height: 45,
	  minWidth: 236,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
