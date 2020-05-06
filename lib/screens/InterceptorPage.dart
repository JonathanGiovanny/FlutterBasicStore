import 'package:basic_store/model/auth_models.dart';
import 'package:basic_store/screens/discovery/LandingPage.dart';
import 'package:basic_store/screens/login/SingInPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InterceptorPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return _redirectAuth(context, user);
  }

  Widget _redirectAuth(BuildContext context, User user) {
    if (user != null) {
      return LandingPage();
    }
    return SingInPage();
  }
}
