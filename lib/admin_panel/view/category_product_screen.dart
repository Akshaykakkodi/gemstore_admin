import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/model/product_model.dart';
import 'package:gemstore_admin/admin_panel/view/product_details_screen.dart';
import 'package:gemstore_admin/core/widgets/Product_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryProductScreen extends StatelessWidget {
  final List<ProductModel> products;
  const CategoryProductScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        padding:const EdgeInsets.symmetric(horizontal: 32),
        child:products.isEmpty? Center(child: Text("No Products Listed",style: GoogleFonts.ptSans(fontSize: 17,color: Colors.black.withOpacity(0.5),))): ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: products[index]),));
              },
              child: ProductTileWidget(product: products[index]));
          },),
      ),
    );
  }
}