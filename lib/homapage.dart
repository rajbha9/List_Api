import 'package:api/helper/api_helper.dart';
import 'package:flutter/material.dart';

import 'modules/models.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ProductList());
  }
}
// flutter upgrade

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProduct = APIHelper.fetchProducts() as Future<List<Product>>;

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: futureProduct,
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
                trailing: Text('\$${products[index].price}'),
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
