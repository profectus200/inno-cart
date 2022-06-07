import '../../domain/model/user.dart';
import '../api/model/api_user.dart';

class UserMapper {
  static User fromApi(ApiUser user) {
    return User(
      name: user.name,
      surname: user.surname,
      email: user.email,
      phoneNumber: user.phoneNumber.toInt(),
      rating: user.rating.toDouble(),
    );
  }
}