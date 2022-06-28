import 'package:equatable/equatable.dart';

class ApiProfile extends Equatable {
  final int id;
  final String nickname;
  final double rating;
  final int dealsCompleted;
  final String alias;

  const ApiProfile({
    required this.id,
    required this.nickname,
    required this.rating,
    required this.dealsCompleted,
    required this.alias,
  });

  ApiProfile.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        nickname = map['nickname'],
        rating = map['rating'],
        dealsCompleted = map['dealsCompleted'],
        alias = map['alias'];

  Map<String, dynamic> toApi() {
    return {
      'nickname': nickname,
      'rating': rating,
      'dealsCompleted': dealsCompleted,
      'alias': alias,
    };
  }

  @override
  List<Object> get props => [id, nickname, rating, dealsCompleted, alias];
}
