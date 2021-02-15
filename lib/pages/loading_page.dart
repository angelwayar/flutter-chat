import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import 'usuarios_pages.dart';
import 'login_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if(autenticado) {
      //TODO: Conectar al socket server
      // Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_, __, ___,) => UsuarioPage(),
        transitionDuration: Duration(milliseconds: 0)
      ));
    } else {
       Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_, __, ___,) => LoginPage(),
        transitionDuration: Duration(milliseconds: 0)
      ));
    }
  }
}
