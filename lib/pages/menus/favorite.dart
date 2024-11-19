import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_19/components/reusable_app_bar.dart';
import 'package:pas1_mobile_11pplg1_19/components/reusable_card.dart';
import 'package:pas1_mobile_11pplg1_19/controllers/premier_league_controller.dart';
import 'package:pas1_mobile_11pplg1_19/models/premier_league_model.dart';

class Favorite extends StatelessWidget {
  final PremierLeagueController controller = Get.find();

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Favorite',
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final PremierLeague = controller.favorites[index];
            return ReusableCard(
              premierLeague: PremierLeague,
              onFavoriteToggle: () {},
              onDelete: () {
                Get.dialog(
                  AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('Do you want to remove ${PremierLeague.strName} from your favorites?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          controller.removeFavorite(PremierLeague);
                          Get.snackbar(
                            'Removed from Favorites',
                            '${PremierLeague.strName} has been removed from your favorites.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          Get.back();
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
