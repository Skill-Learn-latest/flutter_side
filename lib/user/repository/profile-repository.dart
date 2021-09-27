import 'package:skill_learn_client/user/models/user.dart';
import 'package:skill_learn_client/user/data_provider/profile_data_provider.dart';

class ProfileRepository {
  final ProfileDataProvider dataProvider;
  ProfileRepository(this.dataProvider);

  Future<User> getUser() async {
    return this.dataProvider.getUser();
  }

  Future<User> updateUser(User user) async {
    return this.dataProvider.updateUser(user);
  }
}
