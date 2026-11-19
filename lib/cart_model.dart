
import 'product.dart';

class CartModel {
  static final List<Product> items = [];

  // Menambahkan produk ke keranjang
  static void addItem(Product product) {
    items.add(product);
  }

  // Menghapus produk berdasarkan index
  static void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
    }
  }

  // Menghitung total harga
  static int get totalPrice {
    int total = 0;

    for (var item in items) {
      total += item.price;
    }

    return total;
  }

  // Menghitung jumlah produk
  static int get totalItems {
    return items.length;
  }
}
