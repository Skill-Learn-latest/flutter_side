import 'package:equatable/equatable.dart';
import 'package:skill_learn_client/user/models/user.dart';

abstract class ProfileEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileUpdate extends ProfileEvent {
  User user;

  ProfileUpdate(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class ProfileLoad extends ProfileEvent {}
