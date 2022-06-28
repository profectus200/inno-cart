import '../../domain/model/profile.dart';
import '../api/model/api_profile.dart';

class ProfileMapper {
  static Profile fromApi(ApiProfile profile) {
    return Profile(
      id: profile.id,
      nickname: profile.nickname,
      rating: profile.rating,
      dealsCompleted: profile.dealsCompleted,
      alias: profile.alias,
    );
  }

  static ApiProfile toApi(Profile profile) {
    return ApiProfile(
      id: profile.id,
      nickname: profile.nickname,
      rating: profile.rating,
      dealsCompleted: profile.dealsCompleted,
      alias: profile.alias,
    );
  }
}
