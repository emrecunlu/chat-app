import 'package:chat_client/ui/pages/chat/profile/widgets/select_avatar_circle.dart';
import 'package:chat_client/ui/widgets/button/circle_button.dart';
import 'package:chat_client/ui/widgets/textfield/filled_text_field.dart';
import 'package:flutter/material.dart';

class ChatProfilePage extends StatefulWidget {
  const ChatProfilePage({super.key});

  @override
  State<ChatProfilePage> createState() => _ChatProfilePageState();
}

class _ChatProfilePageState extends State<ChatProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectAvatarCircle(),
        SizedBox(height: 30),
        FilledTextField(hintText: "İsim"),
        SizedBox(height: 20),
        FilledTextField(hintText: "Soyisim"),
        SizedBox(height: 20),
        CircleButton(
          title: "Kaydet",
          onTap: () {},
          icon: Icon(
            Icons.save,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
