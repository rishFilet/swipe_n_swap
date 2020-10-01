import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

enum LongButtonStyle { primary, secondary }

class LongButton extends StatelessWidget {
  final String title, icon;
  final void Function() action;
  final LongButtonStyle style;

  const LongButton(this.title,
      {this.action, this.icon, LongButtonStyle style = LongButtonStyle.primary})
      : style = style;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      minWidth: double.infinity,
      child: FlatButton(
        onPressed: action,
        child: _buildChild(),
        color: style == LongButtonStyle.primary
            ? Constants.kLightBackgroundColor
            : Colors.white,
        splashColor: style == LongButtonStyle.primary
            ? Constants.kBackgroundColor
            : Colors.white,
        highlightColor: style == LongButtonStyle.primary
            ? Constants.kBackgroundColor
            : Colors.white,
      ),
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
