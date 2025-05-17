import 'package:best_quotes/models/category.dart';
import 'package:flutter/material.dart';

import 'package:best_quotes/models/quote.dart';

class QuoteFormController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final textController = TextEditingController();
  final authorController = TextEditingController();
  final categoryIdController = TextEditingController();

  void dispose() {
    textController.dispose();
    authorController.dispose();
    categoryIdController.dispose();
  }

  AddQuote getNewQuote() {
    final category = categories.firstWhere(
      (category) => category.id == categoryIdController.text,
    );
    final newQuote = AddQuote(
      text: textController.text,
      category: category,
      author: authorController.text,
    );
    return newQuote;
  }
}
