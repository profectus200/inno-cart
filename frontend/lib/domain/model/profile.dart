import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String nickname;
  final double rating;
  final int dealsCompleted;
  final String alias;

  const Profile({
    required this.id,
    required this.nickname,
    required this.rating,
    required this.dealsCompleted,
    required this.alias,
  });

  @override
  List<Object> get props => [id, nickname, rating, dealsCompleted];
}
