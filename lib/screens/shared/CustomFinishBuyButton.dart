import 'package:flutter/material.dart';

class CustomFinishBuyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75.0),
          color: Theme.of(context).secondaryHeaderColor),
      child: FlatButton(
        onPressed: () => _finishBuy(context),
        child: Text(
          'Finish Buy',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  void _finishBuy(BuildContext context) {
    Navigator.of(context).pushNamed('/');
  }
}
