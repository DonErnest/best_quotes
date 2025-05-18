import 'package:best_quotes/helpers/request.dart';
import 'package:best_quotes/models/quote.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final quotesDatabaseUri = dotenv.env['BASE_QUOTES_URL'];


Future<List<Quote>> getQuotes(String? categoryId) async {
  var uri = "${quotesDatabaseUri}quotes.json";
  if (categoryId != null) {
    uri += "?orderBy=\"categoryId\"&equalTo=\"$categoryId\"";
  }
  final response = await request(uri);

  if (response == null) {
    return [];
  }

  List<Quote> quotes = [];
  for (final key in response.keys) {
    final Map<String, dynamic> quoteJson = {...response[key], 'id': key};
    final quote = Quote.fromJson(quoteJson);
    quotes.add(quote);
  }
  return quotes;
}

Future<UpdateQuote?> getQuote(String quoteId) async {
  final uri = '${quotesDatabaseUri}quotes/$quoteId.json';
  final response = await request(uri);

  if (response == null) {
    return null;
  }

  final Map<String, dynamic> quoteJson = {...response};
  final quoteData = UpdateQuote.fromJson(quoteJson);
  return quoteData;
}


Future<void> postQuote(AddQuote quoteData) async {
  final uri = "${quotesDatabaseUri}quotes.json";
  await request(uri, body: quoteData.toJson(), method: "POST");
}

Future<void> updateQuote(String id, UpdateQuote quoteData) async {
  final uri = '${quotesDatabaseUri}quotes/$id.json';
  await request(uri, body: quoteData.toJson(), method: "PUT");
}

Future<void> deleteQuote(String id) async  {
  final uri = '${quotesDatabaseUri}quotes/$id.json';
  await request(uri, method: "DELETE");
}
