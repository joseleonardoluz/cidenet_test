import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    Key key,
    @required this.labelText,
    @required this.textController,
    this.keyboardType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 17, bottom: 9),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[800]))),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor complete el campo';
            }
            return null;
          },
          controller: textController,
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 14),
          keyboardType: this.keyboardType,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: this.labelText,
              labelStyle: TextStyle(
                  color: Colors.black, decoration: TextDecoration.none)),
        ));
  }
}
