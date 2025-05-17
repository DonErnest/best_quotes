import 'package:best_quotes/models/category.dart';
import 'package:best_quotes/models/quote.dart';
import 'package:best_quotes/providers/quote.dart';
import 'package:best_quotes/widget/canvas.dart';
import 'package:best_quotes/widget/quote_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late List<Quote> quotes;
  late String? categoryId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      context.read<QuoteProvider>().fetchList(categoryId);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryId = ModalRoute.of(context)!.settings.arguments as String?;
  }

  @override
  Widget build(BuildContext context) {
    final quotesProvider = context.watch<QuoteProvider>();
    Widget body;

    if (quotesProvider.isFetching) {
      body = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Loading'),
          SizedBox(width: 8),
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ],
      );
    } else if (quotesProvider.quotes.isEmpty) {
      body = Text("No quotes available");
    } else {
      body = Expanded(
        child: ListView.builder(
          itemBuilder:
              (ctx, idx) => QuoteTile(quote: quotesProvider.quotes[idx]),
          itemCount: quotesProvider.quotes.length,
        ),
      );
    }

    return ScreenCanvas(widgets: [body], appBarTitleText: "Quotes");
  }
}
