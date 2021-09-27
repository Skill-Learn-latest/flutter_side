import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_learn_client/auth/screens/auth_screens.dart';

class LogOut extends StatelessWidget {
  const LogOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: MaterialButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove("accessToken");
            await prefs.remove("id");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => WelcomeScreen()),
                (route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.logout,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
