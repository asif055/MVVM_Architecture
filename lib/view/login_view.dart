import 'package:flutter/material.dart';
import 'package:mvvm_archit/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';


import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();
  }

  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    hintText: 'Email',
                    labelText: 'Email'),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: InkWell(
                          onTap: () {
                            obsecurePassword.value = !obsecurePassword.value;
                          },
                          child: Icon(
                            obsecurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText: 'Password',
                        labelText: 'Password'),
                  );
                },
              ),
              SizedBox(height: height * .085),
              RoundButton(title: 'Login',
                  loading: authViewModel.loading,
                  onPress: (){
                if(emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if(passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if(passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage('Please enter 6 digit password', context);
                } else {
                  Map data = {
                    'email': 'eve.holt@reqres.in',
                    'password': 'cityslicka',
                  };
                  // Map data = {
                  //   'email' : emailController.text.toString(),
                  //   'password' : passwordController.text.toString(),
                  // };
                  authViewModel.loginApi(data, context);
                  print('Api hit');
                }
              })

            ],
          ),
        ));
  }
}
