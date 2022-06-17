import '../model/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile(int id);

  Future<int> addProfile(Profile profile);

  Future<int> updateProfile(Profile profile, int id);
}