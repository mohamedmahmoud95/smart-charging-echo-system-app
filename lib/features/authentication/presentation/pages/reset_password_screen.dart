import 'package:flutter/material.dart';


import '../../../../widgets/buttons/button_widget.dart';
import '../../../../widgets/text_fields/text_field.dart';
import '../../firebase_auth_services.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        title: Text(
          "Reset password",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "How it works?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter your email and we will send you a link to reset your password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              label: 'email',
              isHiddenByDefault: false,
              textController: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              child:Text( "Sent reset password email",style: Theme.of(context).textTheme.titleMedium,) ,
              onPressed: () async{
                await FirebaseAuthServices.instance.resetPassword(
                  email: emailController.text,
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}
