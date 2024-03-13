class News {
  static int intId = 0;
  final String id;
  final String title;
  final String description;
  final String image;
  final String url;
  final String author;
  final String publishedAt;
  final String content;
  final String sourceName;
  News({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.url,
    required this.author,
    required this.publishedAt,
    required this.content,
    required this.sourceName,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    intId++;
    return News(
      id: intId.toString(),
      image: json['urlToImage'] ?? "",
      url: json['url'] ?? "",
      author: json['author'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      sourceName: json['source']['name'] ?? "",
    );
  }
}
