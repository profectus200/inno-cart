// import 'package:flutter_test/flutter_test.dart';
// import 'package:innocart_front/data/api/model/api_profile.dart';
//
// void main() {
//   group('ApiProfile', () {
//     ApiProfile apiProfile = const ApiProfile(id: 1,
//         nickname: 'Vanya',
//         rating: 5.0,
//         dealsCompleted: 3);
//
//     test('fromApi', () {
//       Map<String, dynamic> api = {'id': 1, 'nickname': 'Vanya',
//         'rating': 5.0,
//         'dealsCompleted': 3};
//
//       expect(ApiProfile.fromApi(api), apiProfile);
//     });
//
//     test('toApi', () {
//       Map<String, dynamic> api = {'nickname': 'Vanya',
//         'rating': 5.0,
//         'dealsCompleted': 3};
//
//       expect(apiProfile.toApi(), api);
//     });
//   });
// }