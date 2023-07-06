import 'package:chat_client/core/base/base_view.dart';
import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/core/viewmodels/chat/chat_viewmodel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends BaseWidget<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        SocketService.instance.connect();
        debugPrint("emre");
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(model),
          body: PageView(
            controller: model.pageController,
            children: model.pageList.map((e) => e.page as Widget).toList(),
            onPageChanged: (value) {
              model.setActivePage(value);
            },
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(ChatViewModel model) {
    return AppBar(
      title: Text(model.pageList[model.activePage].title),
      actions: [
        IconButton(
          onPressed: () {
            model.signOut();
          },
          icon: Icon(Icons.logout),
        )
      ],
    );
  }
}
