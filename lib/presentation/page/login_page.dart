import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laundry_management_system/config/session.dart';
import 'package:laundry_management_system/data/source/source_user.dart';
import 'package:laundry_management_system/presentation/page/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final username = TextEditingController();
  final password = TextEditingController();

  login() async {
    var user = await SourceUser.Login(username.text, password.text);
    if (user == null) {
      DInfo.toastError('Failed to Login');
    } else {
      Session.saveUser(user);
      DInfo.dialogSuccess('Login Success');
      DInfo.closeDialog(actionAfterClose: () {
        Get.off(() => const HomePage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DInput(
            controller: username,
            hint: 'username',
          ),
          DView.spaceHeight(),
          DInput(
            controller: password,
            hint: 'password',
          ),
          DView.spaceHeight(),
          ElevatedButton(
            onPressed: () => login(),
            child: Text('login'),
          ),
          OutlinedButton(
            onPressed: () => login(),
            child: Text('login as Customer'),
          ),
        ],
      ),
    );
  }
}
