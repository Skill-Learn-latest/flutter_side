import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/bloc/blocs.dart';
import 'package:skill_learn_client/auth/models/user.dart';
import 'package:skill_learn_client/auth/screens/auth_screens.dart';
import 'package:skill_learn_client/auth/screens/components/components.dart';
import 'components/constants.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  String? errorMessage;
  Signup(this.errorMessage);
  @override
  _SignupState createState() => _SignupState(errorMessage);
}

// Sign up page widget
// ignore: must_be_immutable
class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  final Map<String, dynamic> _user = {};
  var password;

  // constructor to check for error messages
  _SignupState(this.errorMessage);
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
                    "SIGNUP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    "${this.errorMessage != null ? this.errorMessage : ''}",
                    style:
                        TextStyle(color: Colors.red.shade300, fontSize: 18.0),
                  ),
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
                  TextFieldContainer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        ),
                        hintText: "Email",
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter email!';
                        }
                        return null;
                      },
                      initialValue: '',
                      onSaved: (value) {
                        setState(() {
                          this._user["email"] = value;
                        });
                      },
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        hintText: "Firstname",
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter firstname!';
                        }
                        return null;
                      },
                      initialValue: '',
                      onSaved: (value) {
                        setState(() {
                          this._user["firstname"] = value;
                        });
                      },
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        hintText: "Lastname",
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter lastname!';
                        }
                        return null;
                      },
                      initialValue: '',
                      onSaved: (value) {
                        setState(() {
                          this._user["lastname"] = value;
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
                    text: "SIGNUP",
                    press: () {
                      final form = _formKey.currentState;
                      if (form != null &&
                          form.validate() &&
                          password.toString().length >= 8) {
                        form.save();

                        final UserEvent event = UserSignUp(
                            User(
                              username: this._user["username"],
                              email: this._user["email"],
                              firstName: this._user["firstname"],
                              lastName: this._user['lastname'],
                              password: this.password,
                            ),
                            context);

                        BlocProvider.of<AuthenticationBloc>(context).add(event);

                        // Navigator.pushNamedAndRemoveUntil(context,
                        //     RouteGenerator.loginPage, (route) => false);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    Signup("Choose a complex password")),
                            (route) => false);
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Login(
                                    errorMessage: null,
                                  )),
                          (route) => false);
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
