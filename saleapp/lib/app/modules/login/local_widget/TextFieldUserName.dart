import 'package:flutter/material.dart';

class TextFieldUserName extends StatelessWidget {
  const TextFieldUserName({
    Key? key,
    required this.onChangedUserName,
    required this.value,
    required this.usuarioController,
  }) : super(key: key);
  final Function(String) onChangedUserName;
  final bool value;
  final TextEditingController usuarioController;

  @override
  Widget build(BuildContext context) {
    String _errorMessage = 'No ingreso un Usuario';
    var _formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: usuarioController,
          onChanged: onChangedUserName,
          decoration: InputDecoration(
            hintText: 'Usuario',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            errorText: value ? null : _errorMessage,
          ),
        ),
      ),
    );
  }
}
