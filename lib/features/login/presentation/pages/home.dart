import 'package:flutter/material.dart';

import '../../presentation/widgets/photo_holder.dart';
import '../../presentation/widgets/home_page_buttons.dart';

enum ButtonActionName {
  message,
  like,
  profile,
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                PhotoHolder(),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomePageButton(buttonAction: ButtonActionName.message),
                      HomePageButton(buttonAction: ButtonActionName.like),
                      HomePageButton(buttonAction: ButtonActionName.profile),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
