import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

class BaseTextForm extends StatelessWidget {
  final String header;
  final String Function(String) validator;
  final Function(String) onSaved;
  final bool obscureText;

  const BaseTextForm(
      {this.header, this.validator, this.onSaved, bool obscureText = false})
      : obscureText = obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [];

    if (header != null) {
      children.add(
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            header,
            style: Constants.kTextDefaultStyle,
            textAlign: TextAlign.start,
          ),
        ),
      );
    }

    children.add(
      TextFormField(
        decoration: InputDecoration(
          fillColor: Color(0xFFF1F1F1),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Constants.kTextColor,
          fontSize: 14,
        ),
        validator: validator,
        onSaved: onSaved,
        obscureText: obscureText,
      ),
    );

    return children;
  }
}