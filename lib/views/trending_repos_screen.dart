import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transvity/controllers/trending_repos_controller.dart';
import 'package:transvity/custom_widgets/custom_expansion_tile_widget.dart';

class TrendingReposScreen extends StatelessWidget {
  final GithubController controller = Get.put(GithubController());

  TrendingReposScreen({super.key}) {
    controller.fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.fetchRepos();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListTile(
                  leading: const CircleAvatar(),
                  title: Container(height: 10, color: Colors.white),
                  subtitle: Container(height: 10, color: Colors.white),
                ),
              );
            },
          );
        } else if (controller.isError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/retry.json', width: 150),
                const SizedBox(height: 10),
                const Text('Something went wrong!'),
                ElevatedButton(
                  onPressed: controller.fetchRepos,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemCount: controller.repos.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: Colors.grey[300],
              height: 20,
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              final repo = controller.repos[index];
              return CustomExpansionTile(repo: repo);
            },
          );
        }
      }),
    );
  }
}

