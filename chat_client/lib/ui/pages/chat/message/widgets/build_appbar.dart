import 'package:chat_client/core/models/chat/group/group_model.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(GroupModel group) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        NavigationService.back();
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${group.title}',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '@${group.creative}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.75),
          ),
        ),
      ],
    ),
  );
}
