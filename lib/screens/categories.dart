import 'package:best_quotes/app_routes.dart';
import 'package:best_quotes/models/category.dart';
import 'package:best_quotes/widget/canvas.dart';
import 'package:flutter/material.dart';

import '../widget/category_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      appBarActions: [
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.addQuote),
          icon: Icon(Icons.add),
        ),
      ],
      widgets: [
        SingleChildScrollView(
          child: Column(
            children: [
              ...categories.map(
                (category) => CategoryButton(category: category),
              ),
              CategoryButton(category: null),
            ],
          ),
        ),
      ],
      appBarTitleText: "Choose category",
    );
  }
}
