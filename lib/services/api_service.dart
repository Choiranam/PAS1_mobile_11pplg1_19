import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_19/models/premier_league_model.dart';

class ApiService {
  final String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  Future<List<PremierLeague>> fetchPremiers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> teams = data['teams'];
      return teams.map((json) {
        return PremierLeague(
          strName: json['strTeam'],
          strBadge: json['strBadge'],
          strLocation: json['strLocation'],
          strDescriptionEN: json['strDescriptionEN']
        );
      }).toList();
    } else {
      throw Exception('Failed to load premiers');
    }
  }
}
