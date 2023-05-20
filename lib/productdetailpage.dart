import 'package:ecommerce_app1/storepage.dart';
import 'package:ecommerce_app1/cartpage.dart';
import 'package:ecommerce_app1/cratmodel.dart';
import 'package:ecommerce_app1/main.dart';
import 'package:ecommerce_app1/registeration.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/home.dart';

class productdetailpage extends StatelessWidget {
  final Product product;

  productdetailpage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        actions: [
          Icon(Icons.shopping_cart),
        ],
        title: Text(product.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.imgUrl,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('\$${product.price}'),
            SizedBox(height: 16),
            Text(
              product.qty.toString(),

            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: (){},
              child: Text('Add to Cart'),
              style:  ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
