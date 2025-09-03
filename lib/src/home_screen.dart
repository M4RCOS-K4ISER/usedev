import 'package:flutter/material.dart';
import 'models/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Category> categories = const [
    Category(name: 'Eletrônicos', icon: Icons.devices),
    Category(name: 'Roupas', icon: Icons.checkroom),
    Category(name: 'Esportes', icon: Icons.sports_soccer),
    Category(name: 'Móveis', icon: Icons.chair),
    Category(name: 'Livros', icon: Icons.book),
    Category(name: 'Beleza', icon: Icons.brush),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 40, errorBuilder:
            (context, error, stackTrace) {
          return const Text("UseDev");
        }),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_2_outlined)),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              leading: Icon(category.icon, size: 30, color: Colors.deepPurple),
              title: Text(category.name),
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Clicou em ${category.name}')),
                );
              },
            );
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Tela Principal',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}