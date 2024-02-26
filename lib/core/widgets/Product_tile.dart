import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  const ProductTileWidget({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:const Color(0xffFBFBFB),width: 0.5)
        ),
        child: Row(
          children: [
            Container(
              width: 97.85,
              height: 100,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(20),topLeft:Radius.circular(20) ),
                image: DecorationImage(image: NetworkImage(product.imageUrl),scale: 4,fit: BoxFit.fill
              ),
            ),),
           const SizedBox(width: 13.5,),
          Expanded(
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,),
                Text(product.productName,style: GoogleFonts.ptSans(fontSize: 13,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,),
                const SizedBox(height: 10,),
                 Text("\$${product.price}",style: GoogleFonts.ptSans(fontSize: 13,fontWeight: FontWeight.w600),),
                 const SizedBox(height: 10,),
          
                 Row(
                   children: [
                   const SizedBox(width: 100,),
                     Container(
                      height: 22,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withOpacity(0.5))
                      ),
                      child: Center(child: Text(product.stock,style: GoogleFonts.ptSans(fontSize: 13,color: Colors.black.withOpacity(0.5)),)),
                     ),
                   ],
                 )
              ],
            ),
          ),
          const SizedBox(width: 16,),

          ],
        ),
      ),
    );
  }
}