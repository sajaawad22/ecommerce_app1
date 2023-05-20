import 'package:ecommerce_app1/cratmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app1/storepage.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Cart"),
        actions: <Widget>[
          TextButton(
              child: Text(
                "Clear",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => cartModel.clearCart())
        ],
      ),
      body: cartModel.cart.length == 0
          ? Center(
        child: Text("No items in Cart"),
      )
          : Container(
          padding: EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cartModel.total,
                itemBuilder: (context, index) {
                  return Consumer<CartModel>(
                    builder: (context, model, child) {
                      return ListTile(
                        title: Text(model.cart[index].title),
                        subtitle: Text(
                            '${model.cart[index].qty} x ${model.cart[index].price} = ${(model.cart[index].qty * model.cart[index].price).toStringAsFixed(2)}'),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  model.updateProduct(
                                      model.cart[index],
                                      model.cart[index].qty + 1);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  model.updateProduct(
                                      model.cart[index],
                                      model.cart[index].qty - 1);
                                },
                              ),
                            ]),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Total: \$${cartModel.totalCartValue.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                )),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("BUY NOW"),

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    //onPrimary: Colors.black,
                  ),
                ))
          ])),
    );
  }
}