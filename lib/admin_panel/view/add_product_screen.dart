import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/controller/admin_controller.dart';
import 'package:gemstore_admin/admin_panel/view/home.dart';
import 'package:gemstore_admin/core/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameCntrl = TextEditingController();
  TextEditingController priceCntrl = TextEditingController();
  TextEditingController productDescriptionCntrl = TextEditingController();
  TextEditingController stockCntrl=TextEditingController();

  @override
  void initState() {
    Provider.of<AdminController>(context, listen: false).fetchColorandSize();
    super.initState();
  }

@override
  void dispose() {
    // TODO: implement dispose
     Provider.of<AdminController>(context, listen: false).clear();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(
            "List new Product",
            style:
                GoogleFonts.ptSans(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: productNameCntrl,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    hintText: "Product Name",
                    hintStyle: AppConstants.hintStyles),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: priceCntrl,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    hintText: "Price",
                    hintStyle: AppConstants.hintStyles),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: productDescriptionCntrl,
                maxLines: 5,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    hintText: "Product description",
                    hintStyle: AppConstants.hintStyles),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                hint: Text(
                  "Select a category",
                  style: GoogleFonts.ptSans(
                      fontSize: 14, color: Colors.black.withOpacity(0.5)),
                ),
                items: [
                  DropdownMenuItem(
                    value: "Womens",
                    child: Text(
                      "Womens",
                      style: GoogleFonts.ptSans(
                          fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  DropdownMenuItem(
                      value: "Mens",
                      child: Text(
                        "Mens",
                        style: GoogleFonts.ptSans(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                      )),
                  DropdownMenuItem(
                    value: "Accesories",
                    child: Text(
                      "Accesories",
                      style: GoogleFonts.ptSans(
                          fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Beauty",
                    child: Text(
                      "Beauty",
                      style: GoogleFonts.ptSans(
                          fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ],
                onChanged: (value) {
                  Provider.of<AdminController>(context, listen: false)
                      .selectCategory(value!);
                },
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD6D6D6))),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD6D6D6))),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: stockCntrl,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD6D6D6))),
                    hintText: "stock",
                    hintStyle: AppConstants.hintStyles),
              ),

              const SizedBox(
                height: 20,
              ),
              Consumer<AdminController>(
                builder: (context, controller, child) => MultiSelectDropDown(
                  // clearIcon: true,
                  // controller: _controller,
                  hint: "select colors",
                  onOptionSelected: (options) {
                    options.forEach((element) {
                      print(" is ${element.label}");
                    });
                    options.forEach((element) {
                      controller.selectColors(element.value.toString());
                    });
                  },
                  onOptionRemoved: (index, option) {
                    controller.removeColors(option.label);
                  },
                  options: List.generate(
                      controller.colorData.length,
                      (index) => ValueItem(
                          label: controller.colorData[index]["name"],
                          value: controller.colorData[index]["hex"])),

                  // disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<AdminController>(
                builder: (context, controller, child) => MultiSelectDropDown(
                  // clearIcon: true,
                  // controller: _controller,
                  hint: "select Size",
                  onOptionSelected: (
                    options,
                  ) {
                    debugPrint(options.toString());
                    options.forEach((element) {
                      controller.selectSize(element.value.toString());
                    });
                  },
                  onOptionRemoved: (index, option) {
                    controller.removeSize(option.label);
                  },
                  options: List.generate(
                      controller.sizeData.length,
                      (index) => ValueItem(
                          label: controller.sizeData[index]["value"],
                          value: controller.sizeData[index]["id"])),

                  // disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<AdminController>(
                builder: (context, controller, child) => GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffD6D6D6))),
                    child: controller.image != null
                        ? Image.file(
                            controller.image,
                            fit: BoxFit.fill,
                          )
                        : Center(
                            child: Text(
                            "Add image",
                            style: GoogleFonts.ptSans(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5)),
                          )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoButton(
                onPressed: () async {
                  bool success =
                      await Provider.of<AdminController>(context, listen: false)
                          .addProductToFirebase(productNameCntrl.text,
                              priceCntrl.text, productDescriptionCntrl.text,stockCntrl.text);
                  if (success) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                        // ignore: prefer_const_constructors
                        SnackBar(content: Text("Added successfully")));
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>const Home(),
                        ));
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                        // ignore: prefer_const_constructors
                        SnackBar(content: Text("Something went wrong")));
                  }
                },
                padding: EdgeInsets.zero,
                child: Center(
                  child: Consumer<AdminController>(
                    builder: (context, value, child) => Container(
                      height: 51,
                      width: 147,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.5),
                          color: const Color(0xff2D201C)),
                      child: Center(
                          child: value.isAddingProduct
                              ? const CircularProgressIndicator()
                              : Text(
                                  "Upload",
                                  style: GoogleFonts.ptSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      );
    
  }
}
