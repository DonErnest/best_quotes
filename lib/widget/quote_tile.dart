import 'package:best_quotes/models/quote.dart';
import 'package:flutter/material.dart';



class QuoteTile extends StatelessWidget {
  final Quote quote;

  const QuoteTile({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(quote.text),
      subtitle: Text("By ${quote.author}"),
    );
  }
}
