import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/alert_dialog.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../authentication/auth_utility_functions/firebase_auth_services.dart';
import '../widget/setting_tile.dart';
import '../widget/user_profile_pic.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150,),
           const ProfilePicAndName(),
            const SizedBox(height: 20,),

            SettingTile(leading: const Icon(Icons.language) , titleText: 'Language', onPressed: (){},
            trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade500,)
            ),
            SettingTile(leading: const Icon(Icons.logout) , titleText: 'Logout', onPressed: (){
              logout(context);
            }),
            SettingTile(leading: const Icon(Icons.delete) , titleText: 'Delete my account', onPressed: (){
              deleteAccount(context);
            }),
          ],
        ),),
      ),
    );
  }


  void logout(BuildContext context) {
    FirebaseAuthServices.instance.signOut();

    Navigator.pushReplacementNamed(context, 'signInRoute');
  }

  void deleteAccount(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
          title: "Warning",
          contentText: "Are you sure you want to delete your account?",
          actionWidget: Row(
            children: [
              ButtonWidget(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                horizontalPadding: 5,
                width: 120,
                fontSize: 15,
                backgroundColor: AppColors.red,
              ),
              const SizedBox(
                width: 20,
              ),
              ButtonWidget(
                onPressed: () {
                  FirebaseAuthServices.instance.deleteAccount();

                  Navigator.pushReplacementNamed(context, 'signInRoute');
                },
                text: 'Yes',
                horizontalPadding: 5,
                width: 120,
                fontSize: 15,
              )
            ],
          ),
        ));
  }
}
