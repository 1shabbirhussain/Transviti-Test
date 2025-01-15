class GithubRepo {
  final int id;
  final String repoName;
  final String description;
  final String ownerName;
  final String ownerAvatar;
  final String htmlUrl;
  final int stars;
  final String language;

  GithubRepo({
    required this.id,
    required this.repoName,
    required this.description,
    required this.ownerName,
    required this.ownerAvatar,
    required this.htmlUrl,
    required this.stars,
    required this.language,
  });

  // Factory constructor to parse JSON response
  factory GithubRepo.fromJson(Map<String, dynamic> json) {
    return GithubRepo(
      id: json['id'] as int? ?? 0,
      repoName: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      ownerName: json['owner']?['login'] as String? ?? '', 
      ownerAvatar: json['owner']?['avatar_url'] as String? ?? '',
      htmlUrl: json['html_url'] as String? ?? '',
      stars: json['stargazers_count'] as int? ?? 0,
      language: json['language'] as String? ?? '',
    );
  }
}
