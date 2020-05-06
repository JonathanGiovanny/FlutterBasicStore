import 'package:basic_store/screens/register/RegisterPage.dart';
import 'package:basic_store/screens/shared/CustomLinkedCenteredText.dart';
import 'package:flutter/material.dart';
import 'package:basic_store/model/CustomException.dart';
import 'package:basic_store/model/auth_models.dart';
import 'package:basic_store/screens/InterceptorPage.dart';
import 'package:basic_store/services/services.dart';
import 'package:dartz/dartz.dart' as _;

class SingInFormSection extends StatefulWidget {
  @override
  _SingIFormonState createState() => _SingIFormonState();
}

class _SingIFormonState extends State<SingInFormSection> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              validator: (value) => value.isEmpty ? 'Enter an Email' : null,
              decoration: InputDecoration(
                labelText: 'User',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              validator: (value) =>
                  value.length < 6 ? 'Enter 6+ characters' : null,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: _buildButtonContent(),
              onPressed: _singInOnPressedAction(),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomLinkedCenteredText(
              text: 'Forgot your password?',
              onTapAction: () =>
                  Navigator.of(context).pushNamed(RegisterPage.routeName),
              style: TextStyle(color: Colors.grey),
            ),
            CustomLinkedCenteredText(
              text: 'Don\'t have an account? Register',
              onTapAction: () =>
                  Navigator.of(context).pushNamed(RegisterPage.routeName),
            ),
          ],
        ),
      ),
    );
  }

  Function _singInOnPressedAction() =>
      isLoading ? null : () => _loginFunction();

  Widget _buildButtonContent() {
    if (!isLoading) {
      return Text(
        'Login',
        style: Theme.of(context).accentTextTheme.subtitle,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
        ),
      );
    }
  }

  void _loginFunction() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      print('Loging in');
      _.Either<CustomException, User> user = await _authService.singIn(
          _usernameController.text.trim(), _passwordController.text);
      user.fold(
        (exception) => _failedSingIn(exception),
        (user) => _successSingIn(),
      );
    }
  }

  void _successSingIn() =>
      Navigator.of(context).popAndPushNamed(InterceptorPage.routeName);

  void _failedSingIn(CustomException ex) {
    final String message = ex.userMessage;
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$message'),
      ),
    );
    setState(() {
      isLoading = false;
    });
  }
}
