import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/pages/home_page.dart';
import 'package:foodaholic_app_v/providers/provider_bloc.dart';
import 'package:foodaholic_app_v/providers/user_provider.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/utils/utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    new LoginProvider();
    return Container(
      child: Scaffold(
        backgroundColor: ThemeMain().primaryfond,
        body: Stack(
          children: [
            BackgroundPage.getBackground(context),
            _getFormLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _getFormLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = LoginProvider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: 180.0)),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: size.width * .80,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 3.0,
                        offset: Offset(0.0, 5.0),
                        spreadRadius: 3.0)
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text('Inicio de sesión',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Theme.of(context).primaryColorDark)),
                ),
                SizedBox(height: 25.0),
                _getEmail(bloc),
                SizedBox(height: 25.0),
                _getPassword(bloc),
                SizedBox(height: 25.0),
                _getSubmit(bloc),
                SizedBox(height: 25.0),
              ])),
        ],
      ),
    );
  }

  Widget _getEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
              icon:
                  Icon(Icons.email, color: Theme.of(context).primaryColorDark),
              hintText: 'usuario@hotmail.com',
              labelText: 'Correo electrónico',
              errorText: snapshot.error),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _getPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColorDark),
              labelText: 'Contraseña',
              errorText: snapshot.error),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget _getSubmit(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Ingresar'),
            ),
            textColor: Theme.of(context).primaryColorDark,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: snapshot.hasData ? () => _submit(bloc, context) : null);
      },
    );
  }

  _submit(LoginBloc bloc, BuildContext context) async {
    Map info = await userProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print(info['message']);
    }
  }
}
