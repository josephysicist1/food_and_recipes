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