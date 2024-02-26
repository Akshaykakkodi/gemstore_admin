import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/controller/admin_controller.dart';
import 'package:gemstore_admin/admin_panel/view/product_details_screen.dart';
import 'package:gemstore_admin/core/app_constants.dart';
import 'package:gemstore_admin/core/widgets/Product_tile.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding:const EdgeInsets.symmetric(horizontal: 32),
          child: Consumer<AdminController>(
            builder: (context, controller, child) => 
             Column(
              children: [
                TextFormField(
                        // controller: passwordController,
                       
                        onChanged: (value) {
                          controller.searchProducts(value);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search,color: Colors.black.withOpacity(.5),size: 18,),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD6D6D6))
                          ),
                          enabledBorder:const  UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD6D6D6))
                          ),
                          hintText: "search",
                          hintStyle: AppConstants.hintStyles
                        ),
                      ),
          
               if  (controller.searchResult.isNotEmpty)     Expanded(
                        child: SizedBox(
                          child:
                          ListView.builder(
                            itemCount: controller.searchResult.length,
                            itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: controller.searchResult[index]),));
                              },
                              child: ProductTileWidget(product: controller.searchResult[index]));
                          },)
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}