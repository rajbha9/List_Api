// import 'dart:convert';
// import 'package:api/modules/models.dart';
// import 'package:http/http.dart' as http;
//
// class APIHelper {
//   APIHelper._();
//
//   static final APIHelper apiHelper = APIHelper._();
//
//   static Future<List<Product>> fetchProducts() async {
//     final response =
//         await http.get(Uri.parse('https://fakestoreapi.com/products'));
//     if(response.statusCode ==200){
//       List<Product> product =[];
//       List<dynamic> jsonList = jsonDecode(response.body);
//       jsonList.map((e) {
//         return product.add(e);
//       }).toList();
//       return product;
//     }else {
//       throw Exception('Failed to load products');
//     }
//   }
// }
import 'dart:convert';
import 'package:api/modules/models.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<Product> products = [];
      List<dynamic> jsonList = jsonDecode(response.body);
      jsonList.forEach((element) {
        products.add(Product.fromJson(element));
      });
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
// import 'dart:convert';
//
// import 'package:api/modules/models.dart';
// import 'package:http/http.dart' as http;
//
// class ApiHelper {
//   ApiHelper._();
//
//   static final ApiHelper apiHelper = ApiHelper._();
//   final String uri = 'https://fakestoreapi.com/products';
//
//   Future<List<Product>> fetchAllData() async {
//     final response = await http.get(Uri.parse(uri));
//     if (response.statusCode == 200) {
//       List<Product> allData = [];
//       List<dynamic> data = jsonDecode(response.body);
//       data.forEach((element) {
//         allData.add(Product.fromJson(element));
//       });
//       return allData;
//     } else {
//       return null!;
//     }
//   }
// }
