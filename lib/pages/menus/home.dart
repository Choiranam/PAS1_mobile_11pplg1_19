import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_19/components/reusable_app_bar.dart';
import 'package:pas1_mobile_11pplg1_19/controllers/premier_league_controller.dart';

class Home extends StatelessWidget {
  final PremierLeagueController controller = Get.put(PremierLeagueController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Premier League Teams',
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Obx(() {
        if (controller.premiers.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.premiers.length,
          itemBuilder: (context, index) {
            final premierLeague = controller.premiers[index];
            final isSelected = controller.selectedIndex.value == index;

            return Column(
              children: [
                ListTile(
                  leading: Image.network(premierLeague.strBadge, height: 50),
                  title: Text(premierLeague.strName),
                  subtitle: Text(premierLeague.strLocation),
                  onTap: () {
                    controller.setSelectedIndex(index);
                  },
                  trailing: IconButton(
                    icon: Icon(
                      premierLeague.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: premierLeague.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      controller.toggleFavorite(premierLeague);
                    },
                  ),
                ),
                if (isSelected)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          premierLeague.strDescriptionEN,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                Divider(),
              ],
            );
          },
        );
      }),
    );
  }
}