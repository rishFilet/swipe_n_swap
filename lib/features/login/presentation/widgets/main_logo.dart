import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

class MainLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.0,
      height: 156.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFC4C4C4),
      ),
      child: Center(
        child: Text(
          'logo/name',
          style: Constants.kTextDefaultStyle,
        ),
      ),
    );
  }
}
