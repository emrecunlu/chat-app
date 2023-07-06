import 'package:chat_client/core/services/navigation_service.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String text;
  final String navigationText;
  final Widget page;
  
  const NavigationText({
    super.key,
    required this.text,
    required this.navigationText,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              NavigationService.replaceScreen(page);
            },
            child: Text(
              navigationText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      width: double.infinity,
    );
  }
}
