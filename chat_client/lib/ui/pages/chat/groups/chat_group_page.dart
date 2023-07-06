import 'package:chat_client/core/base/base_view.dart';
import 'package:chat_client/core/viewmodels/chat/chat_group_viewmodel.dart';
import 'package:chat_client/ui/pages/chat/groups/widgets/create_group_dialog.dart';
import 'package:chat_client/ui/pages/chat/groups/widgets/group_card.dart';
import 'package:flutter/material.dart';

class ChatGroupPage extends StatefulWidget {
  const ChatGroupPage({super.key});

  @override
  State<ChatGroupPage> createState() => _ChatGroupPageState();
}

class _ChatGroupPageState extends State<ChatGroupPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatGroupViewModel>(
      onModelReady: (model) {
        model.getGroups();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () => model.getGroups(),
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GroupCard(
                    model: model,
                    group: model.groups[index],
                  );
                },
                itemCount: model.groups.length,
              ),
            ),
          ),
          floatingActionButton: _buildFAB(model),
        );
      },
    );
  }

  FloatingActionButton _buildFAB(ChatGroupViewModel model) {
    return FloatingActionButton(
      onPressed: () async {
        showDialog<void>(
          context: context,
          builder: (context) => CreateGroupDialog(model: model),
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(.65),
        );
      },
      child: Icon(Icons.group_add),
    );
  }
}
