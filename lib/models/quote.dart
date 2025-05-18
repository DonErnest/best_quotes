import 'package:best_quotes/models/category.dart';

class Quote {
  final String id;
  final String categoryId;
  final String text;
  final String author;
  final DateTime createdOn;

  const Quote({
    required this.id,
    required this.categoryId,
    required this.text,
    required this.author,
    required this.createdOn,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json["id"],
      author: json["author"],
      categoryId: json["categoryId"],
      text: json["text"],
      createdOn: DateTime.parse(json["createdOn"]),
    );
  }

  String get createdOnDisplay {
    return '${createdOn.day}.${createdOn.month}.${createdOn.year}';
  }
}

class AddQuote {
  final String text;
  final QuoteCategory category;
  final String author;

  AddQuote({
    required this.text,
    required this.category,
    required this.author,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'categoryId': category.id,
      'author': author,
      'createdOn': DateTime.now().toIso8601String(),
    };
  }
}

class UpdateQuote {
  final String text;
  final String categoryId;
  final String author;
  final String createdOn;


  UpdateQuote({
    required this.text,
    required this.categoryId,
    required this.author,
    required this.createdOn,

  });

  factory UpdateQuote.fromJson(Map<String, dynamic> json) {
    return UpdateQuote(
      author: json["author"],
      categoryId: json["categoryId"],
      text: json["text"],
      createdOn: json["createdOn"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'categoryId': categoryId,
      'author': author,
      "createdOn": createdOn
    };
  }
}
