import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String hint;
  var textController;
  bool numberInput;
  InputField({this.hint, this.textController, this.numberInput});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20.0),
        child: TextFormField(
          controller: textController,
          keyboardType: this.numberInput? TextInputType.number : TextInputType.text,
          style: TextStyle(fontFamily: "Poppins", fontSize: 12),
          cursorColor: Colors.grey,
          decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              labelText: this.hint,
              labelStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
