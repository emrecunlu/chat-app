import 'package:chat_client/core/base/base_view.dart';
import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/core/viewmodels/auth/register_viewmodel.dart';
import 'package:chat_client/ui/pages/auth/login/login_page.dart';
import 'package:chat_client/ui/pages/auth/widgets/form_illustration.dart';
import 'package:chat_client/ui/pages/auth/widgets/form_list_tile.dart';
import 'package:chat_client/ui/pages/auth/widgets/navigation_text.dart';
import 'package:chat_client/ui/widgets/button/circle_button.dart';
import 'package:chat_client/ui/widgets/textfield/filled_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseWidget<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
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
                      path: "assets/images/register-illustration.png",
                      height: dynamicHeight(.3),
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
}

Widget _buildForm(RegisterViewModel model) {
  return Form(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormListTile(
          title: "Kayıt Ol",
          subtitle: "Kayıt olmak için lütfen formu doldurunuz.",
        ),
        SizedBox(height: 40),
        FilledTextField(
          hintText: "Kullanıcı Adı",
          controller: model.form.fields["userName"],
        ),
        SizedBox(height: 20),
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
          title: "Kayıt Ol",
          icon: Icon(
            Icons.person_add_alt_1,
            color: Colors.white,
          ),
          onTap: () {
            debugPrint("emre");
            model.register();
          },
        ),
        SizedBox(height: 30),
        NavigationText(
          text: "Zaten hesabınız var mı?",
          navigationText: "Giriş yap",
          page: LoginPage(),
        )
      ],
    ),
  );
}
