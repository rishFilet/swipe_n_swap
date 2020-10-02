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
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            style == LongButtonStyle.primary
                ? Constants.kLightBackgroundColor
                : Colors.white,
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            style == LongButtonStyle.primary
                ? Constants.kBackgroundColor
                : Colors.white,
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 45)),
        ),
      ),
      child: TextButton(
        onPressed: action,
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    Text titleWidget = Text(title, style: Constants.kTextDefaultStyle);

    if (icon == null) {
      return titleWidget;
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
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
        ),
      );
    }
  }
}
