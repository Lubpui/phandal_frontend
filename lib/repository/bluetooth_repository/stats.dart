import 'package:http/http.dart' as http;
// Import your UserModel class
import 'dart:convert';
import 'package:phandal_frontend/model/userstats_model.dart';

class StatsRepository {
  final String staturl = 'https://66162b71b8b8e32ffc7c8c4c.mockapi.io/userapi';

  Future<List<UserStats>> getStats() async {
    final statres = await http.get(Uri.parse(staturl));
    if (statres.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(statres.body);
      final List<UserStats> stats =
          jsonList.map((json) => UserStats.fromJson(json)).toList();
      return stats;
    } else {
      throw Exception('Failed to load devices');
    }
  }
}
