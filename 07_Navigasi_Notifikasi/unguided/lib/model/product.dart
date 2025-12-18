class Product {
  final String name;
  final String image;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

List<Product> productList = [
  Product(
    name: 'New Balance 327',
    image: 'assets/images/Nb327.jpg',
    price: 1450000,
    description:
        'Retro style dengan suede premium dan outsole bergaya khas 70-an. Nyaman dan stylish.',
  ),
  Product(
    name: 'New Balance 530R',
    image: 'assets/images/Nb530r.jpg',
    price: 1750000,
    description:
        'Sneaker klasik yang kembali tren. Nyaman untuk harian dengan tampilan clean.',
  ),
  Product(
    name: 'New Balance 574',
    image: 'assets/images/Nb574.jpg',
    price: 1550000,
    description:
        'Ikon sejati. Desain timeless dan teknologi ENCAP yang nyaman dipakai sepanjang hari.',
  ),
  Product(
    name: 'NB 991v2 x Stone Island',
    image: 'assets/images/nb991v2stoneisland.jpg',
    price: 3850000,
    description:
        'Kolaborasi eksklusif NB x Stone Island — gaya eksperimental dan bahan premium.',
  ),
  Product(
    name: 'New Balance 2002R',
    image: 'assets/images/Nb2002r.jpg',
    price: 2350000,
    description:
        'Desain futuristik dan empuk. Sepatu terbaik untuk mix fashion dan kenyamanan.',
  ),
];
