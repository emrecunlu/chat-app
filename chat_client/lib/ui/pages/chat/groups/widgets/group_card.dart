import 'package:chat_client/core/models/chat/group/group_model.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/viewmodels/chat/chat_group_viewmodel.dart';
import 'package:chat_client/ui/pages/chat/message/chat_message_page.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final ChatGroupViewModel model;
  final GroupModel group;
  const GroupCard({super.key, required this.model, required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          NavigationService.nextScreen(
            ChatMessagePage(group: group),
          );
        },
        leading: CircleAvatar(
          child: Text(getAvatarTitle(group.title)),
        ),
        trailing: Icon(Icons.navigate_next),
        title: Text("${group.title}"),
        subtitle: Text('Oluşturan: @${group.creative}'),
      ),
    );
  }

  String getAvatarTitle(String title) {
    List<String> words = title.split(" ");
    debugPrint(words.toString());
    if (words.length > 1) {
      return words[0][0].toUpperCase() + words[1][0].toUpperCase();
    }

    return words[0][0].toUpperCase();
  }
}
