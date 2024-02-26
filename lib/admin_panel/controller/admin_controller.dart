import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/model/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class AdminController extends ChangeNotifier {
  int selectedIndex = 0; //bottomnavigation index

  XFile? pickedFile;
  var image;
  List colorData = []; 
  List selectedColors = [];
  List selectedSizes = [];
  List sizeData = [];
  String? category;
  
  bool isAddingProduct = false;
  bool isProductAdded = false;

  List<ProductModel> products = [];
  List<ProductModel> mensProducts = [];
  List<ProductModel> womensProducts = [];
  List<ProductModel> accessories = [];
  List<ProductModel> beautyProducts = [];
  List<ProductModel> searchResult = [];
  bool isLoading = false;

  //to update bottomnavigation index
  toggleBottomNavigatoinIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }


  pickImage() async {
    final ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile!.path);
    }
    notifyListeners();
  }


  clear() {
    image = null;
    selectedColors = [];
    selectedSizes = [];
    notifyListeners();
  }



//fetch color and size from firebase
  fetchColorandSize() async {
    FirebaseFirestore.instance.collection('colors').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data()["color"]);
        colorData = doc.data()["color"];
      });
    });

    FirebaseFirestore.instance
        .collection('size_chart')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data()["size"]);
        sizeData = doc.data()["size"];
      });
    });

    notifyListeners();
  }

 

  selectCategory(String value) {
    category = value;
    notifyListeners();
  }

  selectColors(String values) {
    if (!selectedColors.contains(values)) {
      selectedColors.add(values);
    }
  }

  selectSize(String values) {
    if (!selectedSizes.contains(values)) {
      selectedSizes.add(values);
    }
  }

  removeColors(String values) {
    selectedColors.remove(values);
  }

  removeSize(String values) {
    selectedSizes.remove(values);
  }


//add product to firebase
  Future<bool> addProductToFirebase(
      String productName, String price, String description,String stock) async {
    try {
      isAddingProduct = true;
      notifyListeners();
      final uid =const Uuid().v4();
      final ref = FirebaseStorage.instance
          .ref()
          .child('productImage')
          .child("${uid}jpg");
      UploadTask uploadTask = ref.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final imgUrl = await snapshot.ref.getDownloadURL();

      FirebaseFirestore.instance.collection("products").doc(uid).set({
        "id":uid,
        "productName": productName,
        "price": price,
        "description": description,
        "category": category,
        "imageUrl": imgUrl,
        "size": selectedSizes,
        "colors": selectedColors,
        "stock":stock
      });
      isAddingProduct = false;
      notifyListeners();
      clear();
      return true;
    } catch (e) {
      log(e.toString());
      isAddingProduct = false;
      notifyListeners();
      return false;
    }
  }

  

 


  // function to fetch product data from firebase
  getProductsStream() async {
    isLoading = true;
    // notifyListeners();
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection("products");
    
    var snapshot = await productsCollection.get();
    
    products = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ProductModel(
        id: data['id'],
        productName: data['productName'],
        price: data['price'],
        description: data['description'],
        category: data['category'],
        imageUrl: data['imageUrl'],
        stock: data['stock'],
        size: data['size'] != null ? List<String>.from(data['size']) : null,
        colors:
            data['colors'] != null ? List<String>.from(data['colors']) : null,
      );
    }).toList();
    mensProducts =
        products.where((element) => element.category == "Mens").toList();
    womensProducts =
        products.where((element) => element.category == "Womens").toList();
    accessories =
        products.where((element) => element.category == "Accesories").toList();
    beautyProducts =
        products.where((element) => element.category == "Beauty").toList();
    isLoading = false;
    notifyListeners();
  }


//function to search products 
  searchProducts(String query) {
    searchResult = products
        .where((element) =>
            element.productName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    log(searchResult.length.toString());
    if (query == "") {
      searchResult = [];
    }
    notifyListeners();
 
  }



}
