import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/alert_dialog.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../../widgets/text_fields/text_field.dart';
import '../../auth_utility_functions/firebase_auth_services.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        title: Text(
          "Reset password",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How it works?",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter your email and we will send you a link to reset your password",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldWidget(
              label: 'email',
              isHiddenByDefault: false,
              textController: emailController,
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              text: "Sent reset password email",
              onPressed: ()  {
                sendResetPasswordEmail(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendResetPasswordEmail(BuildContext context) async {
    try {
      await FirebaseAuthServices.instance.resetPassword(
        email: emailController.text,
      );
      showDialog(context: context, builder: (context) =>
          AlertDialogWidget(
            title: "Success",
            contentText: "We have sent you an email with a link to reset your password",
            onPressed: (){
              Navigator.of(context)
                  .pushReplacementNamed('sign_in_screen_route');
            },
          ));
    } catch (e) {
      if (context.mounted) {
        showDialog(
            builder: (context) =>
                AlertDialogWidget(
                  title: "Error",
                  contentText: e.toString(),
                ), context: context);
      }
    }
  }
}