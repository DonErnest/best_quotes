import 'package:best_quotes/models/quote.dart';
import 'package:best_quotes/services/quotes.dart';
import 'package:flutter/material.dart';

class QuoteProvider extends ChangeNotifier {
  List<Quote> _quotes = [];
  bool _isFetching = false;
  bool _isFetchErrors = false;


  List<Quote> get quotes => _quotes;
  bool get isFetching => _isFetching;
  bool get isFetchErrors => _isFetchErrors;

  void fetchQuotes() async {
    try {
      _isFetching = true;
      _isFetchErrors = false;
      notifyListeners();
      _quotes = await getQuotes();
      // here we fetch
    } catch (e) {
      _isFetchErrors = true;
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}