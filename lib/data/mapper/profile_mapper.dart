import '../../domain/model/profile.dart';
import '../api/model/api_profile.dart';

class ProfileMapper {
  static Profile fromApi(ApiProfile order) {
    return Profile(
      id: order.id,
      nickname: order.nickname,
      rating: order.rating,
      dealsCompleted: order.dealsCompleted,
    );
  }

  static ApiProfile toApi(Profile order) {
    return ApiProfile(
      id: order.id,
      nickname: order.nickname,
      rating: order.rating,
      dealsCompleted: order.dealsCompleted,
    );
  }
}
