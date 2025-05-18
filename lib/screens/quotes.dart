import 'package:best_quotes/app_routes.dart';
import 'package:best_quotes/models/category.dart';
import 'package:best_quotes/models/quote.dart';
import 'package:best_quotes/providers/quote.dart';
import 'package:best_quotes/widget/canvas.dart';
import 'package:best_quotes/widget/quote_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late List<Quote> quotes;
  late String? categoryId;
  late QuoteProvider quotesProvider;

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
    quotesProvider = context.watch<QuoteProvider>();

    if (quotesProvider.isFetchErrors) {
      WidgetsBinding.instance.addPostFrameCallback((duration) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong'),
            action: SnackBarAction(
              label: 'Try again',
              onPressed: () => quotesProvider.fetchList(categoryId),
            ),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    Future.microtask(() {
      quotesProvider.clearErrors();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    quotesProvider = context.watch<QuoteProvider>();
    final theme = Theme.of(context);

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
          itemBuilder: (ctx, idx) {
            final quote = quotesProvider.quotes[idx];
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed:
                        (ctx) => quotesProvider.remove(quote.id, categoryId),
                    icon: Icons.delete,
                    backgroundColor: theme.colorScheme.error.withAlpha(220),
                    label: 'Delete',
                    borderRadius: BorderRadius.circular(20),
                  ),
                  SlidableAction(
                    onPressed:
                        (ctx) => Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.editQuote, arguments: quote.id),
                    icon: Icons.edit,
                    backgroundColor: theme.colorScheme.secondary.withAlpha(220),
                    label: 'Edit',
                    borderRadius: BorderRadius.circular(20),
                  ),
                ],
              ),
              child: QuoteTile(quote: quote),
            );
          },
          itemCount: quotesProvider.quotes.length,
        ),
      );
    }

    return ScreenCanvas(widgets: [body], appBarTitleText: "Quotes");
  }
}
