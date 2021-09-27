import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/screens/components/constants.dart';
import 'package:skill_learn_client/user/bloc/profile_bloc.dart';
import 'package:skill_learn_client/user/bloc/profile_event.dart';
import 'package:skill_learn_client/user/models/user.dart';
import 'package:skill_learn_client/user/screens/components/components_profile_page/profile_picture.dart';

class AccountDetailForm extends StatefulWidget {
  User? user;
  AccountDetailForm({this.user});
  @override
  _AccountDetailFormState createState() => _AccountDetailFormState(this.user);
}

class _AccountDetailFormState extends State<AccountDetailForm> {
  final _key = GlobalKey<FormState>();
  late Map<String, dynamic> _user = {};
  late User? user;
  _AccountDetailFormState(User? user) {
    this.user = user;
    _user['email'] = user!.email;
    _user['firstName'] = user.firstName;
    _user['lastName'] = user.lastName;
    _user['username'] = user.username;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(0), end: Radius.circular(10)),
                  color: kPrimaryLightColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                  child: Text(
                    "Username",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        this._user["username"] = value;
                      });
                    },
                    initialValue: _user["username"],
                    enabled: true,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(0), end: Radius.circular(10)),
                  color: kPrimaryLightColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                  child: Text(
                    "Firstname",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        this._user["firstName"] = value;
                      });
                    },
                    enabled: true,
                    initialValue: _user["firstName"],
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(0), end: Radius.circular(10)),
                  color: kPrimaryLightColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                  child: Text(
                    "Lastname",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        this._user["lastName"] = value;
                      });
                    },
                    initialValue: _user["lastName"],
                    enabled: true,
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(0), end: Radius.circular(10)),
                  color: kPrimaryLightColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        this._user["email"] = value;
                      });
                    },
                    enabled: true,
                    initialValue: _user["email"],
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
              ),
              onPressed: () {
                final form = _key.currentState;
                print("update pressed");
                if (form != null && form.validate()) {
                  print("form saved");
                  form.save();
                  User user = User(
                      username: _user["username"],
                      firstName: _user["firstName"],
                      lastName: _user["lastName"],
                      email: _user["email"]);
                  BlocProvider.of<ProfileDetailBloc>(context)
                      .add(ProfileUpdate(user));
                }
              },
              child: Text("Update Info"),
            ),
          ),
        ],
      ),
    );
  }
}
