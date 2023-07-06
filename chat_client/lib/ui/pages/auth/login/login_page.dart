import 'package:chat_client/core/base/base_view.dart';
import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/viewmodels/auth/login_viewmodel.dart';
import 'package:chat_client/ui/pages/auth/register/register_page.dart';
import 'package:chat_client/ui/pages/auth/widgets/form_illustration.dart';
import 'package:chat_client/ui/pages/auth/widgets/form_list_tile.dart';
import 'package:chat_client/ui/pages/auth/widgets/navigation_text.dart';
import 'package:chat_client/ui/widgets/button/circle_button.dart';
import 'package:chat_client/ui/widgets/textfield/filled_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseWidget<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    FormIllustration(
                      path: "assets/images/login-illustration.png",
                      height: dynamicHeight(.35),
                    ),
                    SizedBox(height: 40),
                    _buildForm(model),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForm(LoginViewModel model) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormListTile(
            title: "Giriş Yap",
            subtitle: "Giriş yapabilmek için lütfen formu doldurunz.",
          ),
          SizedBox(height: 40),
          FilledTextField(
            hintText: "E-posta Adresi",
            controller: model.form.fields["email"],
          ),
          SizedBox(height: 20),
          FilledTextField(
            hintText: "Şifre",
            secure: true,
            controller: model.form.fields["password"],
          ),
          SizedBox(height: 30),
          CircleButton(
            title: "Giriş Yap",
            icon: Icon(
              Icons.login,
              color: Colors.white,
            ),
            onTap: () {
              model.signIn();
            },
          ),
          SizedBox(height: 30),
          NavigationText(
            text: "Hesabınız yok mu?",
            navigationText: "Kayıt ol",
            page: RegisterPage(),
          )
        ],
      ),
    );
  }
}
