
import 'package:flutter/material.dart';
import 'product.dart';
import 'cart_page.dart';
import 'cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Belanja',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Nasi Goreng',
      price: 15000,
      image: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500',
    ),
    Product(
      id: 2,
      name: 'Mie Goreng',
      price: 12000,
      image: 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500',
    ),
    Product(
      id: 3,
      name: 'Ayam Geprek',
      price: 18000,
      image: 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500',
    ),
  ];

  void addToCart(Product product) {
    setState(() {
      CartModel.addItem(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} berhasil ditambahkan!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Produk',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart,
                color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              ).then((_) => setState(() {}));
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Image.network(
                product.image,
                width: 65,
                height: 65,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.fastfood, size: 45);
                },
              ),
              title: Text(product.name),
              subtitle: Text(
                'Rp ${product.price}',
              ),
              trailing: ElevatedButton(
                onPressed: () => addToCart(product),
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }
}
