import 'package:equatable/equatable.dart';

class ApiProfile extends Equatable {
  final int id;
  final String nickname;
  final double rating;
  final int dealsCompleted;
  final String alias;
  final int user;

  const ApiProfile({
    required this.id,
    required this.nickname,
    required this.rating,
    required this.dealsCompleted,
    required this.alias,
    required this.user
  });

  ApiProfile.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        nickname = map['nickname'],
        rating = map['rating'],
        dealsCompleted = map['deals_completed'],
        alias = map['telegram_alias'],
        user = map['user'];

  Map<String, dynamic> toApi() {
    return {
      'nickname': nickname,
      'rating': rating,
      'deals_completed': dealsCompleted,
      'telegram_alias': alias,
      'user': 1
    };
  }

  @override
  List<Object> get props => [id, nickname, rating, dealsCompleted, alias];
}
