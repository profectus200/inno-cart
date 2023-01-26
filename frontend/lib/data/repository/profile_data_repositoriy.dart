import 'package:innocart_front/data/api/model/api_profile.dart';
import 'package:innocart_front/data/api/service/profile_service.dart';
import 'package:innocart_front/data/mapper/profile_mapper.dart';

import '../../domain/model/profile.dart';
import '../../domain/repository/profile_repository.dart';

class ProfileDataRepository extends ProfileRepository {
  late final ProfileService _profileService;

  ProfileDataRepository(this._profileService);

  @override
  Future<Profile> getProfile(int id) async {
    ApiProfile profile = await _profileService.getProfile(id);
    return ProfileMapper.fromApi(profile);
  }

  @override
  Future<int> addProfile(Profile profile) {
    ApiProfile apiProfile = ProfileMapper.toApi(profile);
    return _profileService.addProfile(apiProfile);
  }

  @override
  Future<int> updateProfile(Profile profile, int id) {
    ApiProfile apiProfile = ProfileMapper.toApi(profile);
    return _profileService.updateProfile(apiProfile, id);
  }

  @override
  Future<Profile> getMyProfile() async {
    ApiProfile profile = await _profileService.getMyProfile();
    return ProfileMapper.fromApi(profile);
  }
}
