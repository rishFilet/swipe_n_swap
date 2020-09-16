import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../presentation/widgets/photo_holder.dart';
import '../../presentation/widgets/home_page_buttons.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          PhotoHolder(),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomePageButtons(buttonAction: 'message'),
              HomePageButtons(buttonAction: 'like'),
              HomePageButtons(buttonAction: 'profile')
            ],
          ))
        ],
      ),
    ));
  }
}
