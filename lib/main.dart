import 'package:best_quotes/providers/quote.dart';
import 'package:best_quotes/screens/categories.dart';
import 'package:best_quotes/screens/not_found.dart';
import 'package:best_quotes/screens/quote_add.dart';
import 'package:best_quotes/screens/quotes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (ctx) => QuoteProvider()),
      ],
        child: MaterialApp(
          routes: {
            AppRoutes.categories: (ctx) => CategoriesScreen(),
            AppRoutes.quotes: (ctx) => QuoteScreen(),
            AppRoutes.addQuote: (ctx) => QuoteAddScreen(),
          },
          initialRoute: AppRoutes.categories,
          title: "Browse brilliant quotes of our timeline",
          onUnknownRoute:
              (s) => MaterialPageRoute(builder: (ctx) => NotFoundScreen()),
        ),
      )

  );
}
