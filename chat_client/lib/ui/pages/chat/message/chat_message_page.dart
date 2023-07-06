import 'package:chat_client/core/base/base_view.dart';
import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/core/models/chat/group/group_model.dart';
import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/core/viewmodels/chat/chat_message_viewmodel.dart';
import 'package:chat_client/ui/pages/chat/message/widgets/build_appbar.dart';
import 'package:chat_client/ui/pages/chat/message/widgets/message_box.dart';
import 'package:chat_client/ui/pages/chat/message/widgets/message_send_field.dart';
import 'package:flutter/material.dart';

class ChatMessagePage extends StatefulWidget {
  final GroupModel group;
  const ChatMessagePage({
    super.key,
    required this.group,
  });

  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends BaseWidget<ChatMessagePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatMessageViewModel>(
      onModelReady: (model) {
        SocketService.instance.socket!.emit("join-group", widget.group.id);
        model.setGroupId(widget.group.id);
        model.getMessages();
      },
      onModelDispose: (model) {
        SocketService.instance.socket!.emit("leave-group", widget.group.id);
        SocketService.instance.socket!.clearListeners();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(widget.group),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMessageList(model),
              MessageSendField(model: model),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessageList(ChatMessageViewModel model) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 0, right: 16, left: 16),
        child: ListView.separated(
          controller: model.scrollController,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return MessageBox(message: model.messages[index]);
          },
          itemCount: model.messages.length,
        ),
      ),
    );
  }
}
