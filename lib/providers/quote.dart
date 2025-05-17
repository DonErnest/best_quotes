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
  notifyListeners();

  void fetchList(String? categoryId) async {
    try {
      _isFetching = true;
      _isFetchErrors = false;
      final fetchedQuotes = await getQuotes(categoryId);
      if (fetchedQuotes.isEmpty) {
        _quotes = [];
        return;
      }
      _quotes = fetchedQuotes;
    } catch (e) {
      _isFetchErrors = true;
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  void addNew(AddQuote quoteData) async {
    try {
      await postQuote(quoteData);
      notifyListeners();
    } catch (e) {
      _isFetchErrors = true;
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

}