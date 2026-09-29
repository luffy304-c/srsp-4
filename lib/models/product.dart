class Product {
  final String nameKey;
  final int price;
  final String image;

  const Product(this.nameKey, this.price, this.image);
}

const products = [
  Product('notebook', 1200, 'assets/images/notebook.png'),
  Product('backpack', 8500, 'assets/images/backpack.png'),
  Product('headphones', 6500, 'assets/images/headphones.png'),
  Product('mug', 2300, 'assets/images/mug.png'),
];
