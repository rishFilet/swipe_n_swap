import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

typedef _LongButtonAction();

enum LongButtonStyle { primary, secondary }

class LongButton extends StatelessWidget {
  final String title, icon;
  final _LongButtonAction action;
  final LongButtonStyle style;

  const LongButton(this.title,
      {this.action, this.icon, LongButtonStyle style = LongButtonStyle.primary})
      : style = style;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: action,
      child: _buildChild(),
      color: style == LongButtonStyle.primary ? Color(0xFFD0D0D0) : Colors.white,
      splashColor: style == LongButtonStyle.primary ? Color(0xFFADADAD) : Colors.white,
      highlightColor: style == LongButtonStyle.primary ? Color(0xFFADADAD) : Colors.white,
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