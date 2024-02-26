import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/controller/admin_controller.dart';
import 'package:gemstore_admin/admin_panel/view/add_product_screen.dart';
import 'package:gemstore_admin/admin_panel/view/product_details_screen.dart';
import 'package:gemstore_admin/core/app_constants.dart';
import 'package:gemstore_admin/core/widgets/Product_tile.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Provider.of<AdminController>(context, listen: false).getProductsStream();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "Listed Products",
              style: AppConstants.subHeaderStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer<AdminController>(
              builder: (context, controller, child) => Expanded(
                  child: SizedBox(
                      child:controller.isLoading?Center(child: CircularProgressIndicator()): ListView.builder(
                itemCount: controller.products.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                                product: controller.products[index]),
                          ));
                    },
                    child:
                        ProductTileWidget(product: controller.products[index]),
                  );
                },
              ))),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black.withOpacity(0.5),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
