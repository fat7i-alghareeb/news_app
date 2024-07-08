import 'package:json_annotation/json_annotation.dart';
import 'source.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  static int intId = 0;
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    intId++;
    return _$ArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
