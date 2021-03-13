import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword(
      {Key? key,
      required this.onChangedPasssword,
      required this.value,
      required this.passwordController,
      required this.onPressedIcon,
      required this.secureText})
      : super(key: key);
  final Function(String) onChangedPasssword;
  final bool value;
  final bool secureText;
  final TextEditingController passwordController;
  final Function() onPressedIcon;

  @override
  Widget build(BuildContext context) {
    String _errorMessage = 'No ingreso una Contraseña';
    var _formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: passwordController,
          onChanged: onChangedPasssword,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            errorText: value ? null : _errorMessage,
            suffixIcon: IconButton(
              icon: Icon(secureText ? Icons.remove_red_eye : Icons.security),
              onPressed: onPressedIcon,
            ),
          ),
          obscureText: secureText,
        ),
      ),
    );
  }
}
