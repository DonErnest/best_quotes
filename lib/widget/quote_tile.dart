import 'package:best_quotes/models/quote.dart';
import 'package:best_quotes/services/quotes.dart' show deleteQuote;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class QuoteTile extends StatelessWidget {
  final Quote quote;
  const QuoteTile({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(quote.text),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Text(
                "By ${quote.author}",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: Text("added on ${quote.createdOnDisplay}"),
          ),
        ),
      );
  }
}
