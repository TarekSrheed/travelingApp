import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/category_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: categories_data
            .map(
              (categoryData) => CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                imageUrl: categoryData.imageUrl,
              ),
            )
            .toList(),
      ),
    );
  }
}
