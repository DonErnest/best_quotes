class QuoteCategory {
  final String id;
  final String title;

  const QuoteCategory({required this.id, required this.title});
}


final categories = [
  QuoteCategory(id: "star-wars", title: "Star Wars"),
  QuoteCategory(id: "celebrities", title: "Celebrities"),
  QuoteCategory(id: "saying", title: "Sayings"),
  QuoteCategory(id: "humour", title: "Humour"),
  QuoteCategory(id: "motivational", title: "Motivational"),
];
