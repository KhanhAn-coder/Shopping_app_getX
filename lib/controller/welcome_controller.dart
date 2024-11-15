import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopping_app_getx/models/welcome.dart';
import 'package:http/http.dart' as http;

class WelcomeController extends GetxController{
  Welcome? welcome;
  var isLoadingData = false.obs;
  var isLoadingWidget = false.obs;
  var isLoadingUserData = false.obs;
  var selectedCategory = 'beauty'.obs;
  var accessToken = ''.obs;
  Map<String,dynamic>? userData;
  Future<void>onInit() async{
    super.onInit();
    fetchProducts();
    selectCategory(selectedCategory.value);
    fetchUserData();
  }

  fetchProducts()async{
    try{
      isLoadingData(true);
      final res = await http.get(Uri.parse('https://dummyjson.com/products/category/${selectedCategory.value}'));
      welcome = Welcome.fromJson(jsonDecode(res.body));
      return welcome;
    }catch(e){
      print(e.toString());
    }finally{
      isLoadingData(false);
    }
  }

  void selectCategory(String category){
    isLoadingWidget(true);
    selectedCategory.value = category;
    isLoadingWidget(false);
  }

  fetchUserData()async{
   try{
     isLoadingUserData(true);
     final res = await http.get(Uri.parse('https://dummyjson.com/auth/me'),
       headers: {'Authorization' : 'Bearer ${accessToken.value}'},
     );
     userData = jsonDecode(res.body) ;
   }catch(e){
     print(e);
   }finally{
     isLoadingUserData(false);
   }

  }
}