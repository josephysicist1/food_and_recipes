- 
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount), // it controls the lay out of gridview items
        children: [],
      ),
    );
  }
}

GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2), // it controls the lay out of gridview items
        children: [],
      ), Bu kodda crossAxisCount kısmında belirttiğimiz sayı, aslında kaç tane column olacağını gösteriyor. Grid'in 
      mainaxis'i top to bottom ancak cross'ta left to right oluyor. Buradaki sayı da kaç tane column olacağını gösteriyor.
SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:) buradaki childAspectRatio property'si 
size of grid üzerinde etkili.

- 
return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), // it controls the lay out of gridview items
        children: [],
      ),
    );
    children kısmında artık gridlerdeki itemları ekleyebiliriz.


- 
class Category {
  final String id;
  final String title;
  final Color color;
  Category({required this.id, required this.title, this.color= Colors.orange});
}
default color'ı orange yaptık, yani eğer bir color provided olmazsa default olarak orange yapılacak.

- // Models içinde datanın structureının nasıl olması gerektiğini tutuyoruz.

- 
return Container(
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
    );

-       child: Text(category.title, style: Theme.of(context).textTheme.titleLarge,),

- 
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),


- 
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

- // availableCategories.map((category) => CategoryGridItem(category:category)).toList()
bu kod satırı ile  
for (final category in availableCategories)
  CategoryGridItem(category: category)
bu kod satırı aynı.

- padding, GridView'in propertylerinden biri