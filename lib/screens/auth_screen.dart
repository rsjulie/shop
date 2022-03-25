import 'package:flutter/material.dart';
import 'package:shop/components/auth_form.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(160, 183, 0, 255),
              Color.fromARGB(176, 0, 81, 255),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 146, 0, 204),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Text(
                    'Minha loja',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Anton',
                      color: Theme.of(context).accentTextTheme.headline6?.color,
                    ),
                  ),
                ),
                AuthForm(),
              ]),
        )
      ]),
    );
  }
}
