import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/screens/components/constants.dart';
import 'package:skill_learn_client/user/bloc/profile_bloc.dart';
import 'package:skill_learn_client/user/bloc/profile_event.dart';
import 'package:skill_learn_client/user/bloc/profile_state.dart';
import 'package:skill_learn_client/user/models/user.dart';
import 'package:skill_learn_client/user/screens/components/components_profile_page/edit_field.dart';
import 'package:skill_learn_client/user/screens/components/components_profile_page/logout.dart';
import 'package:skill_learn_client/user/screens/components/components_profile_page/profile_picture.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<ProfileDetailBloc>(context)..add(ProfileLoad()),
      builder: (context, state) {
        if (state is ProfileView) {
          User user = state.user;
          return ListView(
            children: [
              ProfilePicture(),
              Divider(),
              AccountDetailForm(user: user),
              LogOut(),
            ],
          );
        }

        return ListView(
          children: [
            ProfilePicture(),
            Divider(),
            LogOut(),
          ],
        );
      },
      listener: (context, state) {
        if (state is ProfileUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Profile updated successfully"),
            duration: Duration(milliseconds: 400),
          ));
        }
      },
    );
  }
}
