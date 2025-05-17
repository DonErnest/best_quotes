import 'package:best_quotes/models/category.dart';
import 'package:best_quotes/widget/quote_form/quote_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class QuoteForm extends StatefulWidget {
  final QuoteFormController controller;

  const QuoteForm({super.key, required this.controller});

  @override
  State<QuoteForm> createState() => _QuoteFormState();
}

class _QuoteFormState extends State<QuoteForm> {
  late final List<bool> selectedModes;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Add text")),
              controller: widget.controller.textController,
              maxLines: 3,
              maxLength: 200,
              validator: (value) {
                if (value == null) {
                  return "Please, add text of the quote!";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Add author")),
              controller: widget.controller.authorController,
              maxLines: 1,
              maxLength: 30,
              validator: (value) {
                if (value == null) {
                  return "Please, add author of the quote!";
                }
                return null;
              },
            ),
            DropdownSearch<QuoteCategory>(
              onChanged: (selectedItem) {
                if (selectedItem != null) {
                  widget.controller.categoryIdController.text = selectedItem.id;
                }
              },
              selectedItem: categories[0],
              compareFn: (item1, item2) => item1.id == item2.id,
              items:
                  (f, cs) => categories,
              validator: (value) {
                if (value == null) {
                  return "Please, select category";
                }
                return null;
              },
              dropdownBuilder: (ctx, selectedItem) {
                return ListTile(
                  title: Text(selectedItem!.title),
                );
              },
              popupProps: PopupProps.menu(
                menuProps: MenuProps(
                  align: MenuAlign.bottomCenter
                ),
                fit: FlexFit.loose,
                itemBuilder: (ctx, item, isDisabled, isSelected) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(item.title),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
