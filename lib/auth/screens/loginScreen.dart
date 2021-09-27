import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/bloc/blocs.dart';
import 'package:skill_learn_client/auth/models/user.dart';
import 'package:skill_learn_client/auth/screens/auth_screens.dart';
import 'package:skill_learn_client/auth/screens/components/components.dart';
import 'package:flutter/material.dart';

import 'components/constants.dart';

class Login extends StatefulWidget {
  String? errorMessage;
  bool signUpSuccess;
  Login({this.errorMessage, this.signUpSuccess = false});
  @override
  _LoginState createState() =>
      _LoginState(this.errorMessage, this.signUpSuccess);
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  bool signUpSuccess;
  _LoginState(this.errorMessage, this.signUpSuccess);
  final Map<String, dynamic> _user = {};
  var password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "${this.errorMessage != null ? this.errorMessage : ''}",
                  style: TextStyle(color: Colors.red.shade300, fontSize: 18.0),
                ),
                Text(
                  "${this.signUpSuccess ? 'Sign up successful. Enter your login info' : ''}",
                  style:
                      TextStyle(color: Colors.green.shade300, fontSize: 18.0),
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldContainer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "Username",
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter username!';
                      }
                      return null;
                    },
                    initialValue: '',
                    onSaved: (value) {
                      setState(() {
                        this._user["username"] = value;
                      });
                    },
                  ),
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();

                      final UserEvent event = UserLogin(
                          User(
                            username: this._user["username"],
                            password: this.password,
                          ),
                          context);

                      BlocProvider.of<AuthenticationBloc>(context).add(event);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Signup(null)),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
