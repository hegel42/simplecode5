import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'character_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final login = 'qwerty';
  final password = '123456ab';

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).tryAgain),
        content: Text(S.of(context).wrongPasswordOrLogin),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(S.of(context).close),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).auth),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            ),
            const Spacer(),
            Text(
              S.of(context).inputLoginAndPassword,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).inputErrorCheckLogin;
                  }

                  if (value.trim().length <= 3) {
                    return S.of(context).inputErrorLoginIsShort;
                  }
                  return null;
                },
                onSaved: (value) {
                  login == value;
                },
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: S.of(context).login,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                maxLength: 16,
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).inputErrorCheckPassword;
                  }

                  if (value.trim().length < 8) {
                    return S.of(context).inputErrorPasswordIsShort;
                  }
                  return null;
                },
                onSaved: (value) {
                  password == value;
                },
                decoration: InputDecoration(
                  hintText: S.of(context).password,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState?.save();
                    if (_usernameController.text == login &&
                        _passwordController.text == password) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CharacterScreen(),
                          // const MyHomePage(title: 'MyApp'),
                        ),
                      );
                    } else {
                      _showErrorDialog();
                    }
                  }
                },
                child: Text(S.of(context).signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
