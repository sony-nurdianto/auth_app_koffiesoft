import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final Function()? onPressed;
  final double minWidth;
  final double maxWidth;
  final double height;
  final String buttonText;
  final Color backgroundColor;
  final double buttonTextSize;
  final Color buttonTextColors;


  const CustomElevatedButton({
    this.onPressed,
    this.minWidth = 0,
    this.maxWidth = 0,
    this.height = 0,
    this.buttonText = '',
    this.backgroundColor = Colors.transparent,
    this.buttonTextColors = Colors.black,
    this.buttonTextSize = 12,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      constraints:  BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize:  Size(double.infinity, height),
            ),
        onPressed: onPressed,
        child:  Text(
          buttonText,
          style: TextStyle(fontSize: buttonTextSize, color: buttonTextColors),
        ),
      ),
    );
  }
}
