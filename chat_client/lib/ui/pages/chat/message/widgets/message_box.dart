import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/core/models/chat/message/message_model.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final MessageModel message;
  const MessageBox({super.key, required this.message});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends BaseWidget<MessageBox> {
  @override
  Widget build(BuildContext context) {
    final userId = widget.message.user?.id ?? 0;

    return Container(
      child: Row(
        mainAxisAlignment: isSender(userId) ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSender(userId) ? SizedBox.shrink() : _buildAvatar(),
          isSender(userId) ? SizedBox.shrink() : SizedBox(width: 10),
          Column(
            crossAxisAlignment:
                isSender(userId) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                '@${widget.message.user!.userName}',
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: themeData.primaryColor),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: isSender(userId) ? Radius.circular(12) : Radius.zero,
                    bottomRight: isSender(userId) ? Radius.zero : Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: isSender(userId) ? Colors.indigo.shade300 : Colors.cyan.shade100,
                ),
                constraints: BoxConstraints(maxWidth: dynamicWidth(.6)),
                child: Text(
                  '${widget.message.message}',
                  style: TextStyle(
                    color: isSender(userId) ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          isSender(userId) ? SizedBox(width: 10) : SizedBox.shrink(),
          isSender(userId) ? _buildAvatar() : SizedBox.shrink(),
        ],
      ),
    );
  }

  bool isSender(int userId) {
    return AuthHelper.getUserId() == userId;
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      child: Icon(Icons.person),
    );
  }
}
