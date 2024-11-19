import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_19/models/premier_league_model.dart';
import '../services/api_service.dart';

class PremierLeagueController extends GetxController {
  final ApiService apiService = ApiService();

  var premiers = <PremierLeague>[].obs;
  var favorites = <PremierLeague>[].obs;
  var selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    fetchPremiers();
  }

  Future<void> fetchPremiers() async {
    try {
      final data = await apiService.fetchPremiers();
      premiers.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch premiers: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void toggleFavorite(PremierLeague premierLeague) {
    premierLeague.isFavorite = !premierLeague.isFavorite;
    if (premierLeague.isFavorite) {
      favorites.add(premierLeague);
    } else {
      favorites.removeWhere((item) => item.strName == premierLeague.strName);
    }
    premiers.refresh();
    favorites.refresh();
  }

  void removeFavorite(PremierLeague premierLeague) {
    premierLeague.isFavorite = false;
    favorites.removeWhere((item) => item.strName == premierLeague.strName);
    premiers.refresh();
    favorites.refresh();
  }

  void setSelectedIndex(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1; 
    } else {
      selectedIndex.value = index;
    }
  }
}