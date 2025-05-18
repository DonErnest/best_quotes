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

  void clearErrors() {
    _isFetchErrors = false;
    notifyListeners();
  }

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

  Future<UpdateQuote?> fetchOne(String quoteId) async {
    try {
      _isFetching = true;
      _isFetchErrors = false;
      final fetchedQuote = await getQuote(quoteId);
      if (fetchedQuote == null) {
        return fetchedQuote;
      }
      _isFetching = false;
      return fetchedQuote;
    } catch (e) {
      _isFetchErrors = true;
      _isFetching = false;
      return null;
    }
  }

  void addNew(AddQuote quoteData) async {
    try {
      await postQuote(quoteData);
      _isFetching = true;
      _isFetchErrors = false;
      final fetchedQuotes = await getQuotes(null);
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

  void edit(String id, UpdateQuote quoteData) async {
    try {
      await updateQuote(id, quoteData);
      _isFetching = true;
      _isFetchErrors = false;
      final fetchedQuotes = await getQuotes(null);
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

  void remove (String id, String? categoryId) async {
    try {
      await deleteQuote(id);
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

}