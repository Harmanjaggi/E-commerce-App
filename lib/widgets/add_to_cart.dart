import 'package:ecommerce/core/store.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items?.contains(catalog) ?? false;
    return ElevatedButton(
      child: isInCart ? Icon(Icons.done) : Text("Add to Cart"),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      onPressed: () {
        if (!isInCart) {
          // _cart.add(catalog);
          AddMutation(catalog);
        }
      },
    );
  }
}
