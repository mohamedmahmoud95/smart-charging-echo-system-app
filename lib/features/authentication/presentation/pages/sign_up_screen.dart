import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/alert_dialog.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../../widgets/buttons/text_button_widget.dart';
import '../../../../widgets/logo.dart';
import '../../../../widgets/text_fields/text_field.dart';
import '../../auth_utility_functions/auth_input_validator.dart';
import '../../auth_utility_functions/firebase_auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  bool passwordIsValid = false;
  bool passwordMatch = false;
  bool emailIsValid = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLogo(
                height: 200,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFieldWidget(
                    label: 'email', textController: emailController),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFieldWidget(
                  label: 'password',
                  isHiddenByDefault: true,
                  textController: passwordController,
                  suffix: const Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFieldWidget(
                  label: 'Re-enter password',
                  isHiddenByDefault: true,
                  textController: password2Controller,
                  suffix: const Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                onPressed: () {
                  // AuthUtilityFunctions.validatePassword(passwordController.text);
                  handleSignUpRequest(context);
                  // signUp(email: emailController.text, password: passwordController.text, context: context);
                },
                text: 'Sign Up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: signInInsteadButton(context),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInInsteadButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
        ),
        TextButtonWidget(
            text: "Sign In",
            textColors: Colors.red.shade700,
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('sign_in_screen_route');
            }),
      ],
    );
  }

  Future<dynamic> signUp(
      {required String email,
        required String password,
        required BuildContext context}) async {
    String? _errorMessage;

    try {
      await FirebaseAuthServices.instance.register(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, 'homeRoute');
    } catch (e) {
      if (context.mounted) {
        showDialog(
            builder: (context) => AlertDialogWidget(
              title: "Error",
              contentText: e.toString(),
            ),
            context: context);
      }

      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  void handleSignUpRequest(BuildContext context) {
    setState(() {

      passwordIsValid = AuthInputValidator.validatePassword(passwordController.text);
      passwordMatch = passwordController.text == password2Controller.text;
      emailIsValid = AuthInputValidator.validateEmail(emailController.text);
    });
    if (!emailIsValid)
    {
      showDialog(context: context, builder: (context)=>
      const AlertDialogWidget(contentText: "Email is invalid"));
    }
    else if (!passwordIsValid) {
      showDialog(context: context, builder: (context)=>
      const AlertDialogWidget(contentText: "Password is invalid"));
    }
    else if (passwordIsValid && !passwordMatch) {
      showDialog(context: context, builder: (context)=>
      const AlertDialogWidget(contentText: "Passwords don't match"));
    }
    else {
      signUp(email: emailController.text, password: passwordController.text, context: context);
    }
  }
}
