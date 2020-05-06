import 'package:basic_store/screens/screens.dart';
import 'package:basic_store/services/services.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Username'),
              accountEmail: Text('Account Email@gmail.com')),
          _buildTile(context, Icons.home, 'Home', _homeAction(context)),
          _buildTile(context, Icons.person, 'My profile', _homeAction(context)),
          _buildTile(context, Icons.settings, 'Settings',
              _redirectAction(context, SettingPage.routeName)),
          Divider(),
          _buildTile(
              context, Icons.exit_to_app, 'Log out', _singOutAction(context)),
        ],
      ),
    );
  }

  Function _redirectAction(BuildContext context, String route) =>
      () => Navigator.of(context).pushNamed(route);
  Function _homeAction(BuildContext context) => () => Navigator.popUntil(
        context,
        ModalRoute.withName(Navigator.defaultRouteName),
      );
  Function _singOutAction(BuildContext context) => () async {
        await _auth.singOut();
        Navigator.popUntil(
            context, ModalRoute.withName(Navigator.defaultRouteName));
      };

  Widget _buildTile(
    BuildContext context,
    IconData icon,
    String text,
    Function onTapAction,
  ) =>
      ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () => onTapAction(),
      );
}
