import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

      final TextEditingController controller;
      final FocusNode focusNode;
      final String hintText;
      final bool filled;
      final Color fillColor;
      final IconData prefixIcon;
      final Widget? suffixIcon; 
      final double borderRadius;
      final String? Function(String?)? validator;
      final TextInputType? textInputType;
      final bool obscureText;

  const CustomTextField({
    required this.controller,
    required this.focusNode, 
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.filled = false,
    this.fillColor = Colors.white,
    this.prefixIcon = Icons.person,
    this.suffixIcon,
    this.borderRadius = 0,
    this.validator,
    this.obscureText = false
    ,super.key
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        prefixIcon:  Icon(prefixIcon),
        suffixIcon: suffixIcon,
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        
      ),
      
    );
  }
}
