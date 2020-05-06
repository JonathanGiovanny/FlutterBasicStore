import 'package:basic_store/screens/InterceptorPage.dart';
import 'package:flutter/material.dart';
import 'package:basic_store/model/CustomException.dart';
import 'package:basic_store/model/auth_models.dart';
import 'package:basic_store/services/services.dart';
import 'package:dartz/dartz.dart' as _;

class RegisterFormSection extends StatefulWidget {
  @override
  _RegisterFormonState createState() => _RegisterFormonState();
}

class _RegisterFormonState extends State<RegisterFormSection> {
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
              validator: (value) =>
                  value.length < 6 ? 'Enter 6+ characters' : null,
              controller: _passwordController,
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
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text('Already have an account? Log in'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Function _singInOnPressedAction() =>
      isLoading ? null : () => _registerFunction();

  Widget _buildButtonContent() {
    if (!isLoading) {
      return Text(
        'Register',
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

  void _registerFunction() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      print(_usernameController.text);
      print(_passwordController.text);
      _.Either<CustomException, User> result = await _authService.register(
          _usernameController.text.trim(), _passwordController.text);
      result.fold(
        (exception) => _failedRegister(exception),
        (user) => _successRegister(),
      );
    }
  }

  void _successRegister() =>
      Navigator.of(context).popAndPushNamed(InterceptorPage.routeName);

  void _failedRegister(CustomException ex) {
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
