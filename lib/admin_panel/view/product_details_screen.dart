import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/model/product_model.dart';
import 'package:gemstore_admin/admin_panel/view/edit_product_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
            Stack(

              children: [
                SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.network(product.imageUrl,fit: BoxFit.fill,)),
                Positioned(
                  left: 25,
                  top: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/backButton.png",scale: 4,))),

                    Positioned(
                  right: 25,
                  top: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(product: product,),));
                    },
                    child:const CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Icon(Icons.edit))))
              ]
            ),

            const SizedBox(height: 15,),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal:31.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Expanded(child: Text(product.productName,style: GoogleFonts.ptSans(fontSize: 18,color: Colors.black),overflow:TextOverflow.ellipsis,softWrap: true ,maxLines: 1,)),
                     Text("\$${product.price}",style: GoogleFonts.ptSans(fontSize: 18,color: Colors.black,fontWeight:FontWeight.w600 ),),
                 ],
               ),

             ),
             const SizedBox(height: 15,),

             Padding(
               padding:const  EdgeInsets.symmetric(horizontal:31.0),
               child: Divider(color: Colors.black.withOpacity(0.2),),
             ),

          if(product.colors!.isNotEmpty && product.size!.isNotEmpty)   Padding(
               padding: const EdgeInsets.symmetric(horizontal:31.0),
               child: Row(
                 children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("color",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
                       const SizedBox(height: 10,),
                        Row(
                   children: List.generate(product.colors!.length, (index) => Padding(
                     padding: const EdgeInsets.only(right:3.0),
                     child: CircleAvatar(
                      radius: 10.2,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: CircleAvatar( radius: 10, backgroundColor: Color(int.parse("0xff${product.colors![index]}")),)),
                   ))
                   ),
                     ],
                   ),
                   Spacer(),
                   
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Size",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
                                               const SizedBox(height: 10,),
                        Row(
                   children: List.generate(product.size!.length, (index) => Padding(
                     padding:const  EdgeInsets.only(right:3.0),
                     child: CircleAvatar(radius: 10, child: Center(child: Text(product.size![index])),),
                   ))
                   ),
                      ],
                    ),
                 ],
               ),
             ),
             const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:31.0),
                child: Row(
                  children: [
                    Text("Category : ",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
                 Text(product.category,style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
                  ],
                ),
              ),
            
            
             const SizedBox(height: 15,),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal:31.0),
               child: Text("Description",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
             ),
             const SizedBox(height: 10),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:31.0),
               child: Text(product.description,style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
             ),
             const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:31.0),
               child: Text("Stock left: ${product.stock}",style: GoogleFonts.ptSans(fontSize: 14,color:const Color(0xff777E90) )),
             ),



             
          ],
        ),
      ),
    );
  }
}