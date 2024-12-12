import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  fetchAllUsers() async {
    try {
      Uri url = Uri.parse(
          "http://10.0.2.2/prinx-linktree-clone/api/v1/fetch_users.php");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        log("API fetched successfully...");
        Map rawData = jsonDecode(response.body);
        List? users = rawData['data'];
        log(users.toString());
        return users;
      } else {
        log("API request failed with status ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching API data: $e");
    }
  }

  fetchSingleUser({required String name}) async {
    try {
      Uri url = Uri.parse(
          "http://10.0.2.2/prinx-linktree-clone/api/v1/fetch_user.php?name=$name");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        log("API fetched successfully...");

        return jsonDecode(response.body);
      } else {
        log("API request failed with status ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching API data: $e");
    }
  }
}
