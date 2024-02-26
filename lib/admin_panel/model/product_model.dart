class ProductModel {

  final String productName;
  final String id;
  final String price;
  final String description;
  final String category;
  final String imageUrl;
   List ?size;
   List? colors;
   String stock;


  ProductModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.stock,
     this.size,
   this.colors,
  });
}
