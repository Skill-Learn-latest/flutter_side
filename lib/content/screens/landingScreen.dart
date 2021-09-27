import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_learn_client/auth/data_provider/user-data-provider.dart';
import 'package:skill_learn_client/auth/repository/user-repository.dart';
import 'package:skill_learn_client/auth/screens/components/constants.dart';
import 'package:skill_learn_client/content/repository/article-repository.dart';
import 'package:skill_learn_client/content/screens/home_page.dart';
import 'package:skill_learn_client/user/bloc/profile_bloc.dart';
import 'package:skill_learn_client/user/data_provider/profile_data_provider.dart';
import 'package:skill_learn_client/user/repository/profile-repository.dart';
import 'package:skill_learn_client/user/screens/profile_page.dart';

class LandingScreen extends StatefulWidget {
  final ArticleRepository articleRepository;
  final ProfileRepository profileRepository;

  LandingScreen(
      {required this.articleRepository, required this.profileRepository});

  @override
  _LandingScreenState createState() => _LandingScreenState(
      articleRepository: this.articleRepository,
      profileRepository: this.profileRepository);
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  final ArticleRepository articleRepository;
  final ProfileRepository profileRepository;

  _LandingScreenState(
      {required this.articleRepository, required this.profileRepository});

  final tabs = [
    ListView(
      // mainAxisSize: MainAxisSize.max,
      children: [
        // VideoTile(),
        HomePage(),
        SizedBox(
          height: 30,
        ),
      ],
    ),
    Center(
      child: Text("Second Page"),
    ),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final String message = "Message";
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ProfileDetailBloc(profileRepository: this.profileRepository))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Skill Learn"),
            backgroundColor: kPrimaryColor,
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kPrimaryLightColor,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Creators",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
            onTap: (index) => {
              setState(() {
                _currentIndex = index;
              })
            },
          ),
        ),
      ),
    );
  }
}
