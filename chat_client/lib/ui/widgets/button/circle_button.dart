import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback onTap;
  const CircleButton({super.key, required this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape: StadiumBorder(),
        ),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            icon != null ? SizedBox(width: 15) : SizedBox.shrink(),
            icon != null ? icon! : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
