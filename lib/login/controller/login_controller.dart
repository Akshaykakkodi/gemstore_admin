import 'package:flutter/material.dart';
import 'package:gemstore_admin/admin_panel/view/home.dart';
import 'package:gemstore_admin/core/app_constants.dart';
import 'package:gemstore_admin/login/model/admin_model.dart';

class LoginController extends ChangeNotifier {

  String email="admin123@gmail.com";

  String password="Admin@123";

  bool isAuthenticated=false;
  bool isLoading=false;
  bool isObsecured=true;

void authenticateAdmin(AdminModel admin,BuildContext context){
  isLoading=true;
if(admin.email==email && admin.password==password){
isAuthenticated=true;
}else{
  AppConstants.showErrorMessage("Please Enter valid email & password", context);
}
if(isAuthenticated){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home() ,));
}
isLoading=false;
notifyListeners();
}



}