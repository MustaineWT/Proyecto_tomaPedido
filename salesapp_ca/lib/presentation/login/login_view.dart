import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';
import 'package:salesapp_ca/presentation/home/home_view.dart';
import 'package:salesapp_ca/utils/colors_constants.dart';
import 'package:salesapp_ca/utils/navigator_utils.dart';

import 'cubit/loginPass_cubit.dart';
import 'cubit/login_cubit.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/CurvePainter.dart';
import 'local_widget/TextFieldPassword.dart';
import 'local_widget/TextFieldUserName.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(context.read())..init()),
        BlocProvider(
          create: (_) => LoginCubitPass(),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, snapshot) {
          switch (snapshot) {
            case LoginState.none:
              print('none');
              break;
            case LoginState.existing_user:
              pushAndReplaceToPage(context, HomeView());
              break;
            case LoginState.failed:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Información'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Usuario y/o Contraseña incorrecto.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Si'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              break;
            case LoginState.typing:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Información'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Debe ingresar usuario y contraseña.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Si'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              break;
            case LoginState.error:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Información'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Servidor sin respuesta.'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Si'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              break;
          }
        },
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.blue[900]!,
                  Colors.blue[800]!,
                  Colors.blue[600]!,
                ])),
                child: CustomPaint(
                  painter: CurvePainter(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Sales App',
                                style: TextStyle(color: blackv2, fontSize: 40)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Bienvenidos',
                                style: TextStyle(color: blackv2, fontSize: 20))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: blackv2,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    30, 144, 255, .3),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          TextFieldUserName(
                                            usuarioController: context
                                                .read<AuthUseCase>()
                                                .usernameController,
                                            onChangedUserName: context
                                                .read<AuthUseCase>()
                                                .changedUserName,
                                          ),
                                          BlocBuilder<LoginCubitPass, bool>(
                                            builder: (contxt, snapshot) {
                                              return TextFieldPassword(
                                                passwordController: context
                                                    .read<AuthUseCase>()
                                                    .passwordController,
                                                secureText: snapshot,
                                                onPressedIcon: contxt
                                                    .read<LoginCubitPass>()
                                                    .viewPass,
                                                onChangedPasssword: context
                                                    .read<AuthUseCase>()
                                                    .changedPassword,
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            '¿Perdiste tu contraseña?',
                                            style: TextStyle(
                                                fontFamily: 'Oswald',
                                                color: gray,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          ButtonLogin(
                                            value: true,
                                            onSubmit: context
                                                .read<LoginCubit>()
                                                .onSubmit,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            //  onTap: _.onSignUp,
                                            child: Text(
                                              'Registrate',
                                              style: TextStyle(
                                                  fontFamily: 'Oswald',
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
