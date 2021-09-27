import 'package:equatable/equatable.dart';
import 'package:skill_learn_client/user/bloc/profile_event.dart';
import 'package:skill_learn_client/user/models/user.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final User user;
  const ProfileUpdated(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileView extends ProfileState {
  final User user;
  const ProfileView(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class ProfileLoadFailure extends ProfileState {}
