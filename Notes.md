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

-  return GestureDetector(
      child: Container(
        gesture detector, child'ını tıklanabilir yapıyor, aynı durum InkWell için de geçerli ancak Inkwell kullanırsan
        kullanıcı tıkladıgında güzel bir visual feedback alır. GestureDetector kullanırsan visual feedback alamazsın.

- InkWell'in propertylerinden biri de splashColor. Bu özellik tıkladıgında alacagın visual feedback için geçerli.

- 
return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
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
      ),
    );
Inkwell içindeki borderradius özelliği, tıkladıgında oluşacak shadow'un borderlarının circular olmasıyla alakalı.
Eğer UI'da görünen gridlerin kenarlarının circular olmasını istiyorsak o zaman aşağıda container içindeki decoration
propertysinin BoxDecoration içindeki borderRadius'u ayarlamalıyız.

- Eğer içindeki herhangi bir state'i manage edeceğimiz bir durum yoksa o zaman stateless 
widget'ı seçiyoruz.

- 
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => Text(meals[index].title),
      ),
    );
  }
}

- 
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh ... Nothing here'),
            SizedBox(
              height: 16,
            ),
            Text(
              'Select different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);


Değişken olarak widget tanımlayabilirsin, bunu Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
    ); kodunda yaptık. Sonra if statementta eğer liste boşsa, değişken olarak tanımladıgımız content widget'ını bir şeylere 
    eşitledik aşağıda da return edilen yerde body kısmına content yazdık.

- 
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory() {
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), // it controls the lay out of gridview items
        children: [
          // availableCategories.map((category) => CategoryGridItem(category:category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}

    Navigator.push(context, route); Since I am in a stateless widget here, context is not globally available. You might recall that in the state objects that belong to stateful widgets, a context property was globally available and could therefore 
    be used in all the methods, here thats not the case. Bundan dolayı metodun parametresine BuildContext context ekleyeceğiz.

-     //Navigator.push( context, route); == Navigator.of(context).push(route) İkisi de aynı

- 
return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(),
      ),
    );
  Stack widget can be used to position multiple widgets above each other, but not above 
  each other as we do it in a column where they are rendered from top to bottom on a screen, but instead, directly above each other

- 
return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(placeholder: placeholder, image: image)
          ],
        ),
      ),
    );
  gösterilen imageın faded olmasını sağlıyor


- 
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            )
          ],
        ),
      ),
    );
  }
}

- 
child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(),
            )
          ],
        ),
  positioned widgette belirtilen Container FadeInImage'ın üstünde konumlanacak. Bunun sebebi
  positioned widget'ı FadeInWıdget'tan sonra yazıldı.