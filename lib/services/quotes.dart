
import 'package:best_quotes/config.dart';
import 'package:best_quotes/helpers/request.dart';
import 'package:best_quotes/models/quote.dart';

Future<List<Quote>> getQuotes() async {
  final uri = "${databaseUri}quotes.json";

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