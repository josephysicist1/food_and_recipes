import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;
  // burada yeni bir değişken tanımlayacaksak constructor içinde de
  // o değişkene atama yaptırmamız gerekiyor.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
