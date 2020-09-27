import 'package:flutter/material.dart';
import 'package:swipe_swap/utilities/constants.dart';

typedef _LongButtonAction();

class LongButton extends StatelessWidget {
  final String title, icon;
  final _LongButtonAction action;

  LongButton(this.title, {this.action, this.icon});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: action,
      child: _buildChild(),
      color: Color(0xFFD0D0D0),
      height: 45,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }

  Widget _buildChild() {
    Text titleWidget = Text(title, style: Constants.kTextDefaultStyle);

    if (icon == null) {
      return titleWidget;
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(icon),
            width: 28,
            height: 28,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Center(
              child: titleWidget,
            ),
          ),
        ],
      );
    }
  }
}
