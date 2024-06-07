import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../../widgets/buttons/text_button_widget.dart';
import '../../../../widgets/logo.dart';
import '../../../../widgets/text_fields/text_field.dart';
import '../../firebase_auth_services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Center(
        child:
        SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLogo(
              height: 300,
              width: 300,
            ),
            TextFieldWidget(label: 'email', textController: emailController),
           const SizedBox(height: 20,),
            TextFieldWidget(label: 'password', isHiddenByDefault: true,
              textController: passwordController,
              suffix: const Icon(Icons.remove_red_eye, ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Padding(padding: const EdgeInsets.all(20), child: signInInsteadButton(context),),],),

            const SizedBox(height: 20,),
            ButtonWidget(onPressed: ()async{
              await FirebaseAuthServices.instance.register(
                email: emailController.text,
                password: passwordController.text,
              );

              // await FirebaseAuthServices.instance.signIn(
              //   email: emailController.text,
              //   password: passwordController.text,
              // );
            }, text: 'Sign Up',),

          ],
        ),),
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
            text:  "Sign In",
            textColors: Colors.red.shade700,
            onTap: () {
              Navigator.of(context).pushReplacementNamed('sign_in_screen_route');
            }),
      ],
    );
  }


}
