import 'package:chat_client/core/base/base_viewmodel.dart';
import 'package:chat_client/core/models/common/page_view_model.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:chat_client/ui/pages/auth/login/login_page.dart';
import 'package:chat_client/ui/pages/chat/groups/chat_group_page.dart';
import 'package:chat_client/ui/pages/chat/profile/chat_profile_page.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends BaseViewModel {
  final _pageController = PageController();
  final List<PageViewModel> _pageList = [
    PageViewModel(title: "Grup", page: ChatGroupPage()),
    PageViewModel(title: "Profil", page: ChatProfilePage())
  ];
  int _activePage = 0;

  int get activePage => _activePage;
  List<PageViewModel> get pageList => _pageList;
  PageController get pageController => _pageController;

  void setActivePage(int val) {
    _activePage = val;
    notifyListeners();
  }

  Future<void> signOut() async {
    await AuthHelper.signOut();
  }
}
