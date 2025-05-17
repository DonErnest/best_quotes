import 'package:best_quotes/app_routes.dart';
import 'package:best_quotes/models/category.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final QuoteCategory? category;

  const CategoryButton({super.key, this.category});

  bool get categorySelected => category != null;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 0,
      ),
      child: TextButton(
        onPressed: () {
          final categoryArg = categorySelected? category!.id : null;
            Navigator.of(
              context,
            ).pushNamed(AppRoutes.quotes, arguments: categoryArg);
        },
        child: Text(categorySelected? category!.title : "All categories"),
      ),
    );
  }
}
