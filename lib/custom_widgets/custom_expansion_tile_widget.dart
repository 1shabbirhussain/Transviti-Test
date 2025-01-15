import 'package:flutter/material.dart';
import 'package:transvity/models/trending_repos_model.dart';

class CustomExpansionTile extends StatelessWidget {
  final GithubRepo repo;

  const CustomExpansionTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.zero,
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(repo.ownerAvatar),
      ),
      title: subTitleTextWidget(text: repo.ownerName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repo.repoName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      childrenPadding: const EdgeInsets.fromLTRB(72, 0, 8, 16),
      expandedAlignment: Alignment.topLeft,
      trailing: const SizedBox.shrink(),
      children: [
        subTitleTextWidget(
          text: repo.description.isNotEmpty
              ? repo.description
              : 'No description available.',
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                subTitleTextWidget(text: repo.stars.toString()),
              ],
            ),
            const SizedBox(width: 16),
            if (repo.language.isNotEmpty)
              Row(
                children: [
                  const Icon(Icons.code, size: 16),
                  const SizedBox(width: 4),
                  subTitleTextWidget(text: repo.language),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Text subTitleTextWidget({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
