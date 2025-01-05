import 'package:flutter/material.dart';
import 'package:food_app/constants/constants.dart';
import 'package:food_app/models/api_eror.dart';
import 'package:food_app/models/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;
  RxBool _isTriggered = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isTriggered => _isTriggered.value;
  List<FoodsModel>? searchResults;

  set setLoading(bool value) {
    _isLoading.value = value;
    update();  // Notify listeners for UI update
  }

  set setTrigger(bool value) {
    _isTriggered.value = value;
    update();  // Notify listeners for UI update
  }

  void searchFoods(String key) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        searchResults = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
        // You can handle the error here if necessary, e.g., show a dialog
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
      // Handle the error (e.g., show a message to the user)
    }
  }
}
