import 'package:flutter/material.dart';
import '../pages/home.dart';
// This uses the IconButton class seen here https://api.flutter.dev/flutter/material/IconButton-class.html

class HomePageButton extends StatelessWidget {
  var buttonAction;
  var iconToShow;
  var pageToRoute;

  // This initialises the vaiables
  HomePageButton({this.buttonAction, this.iconToShow, this.pageToRoute});

  void checkTypeOfButtonActionToDisplay() {
    if (this.buttonAction == ButtonActionName.message) {
      this.iconToShow = Icon(Icons.chat);
      this.pageToRoute = "Going to chat";
    } else if (this.buttonAction == ButtonActionName.like) {
      this.iconToShow = Icon(Icons.favorite);
      this.pageToRoute = "Liking the page";
    } else if (this.buttonAction == ButtonActionName.profile) {
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
        ),
      ),
    );
  }
}
