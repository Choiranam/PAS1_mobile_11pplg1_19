import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_19/models/premier_league_model.dart';

class ReusableCard extends StatelessWidget {
  final PremierLeague premierLeague;
  final VoidCallback onFavoriteToggle;
  final VoidCallback? onDelete;

  const ReusableCard({
    super.key,
    required this.premierLeague,
    required this.onFavoriteToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(premierLeague.strBadge, width: 50, fit: BoxFit.cover),
        title: Text(premierLeague.strName),
        subtitle: Text('Location: ${premierLeague.strLocation}'),
        trailing: onDelete == null
            ? IconButton(
                icon: Icon(
                  premierLeague.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: premierLeague.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: onFavoriteToggle,
              )
            : IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
      ),
    );
  }
}
