import 'dart:developer';
import 'package:get/get.dart';
import 'package:transvity/models/trending_repos_model.dart';
import 'package:transvity/services/network_service.dart';

class GithubController extends GetxController {
  var repos = <GithubRepo>[].obs; 
  var isLoading = true.obs;  
  var isError = false.obs;  

  final NetworkService _networkService = NetworkService();

  // Fetch trending repositories
  Future<void> fetchRepos() async {
    isLoading.value = true;
    isError.value = false;
    try {
      final response = await _networkService.get(
        'https://api.github.com/search/repositories',
        queryParameters: {
          'q': 'stars:>1000',
          'sort': 'stars',
          'order': 'desc',
        },
      );
      final List<dynamic> data = response.data['items'];
      repos.value = data.map((json) => GithubRepo.fromJson(json)).toList();
      log('Repositories fetched successfully: ${repos.length}');
    } catch (e) {
      isError.value = true;
      log('Error fetching repositories: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
