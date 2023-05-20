import 'package:ecommerce_app1/cratmodel.dart';
import 'package:ecommerce_app1/productdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "iPhone 12 pro max ",
        price: 1500,
        imgUrl: "https://cdn.akakce.com/apple/iphone-12-pro-max-128-gb-grafit-z.jpg",
        qty: 1),
    Product(
        id: 2,
        title: "Samsung Galaxy A23",
        price: 1200,
        imgUrl: "https://cdn.akakce.com/z/samsung/samsung-galaxy-a23.jpg",
        qty: 1),
    Product(
        id: 3,
        title: "Huawei P30 pro",
        price: 850,
        imgUrl: "https://n11scdn.akamaized.net/a1/602_857/03/72/62/98/IMG-482403325032052000.jpg",
        qty: 1),
    Product(
        id: 4,
        title: "Lenovo Legion y7000",
        price: 1700,
        imgUrl: "https://www.lenovo.com/medias/lenovo-laptop-legion-y7000-hero.png?context=bWFzdGVyfHJvb3R8MzQxMjUwfGltYWdlL3BuZ3xoOGEvaDE5LzE0MzM5NDEyNjg4OTI2LnBuZ3xmOTE0Zjg2NDhiNTUxMDBiZjMxODViN2RjZGZjNDg5ZjI2MjA0ZGQ0ZTZkYTg0NDkxNjM5ZjhkY2JmMGVlYTIy",
        qty: 1),
    Product(
        id: 5,
        title: "Xiaomi Redmi note 10pro",
        price: 1000,
        imgUrl: "https://cdn.akakce.com/z/xiaomi/xiaomi-redmi-note-10-pro-128-gb-8-gb.jpg",
        qty: 1),
    Product(
        id: 6,
        title: "Oppo Find X5 Pro",
        price: 700,
        imgUrl: "https://cdn.akakce.com/z/oppo/oppo-find-x5.jpg",
        qty: 1),
    Product(id: 7,
        title: "Samsung S22 Ultra",
        price: 1200,
        qty: 5,
        imgUrl: "https://cdn.akakce.com/z/samsung/samsung-galaxy-s22-ultra-5g-256-gb.jpg"),
    Product(id: 8,
        title: "Samsung Galaxy S22",
        price: 1400,
        qty:  6,
        imgUrl: "https://cdn.akakce.com/z/samsung/samsung-galaxy-s22-5g.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: _products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Consumer<CartModel>(
          builder: (context, cart, child) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context) => productdetailpage(product: _products[index]),

                    )
                );
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      _products[index].imgUrl,
                      height: 120,
                      width: 120,
                    ),
                    Text(
                      _products[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("\$" + _products[index].price.toString()),
                    TextButton(
                        child: Text("Add"),
                        onPressed: () {
                          cart.addProduct(_products[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(" ${_products[index].title} was added to cart"),
                                duration: Duration(seconds: 2)
                            ),
                          );

                        }
                    )

                  ],
                ),
              ),
            );
          },
        );
      },
    );


  }
}