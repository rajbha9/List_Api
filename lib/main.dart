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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: ApiCalling(),
      ),
    );
  }
}

class ApiCalling extends StatefulWidget {
  const ApiCalling({super.key});

  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Apihelper.apihelper.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? products = snapshot.data;
          return ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context, index) {
              return Container(
                height: 300,
                width: 100,
                color: Colors.grey,
                child: ListView(

                    children: [
                      Container(height: 250,width: 100,child: Image.network(products[index].image,fit: BoxFit.fill,)),
                      Text(products[index].title),
                      Text(products[index].price.toStringAsFixed(2))
                    ],
                  ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }
//
// class _ProductListState extends State<ProductList> {
//   late Future<List<Product>> futureProducts;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Product>>(
//       future: ApiHelper.apiHelper.fetchProducts(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<Product>? products = snapshot.data;
//           return ListView.builder(
//             itemCount: products!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading: Image.network(products[index].image),
//                 title: Text(products[index].title),
//                 subtitle: Text(products[index].description),
//                 trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("${snapshot.error}"),
//           );
//         }
//         // By default, show a loading spinner
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
