import 'package:best_quotes/models/category.dart';

class Quote {
  final String id;
  final String categoryId;
  final String text;
  final String author;

  const Quote({
    required this.id,
    required this.categoryId,
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json["id"],
      author: json["author"],
      categoryId: json["categoryId"],
      text: json["text"],
    );
  }
}
