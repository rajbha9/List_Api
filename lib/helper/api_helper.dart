// import 'dart:convert';
// import 'package:api/modules/models.dart';
// import 'package:http/http.dart' as http;
//
// class ApiHelper {
//   ApiHelper._();
//
//   static final ApiHelper apiHelper = ApiHelper._();
//
//   Future<List<Product>> fetchProducts() async {
//     final response =
//         await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if (response.statusCode == 200) {
//       List<Product> products = [];
//       List<dynamic> jsonList = jsonDecode(response.body);
//       jsonList.forEach((element) {
//         products.add(Product.fromJson(element));
//       });
//       return products;
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
// }

import 'dart:convert';

import 'package:api/modules/models.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Apihelper._();

  static final Apihelper apihelper = Apihelper._();

  Future<List<Product>?> fetchProducts() async {
    String uri = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<Product> product = [];
      List<dynamic> jsonList = jsonDecode(response.body);

      jsonList.forEach((element) {
        product.add(Product.fromJson(element));
      });
      return product;
    }
    else{
      throw Exception('data is not found');
    }
  }
}
