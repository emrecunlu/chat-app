import 'package:chat_client/core/viewmodels/chat/chat_message_viewmodel.dart';
import 'package:flutter/material.dart';

class MessageSendField extends StatelessWidget {
  final ChatMessageViewModel model;
  const MessageSendField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          _buildSendField(),
          SizedBox(width: 20),
          _buildImageIcon(),
        ],
      ),
    );
  }

  Widget _buildImageIcon() {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.camera_alt_outlined,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildSendField() {
    return Expanded(
      child: TextField(
        controller: model.form.fields["message"],
        onEditingComplete: () {
          model.sendMessage();
        },
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: "Type your message..",
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(36))),
        ),
      ),
    );
  }
}
