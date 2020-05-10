import 'package:basic_store/model/auth_models.dart';
import 'package:basic_store/model/models.dart';
import 'package:basic_store/screens/InterceptorPage.dart';
import 'package:basic_store/screens/register/RegisterPage.dart';
import 'package:basic_store/screens/screens.dart';
import 'package:basic_store/services/database/ItemsRepository.dart';
import 'package:basic_store/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
        StreamProvider<List<Item>>.value(value: ItemsRepository().items),
        ChangeNotifierProvider<CartBloc>.value(value: CartBloc()),
      ],
      child: MaterialApp(
        title: 'Basic Store',
        theme: _buildTheme(),
        routes: {
          RegisterPage.routeName: (context) => RegisterPage(),
          InterceptorPage.routeName: (context) => InterceptorPage(),
          DetailPage.routeName: (context) => DetailPage(),
          SettingPage.routeName: (context) => SettingPage(),
        },
      ),
    );
  }

  ThemeData _buildTheme() => ThemeData(
      primarySwatch: Colors.indigo,
      disabledColor: Colors.indigo[200],
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      secondaryHeaderColor: Colors.red,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.red[400],
      ));
}
