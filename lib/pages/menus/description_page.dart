import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_19/models/premier_league_model.dart';

class DescriptionPage extends StatelessWidget {
  final PremierLeague premierLeague;

  DescriptionPage({Key? key, required this.premierLeague}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(premierLeague.strName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(premierLeague.strBadge, height: 100),
            SizedBox(height: 10),
            Text(
              'Team: ${premierLeague.strName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Location: ${premierLeague.strLocation}'),
            SizedBox(height: 10),
            Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              premierLeague.strDescriptionEN, // Tampilkan deskripsi
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}