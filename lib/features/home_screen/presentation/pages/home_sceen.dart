import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_charging_echo_system_app/features/location_tracker/presentation/pages/location_tracker_test.dart';
import 'package:smart_charging_echo_system_app/features/map_view/presentation/pages/map_view_screen.dart';
import 'package:smart_charging_echo_system_app/features/settings_screen/presentation/pages/settings_screen.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/alert_dialog.dart';
import '../../../../widgets/buttons/button_widget.dart';
import '../../../authentication/auth_utility_functions/firebase_auth_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> mainScreens = [
    const MapViewScreen(),
    const LocationScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundWhite,
      // appBar: AppBar(
      //   //backgroundColor: Colors.transparent,
      //   // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      //
      //   //leading: const DrawerButton(),
      //   title: Text(
      //     "Home",
      //     style: Theme.of(context).textTheme.titleLarge,
      //   ),
      //   centerTitle: true,
      // ),

      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: AppColors.backgroundWhite,
        color: AppColors.yellow,
        buttonBackgroundColor: AppColors.yellow,
        height: 50,
        items: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: const Icon(Icons.location_on_outlined, size: 30),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: const Icon(Icons.map, size: 30),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: const Icon(Icons.person, size: 30),
          ),
        ],
      ),

      body: mainScreens[index],

      // drawer:
      // Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: AppColors.yellow,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       const ListTile(
      //         title: Text('Settings'),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).pushNamed("location_tracker_screen_route");
      //         },
      //         title: const Text('Location tracker'),
      //       ),
      //
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).pushNamed("map_view_screen_route");
      //         },
      //         title: const Text('Map View '),
      //       ),
      //
      //
      //       ListTile(
      //         onTap: () {
      //           logout(context);
      //         },
      //         title: const Text('Logout'),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           deleteAccount(context);
      //         },
      //         title: const Text('Delete account'),
      //       ),
      //
      //
      //     ],
      //   ),
      // ),
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
