import 'package:flutter/material.dart';

class TextFieldPerzonalice extends StatelessWidget {
  const TextFieldPerzonalice({
    Key? key,
    required this.onChangedPerzonalice,
    required this.value,
    required this.perzonaliceController,
    required this.labelText,
    required this.errorMessage,
  }) : super(key: key);
  final Function(String) onChangedPerzonalice;
  final bool value;
  final TextEditingController perzonaliceController;
  final String labelText;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    String _errorMessage = errorMessage;
    return Container(
      height: 75,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: TextFormField(
        controller: perzonaliceController,
        onChanged: onChangedPerzonalice,
        decoration: InputDecoration(
          labelText: labelText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          errorText: value ? null : _errorMessage,
        ),
      ),
    );
  }
}
