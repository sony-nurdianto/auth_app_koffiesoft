import 'package:flutter/material.dart';

class DialogInfo extends StatelessWidget {
  final String dialgoText;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  const DialogInfo({super.key, required this.dialgoText, required this.icon , this.backgroundColor = Colors.white, this.iconColor = const Color.fromARGB(255, 203, 24, 11)});

  @override
  Widget build(BuildContext context) {
    return  Dialog(
        backgroundColor: backgroundColor,
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 100, color: iconColor),
             const SizedBox(
                height: 20,
              ),
               Text(
                dialgoText,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              )
            ],
          ),
        ),
      );
  }
}
void customShowDialogInfo(BuildContext context , {String dialgoText = '', IconData icon = Icons.check, backgroundColor = Colors.white, iconColor = const Color.fromARGB(255, 203, 24, 11)} ) {
  showDialog(
    context: context,
    builder: (context) {
      return  DialogInfo(dialgoText: dialgoText, icon: icon ,backgroundColor: backgroundColor,iconColor: iconColor,);
    },
  );
}
