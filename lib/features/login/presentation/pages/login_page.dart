import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/size_config.dart';

class LoginPage2 extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig(context); // initializing SizeConfig
    final double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * Constants.kDefaultPaddingMultiplier,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              Constants.kAppTitle,
              style: TextStyle(
                color: Constants.kTextColor,
                fontSize: defaultSize * 4,
              ),
            ),
            SizedBox(height: defaultSize),
            Text(
              'Log in to find the best trades',
              style: TextStyle(
                color: Constants.kTextLightColor,
                fontSize: defaultSize * 1.6,
              ),
            ),
            SizedBox(
              height: defaultSize * Constants.kDefaultPaddingMultiplier * 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo would go here
                      Text(
                        'Google',
                        style: TextStyle(
                          color: Constants.kTextColor,
                          fontSize: defaultSize * 1.8,
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                  height: 48,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(color: Colors.grey),
                  ),
                  minWidth: SizeConfig.screenWidth * 0.44,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo would go here
                      Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: defaultSize * 1.8,
                        ),
                      ),
                    ],
                  ),
                  color: Color(0xFF3C5A99),
                  height: 48,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  minWidth: SizeConfig.screenWidth * 0.44,
                ),
              ],
            ),
            SizedBox(
                height:
                    defaultSize * Constants.kDefaultPaddingMultiplier * 2.5),
            Text(
              'Or log in with Email',
              style: TextStyle(
                color: Constants.kTextLightColor,
                fontSize: defaultSize * 1.5,
              ),
            ),
            SizedBox(height: defaultSize),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      labelStyle: TextStyle(
                        color: Constants.kTextLightColor,
                        fontSize: defaultSize * 1.6,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Constants.kTextColor,
                      fontSize: defaultSize * 1.6,
                    ),
                    validator: (value) =>
                        !value.contains('@') ? "Not a valid email" : null,
                    onSaved: (_) => null, // will send event to Bloc
                  ),
                  SizedBox(
                    height: defaultSize * Constants.kDefaultPaddingMultiplier,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(
                        color: Constants.kTextLightColor,
                        fontSize: defaultSize * 1.6,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Constants.kTextColor,
                      fontSize: defaultSize * 1.6,
                    ),
                    validator: (value) => value.length < 6
                        ? "Must be at least 6 characters long"
                        : null,
                    onSaved: (_) => null,
                    obscureText: true, // will send event to Bloc
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultSize * Constants.kDefaultPaddingMultiplier * 1.7),
            FlatButton(
              onPressed: _manualLogin,
              child: Text(
                'Start swiping for deals!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: defaultSize * 1.6,
                ),
              ),
              color: Color(Constants.kDefaultBlueHexValue),
              height: 48,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              minWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void _manualLogin() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }
  }
}
