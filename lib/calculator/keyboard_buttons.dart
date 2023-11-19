import 'constants.dart';
import "package:flutter/material.dart";

typedef void CallbackButtonTap({String buttonText});

class KeyboardButtons extends StatelessWidget {
  KeyboardButtons({required this.buttons, required this.onTap});

  final List<String> buttons;
  final CallbackButtonTap onTap;

  bool _colorTextButtons(String button) {
    return (button == DEL_SIGN ||
        button == DECIMAL_POINT_SIGN ||
        button == CLEAR_ALL_SIGN ||
        button == MODULAR_SIGN ||
        button == PLUS_SIGN ||
        button == MINUS_SIGN ||
        button == MULTIPLICATION_SIGN ||
        button == DIVISION_SIGN ||
        button == EXCHANGE_CALCULATOR ||
        button == PI ||
        button == SQUARE_ROOT_SIGN ||
        button == POWER_SIGN ||
        button == LN_SIGN ||
        button == LG_SIGN ||
        button == SIN_SIGN ||
        button == COS_SIGN ||
        button == TAN_SIGN ||
        button == RAD_SIGN ||
        button == DEG_SIGN ||
        button == ARCSIN_SIGN ||
        button == ARCCOS_SIGN ||
        button == ARCTAN_SIGN ||
        button == LN2_SIGN ||
        button == E_NUM ||
        button == LEFT_QUOTE_SIGN ||
        button == RIGHT_QUOTE_SIGN);
  }

  bool _fontSize(String button) {
    return (button == LN_SIGN ||
        button == LG_SIGN ||
        button == SIN_SIGN ||
        button == COS_SIGN ||
        button == TAN_SIGN ||
        button == RAD_SIGN ||
        button == DEG_SIGN ||
        button == ARCSIN_SIGN ||
        button == ARCCOS_SIGN ||
        button == ARCTAN_SIGN ||
        button == LN2_SIGN ||
        button == LEFT_QUOTE_SIGN ||
        button == RIGHT_QUOTE_SIGN);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 190, 214, 224), // Standard calculator background color
          shape: BoxShape.circle, // Circular shape
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent, // No background color
            padding: EdgeInsets.all(15.0), // Adjust padding as needed
          ),
          onPressed: () => onTap(buttonText: buttons[0]),
          child: Text(
            buttons[0],
            style: TextStyle(
              color: _colorTextButtons(buttons[0])
                  ? Color.fromARGB(255, 233, 106, 216)
                  : Color.fromARGB(
                      255, 29, 31, 51), // Set button text color to green
              fontSize: _fontSize(buttons[0]) ? 18 : 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
