import '../../data/api/service/profile_service.dart';
import '../../data/repository/profile_data_repositoriy.dart';
import '../../domain/repository/profile_repository.dart';

class ProfileRepoModule {
  static final ProfileRepository _profileRepository =
      ProfileDataRepository(ProfileService());

  static ProfileRepository profileRepository() {
    return _profileRepository;
  }
}
