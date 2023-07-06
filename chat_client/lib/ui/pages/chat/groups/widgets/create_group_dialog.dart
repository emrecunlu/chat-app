import 'package:chat_client/core/viewmodels/chat/chat_group_viewmodel.dart';
import 'package:flutter/material.dart';

class CreateGroupDialog extends StatelessWidget {
  final ChatGroupViewModel model;
  const CreateGroupDialog({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Grup Oluştur"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: model.form.fields["title"],
            decoration: InputDecoration(
              labelText: "Başlık",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              model.createGroup();
            },
            child: Text("Oluştur")),
      ],
    );
  }
}
