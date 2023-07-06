import 'dart:async';

import 'package:chat_client/core/base/base_viewmodel.dart';
import 'package:chat_client/core/models/chat/message/dto/message_create_dto.dart';
import 'package:chat_client/core/models/chat/message/message_model.dart';
import 'package:chat_client/core/repositories/chat/message/message_repository.dart';
import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';
import 'package:flutter/material.dart';

class ChatMessageViewModel extends BaseViewModel {
  final FormHelper form = FormHelper({"message"});
  final MessageRepository _messageRepository = locator<MessageRepository>();
  final ScrollController _scrollController = ScrollController();
  List<MessageModel> _messages = [];
  int? _groupId;

  List<MessageModel> get messages => _messages;
  ScrollController get scrollController => _scrollController;

  void setGroupId(int val) {
    _groupId = val;
  }

  ChatMessageViewModel() {
    SocketService.instance.socket!.on("group-message", (data) {
      final message = MessageModel.fromJson(data);
      _messages.add(message);

      notifyListeners();

      Future.delayed(Duration(milliseconds: 200), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      });
    });
  }

  Future<void> getMessages() async {
    var result = await _messageRepository.getAll(_groupId ?? 0);

    if (!result.success) return;

    _messages = result.data!;
    notifyListeners();

    Future.delayed(Duration(milliseconds: 200), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  Future<void> sendMessage() async {
    Map<String, dynamic> json = form.toJson();
    json["groupId"] = _groupId;

    var result = await _messageRepository.add(MessageCreateDto.fromJson(json));

    debugPrint(result.toJson().toString());

    if (!result.success) return;

    SocketService.instance.socket!.emit("group-message", result.data!.toJson());

    form.resetForm();
  }
}
