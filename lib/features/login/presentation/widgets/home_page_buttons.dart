import 'package:flutter/material.dart';

// This uses the IconButton class seen here https://api.flutter.dev/flutter/material/IconButton-class.html

class HomePageButtons extends StatelessWidget {
  final String buttonAction;
  var iconToShow;
  var pageToRoute;

  // This initialises the vaiables
  HomePageButtons({this.buttonAction, this.iconToShow, this.pageToRoute});

  void checkTypeOfButtonActionToDisplay() {
    if (this.buttonAction == 'message') {
      this.iconToShow = Icon(Icons.chat);
      this.pageToRoute = "Going to chat";
    } else if (this.buttonAction == 'like') {
      this.iconToShow = Icon(Icons.favorite);
      this.pageToRoute = "Liking the page";
    } else if (this.buttonAction == 'profile') {
      this.iconToShow = Icon(Icons.account_circle);
      this.pageToRoute = "Going to Account page";
    }
  }

  @override
  Widget build(BuildContext context) {
    checkTypeOfButtonActionToDisplay();
    return Expanded(
        child: Center(
            child: IconButton(
      icon: this.iconToShow,
      onPressed: () {
        print(this.pageToRoute);
      },
      splashColor: Colors.deepOrangeAccent,
      splashRadius: 50,
      tooltip: this.pageToRoute,
      iconSize: 60,
    )));
  }
}
