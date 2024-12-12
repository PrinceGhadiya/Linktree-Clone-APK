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

  Future<bool> insertUser({
    required String name,
    required String desc,
    required List<Map<String, String>> links,
  }) async {
    try {
      Uri url =
          Uri.parse("http://10.0.2.2/prinx-linktree-clone/api/v1/insert.php");
      Map<String, dynamic> userData = {
        "name": name,
        "desc": desc,
        "links": links,
      };

      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        Map responseData = jsonDecode(response.body);
        if (responseData['data'] == "User created successfully.") {
          log("User inserted successfully.");
          return true;
        } else {
          log("Failed to insert user: ${responseData['error']}");
        }
      } else {
        log("API request failed with status ${response.statusCode}");
      }
    } catch (e) {
      log("Error inserting user: $e");
    }
    return false;
  }
}
