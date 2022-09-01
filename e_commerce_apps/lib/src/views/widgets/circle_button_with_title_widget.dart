import 'package:e_commerce_apps/src/views/widgets/circle_button_widget.dart';
import 'package:flutter/material.dart';

class CircleButtonWithTitle extends StatelessWidget {
  const CircleButtonWithTitle({required this.icon,required this.title});

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleButtonWidget(
          child: Icon(icon),
        ),
        const SizedBox(height: 12),
        Text(title),
      ],
    );
    ;
  }
}
