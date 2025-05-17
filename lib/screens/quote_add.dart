import 'package:best_quotes/providers/quote.dart';
import 'package:best_quotes/widget/canvas.dart';
import 'package:best_quotes/widget/quote_form/quote_controller.dart';
import 'package:best_quotes/widget/quote_form/quote_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuoteAddScreen extends StatefulWidget {
  const QuoteAddScreen({super.key});

  @override
  State<QuoteAddScreen> createState() => _QuoteAddScreenState();
}

class _QuoteAddScreenState extends State<QuoteAddScreen> {
  final quoteFormController = QuoteFormController();
  late QuoteProvider quotesProvider;

  void addQuote() {
    if (quoteFormController.formKey.currentState!.validate()) {
      final quoteData = quoteFormController.getNewQuote();
      quotesProvider.addNew(quoteData);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    quoteFormController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    quotesProvider = context.watch<QuoteProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        QuoteForm(controller: quoteFormController),
        TextButton(onPressed: addQuote, child: Text("Add quote")),
      ],
      appBarTitleText: "Add quote",
    );
  }
}
