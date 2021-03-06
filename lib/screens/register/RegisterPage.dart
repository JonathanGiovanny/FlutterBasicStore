import 'package:basic_store/screens/register/RegisterFormSection.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildHeader(context),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: RegisterFormSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(350, 30),
            ),
            color: Theme.of(context).accentColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundColor: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.person_add,
                size: 40,
              ),
            ),
            SizedBox(height: 35.0),
          ],
        ),
      );
}
