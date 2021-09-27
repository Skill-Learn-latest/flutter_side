import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skill_learn_client/user/bloc/profile_event.dart';
import 'package:skill_learn_client/user/bloc/profile_state.dart';
import 'package:skill_learn_client/user/models/user.dart';
import 'package:skill_learn_client/user/repository/profile-repository.dart';

class ProfileDetailBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileDetailBloc({required this.profileRepository})
      : super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    // if (event is ProfileUpdate) {
    //   User user = await this.profileRepository.getUser();
    //   if (event is ProfileLoad) {
    //     yield ProfileView();
    //   } else {
    //     yield ProfileLoadFailure();
    //   }
    // }

    if (event is ProfileLoad) {
      User user = await this.profileRepository.getUser();
      if (user.username != null) {
        yield ProfileView(user);
      } else {
        yield ProfileLoadFailure();
      }
    }
    if (event is ProfileUpdate) {
      try {
        User user = await this.profileRepository.updateUser(event.user);
        yield ProfileUpdated(user);
        yield ProfileView(user);
      } catch (_) {
        yield ProfileLoadFailure();
      }
    }
  }
}
