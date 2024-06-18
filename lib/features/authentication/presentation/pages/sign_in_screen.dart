import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/alert_dialog.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../../widgets/buttons/text_button_widget.dart';
import '../../../../widgets/logo.dart';
import '../../../../widgets/text_fields/text_field.dart';
import '../../auth_utility_functions/firebase_auth_services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

              const SizedBox (height: 30),
              Image.asset("assets/images/landing4.png"),
              // const AppLogo(
              //   height: 200,
              //   width: 200,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFieldWidget(
                    label: S.of(context).email, textController: emailController),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFieldWidget(
                  label: S.of(context).password,
                  isHiddenByDefault: true,
                  textController: passwordController,
                  suffix: const Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: forgotPasswordButton(context),
                  ),
                ],
              ),
              ButtonWidget(
                onPressed: () {
                  signIn(
                    email: emailController.text,
                    password: passwordController.text, context: context,
                  );
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 20,
              ),

              ButtonWidget(
                onPressed: () {
                  signIn(
                      email: "m.raslan97@gmail.com",
                      password: "Test1234#",
                      context: context
                  );
                },
                text: 'Login as Raslan',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: signUpInsteadButton(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpInsteadButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
        ),
        TextButtonWidget(
            text: "Sign Up",
            textColors: AppColors.red,
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('sign_up_screen_route');
            }),
      ],
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return TextButtonWidget(
        text: "Forgot password?",
        textColors: AppColors.textGrey,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        onTap: () {
          Navigator.of(context).pushNamed('reset_password_screen_route');
        });
  }

  Future<dynamic> signIn(
      {required String email, required String password, required BuildContext context}) async {
    try {
      await FirebaseAuthServices.instance.signIn(
        email: email,
        password: password,
      );
      Navigator.pushReplacementNamed(context, 'homeRoute');
    } on FirebaseAuthException catch (e) {
      // Display the specific error message from FirebaseAuthException
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialogWidget(
            title: "Error",
            contentText: e.message ?? "An unknown error occurred.",
          ),
        );
      }
    } catch (e) {
      // Catch any other type of exception
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialogWidget(
            title: "Error",
            contentText: e.toString(),
          ),
        );
      }
    }
  }

}

