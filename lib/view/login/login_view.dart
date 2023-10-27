import 'package:apirest/utils/utils.dart';
import 'package:apirest/view_models/controller/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginViewModal());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginController.emailController.value,
                    focusNode: loginController.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        print('tye');
                        Utils.snakBar('Email', 'Enter email');
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginController.emailFocusNode as FocusNode,
                          loginController.passwordFocusNode as FocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: loginController.passwordController.value,
                    focusNode: loginController.passwordFocusNode.value,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snakBar('Password', 'Enter password');
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  loginController.login();
                }
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Container(
                child: Text(loginController.loading.value ? 'loading' : 'nada'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
