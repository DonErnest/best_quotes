
import 'package:best_quotes/config.dart';
import 'package:best_quotes/helpers/request.dart';
import 'package:best_quotes/models/quote.dart';

Future<List<Quote>> getQuotes(String? categoryId) async {
  var uri = "${databaseUri}quotes.json";
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
  print(quotes);
  return quotes;
}


Future<void> postQuote(AddQuote quoteData) async {
  final uri = "${databaseUri}quotes.json";
  await request(uri, body: quoteData.toJson(), method: "POST");
}