import 'package:flutter/material.dart';

class OuntlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool isFilled;

  const OuntlinedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = Colors.blue,
      this.isFilled = false,
     required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          side: MaterialStateProperty.all(BorderSide(color: color)),
          backgroundColor: MaterialStateProperty.all(
              isFilled?  color.withOpacity(0.5) : Colors.transparent),
        ),
        onPressed: () => onPressed(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: textColor),
          ),
        ));
  }
}
