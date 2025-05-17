import 'package:best_quotes/models/category.dart';
import 'package:best_quotes/widget/canvas.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        ListView.builder(
          itemBuilder:
              (ctx, idx) => TextButton(
                onPressed: () {},
                child: Text(categories[idx].title),
              ),
          itemCount: categories.length,
        ),
      ],
      appBarTitleText: "Choose category",
    );
  }
}
