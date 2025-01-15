import 'package:flutter/material.dart';
import 'package:transvity/models/home_model.dart';

class CustomExpansionTile extends StatelessWidget {
  final GithubRepo repo;

  const CustomExpansionTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent), // Removes the border
        borderRadius: BorderRadius.zero,
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(repo.ownerAvatar),
      ),
      title: Text(
        repo.ownerName,
        style: const TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.normal,
        ),
      ),
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
        Text(
          repo.description.isNotEmpty
              ? repo.description
              : 'No description available.',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, size: 16, color: Colors.amber),
            const SizedBox(width: 4),
            Text(
              repo.stars.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(width: 16),
            if (repo.language.isNotEmpty)
              Row(
                children: [
                  const Icon(Icons.code, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    repo.language,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
