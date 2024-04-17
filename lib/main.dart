// import 'package:flutter/material.dart';
//
// import 'homapage.dart';
//
// void main()
// {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//       '/':(context) => Homepage(),
//     },);
//   }
// }
import 'package:api/helper/api_helper.dart';
import 'package:api/modules/models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: ProductList(),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProducts;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ApiHelper.apiHelper.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? products = snapshot.data;
          return ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(products[index].image),
                title: Text(products[index].title),
                subtitle: Text(products[index].description),
                trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        // By default, show a loading spinner
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
