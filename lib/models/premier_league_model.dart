class PremierLeague {
  final int? idTeam;
  final String strName;
  final String strBadge;
  final String strLocation;
  final String strDescriptionEN;
  bool isFavorite;

  PremierLeague({
    this.idTeam,
    required this.strName,
    required this.strBadge,
    required this.strLocation,
    required this.strDescriptionEN,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strName': strName,
      'strBadge': strBadge,
      'strLocation': strLocation,
      'strLocation': strLocation,
      'strDescriptionEN': strDescriptionEN,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory PremierLeague.fromMap(Map<String, dynamic> map) {
    return PremierLeague(
      idTeam: map['idTeam'],
      strName: map['strName'],
      strBadge: map['strBadge'],
      strLocation: map['strLocation'],
      strDescriptionEN: map['strDescriptionEN'] ?? 'No description available',
      isFavorite: map['isFavorite'] == 1,
    );
  }
}
