import 'package:get/get.dart';
import 'package:linktree_prinx/helper/api_helper.dart';

class HomeController extends GetxController {
  var searchText = ''.obs;
  var isLoading = false.obs;
  var users = <dynamic>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers(); // Fetch all users initially
  }

  void fetchAllUsers() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      users.value = await ApiHelper.apiHelper.fetchAllUsers();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void fetchSingleUser(String name) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      users.value = await ApiHelper.apiHelper.fetchSingleUser(name: name);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void updateSearchText(String value) {
    searchText.value = value;
    if (value.isNotEmpty) {
      fetchSingleUser(value);
    } else {
      fetchAllUsers();
    }
  }
}
