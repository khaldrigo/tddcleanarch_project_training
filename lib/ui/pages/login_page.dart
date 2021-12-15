import 'package:flutter/material.dart';

import '../components/components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(),
            Headline1(
              text: "Login",
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        icon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          icon: Icon(Icons.lock,
                              color: Theme.of(context).primaryColorLight),
                        ),
                        obscureText: true,
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (_) => Theme.of(context).primaryColor),
                          shape: MaterialStateProperty.resolveWith((_) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          padding: MaterialStateProperty.resolveWith((_) =>
                              const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20)),
                        ),
                        onPressed: () {},
                        child: Text('Entrar'.toUpperCase())),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person,
                          color: Theme.of(context).primaryColor),
                      label: Text(
                        'Criar conta',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
