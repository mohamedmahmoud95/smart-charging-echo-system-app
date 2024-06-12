
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/alert_dialog.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../authentication/auth_utility_functions/firebase_auth_services.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
       // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

        leading: const DrawerButton(),
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.yellow,
              ),
              child: Text('Drawer Header'),
            ),
            const ListTile(
              title: Text('Settings'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("location_tracker_screen_route");
              },
              title: const Text('Location tracker'),
            ),

            ListTile(
              onTap: () {
                logout(context);
              },
              title: const Text('Logout'),
            ),
            ListTile(
              onTap: () {
                deleteAccount(context);
              },
              title: const Text('Delete account'),
            ),


          ],
        ),
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
