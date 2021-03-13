import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';
import 'package:salesapp_ca/presentation/login/cubit/login_cubit.dart';

import 'local_widget/AppBarPersonalize.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => LoginCubitLogout(context.read()),
        child: BlocConsumer<LoginCubitLogout, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(size.width, 40),
                child: AppBarPersonalize(
                  onlogout: context.read<LoginCubitLogout>().onLogout,
                  value: 1,
                  title: 'hola',
                  //onChange: (){},
                  valor: 1,
                ),
              ),
              drawer: Drawer(
                elevation: 16.0,
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
              ),
            );
          },
        ));
  }
}
