import 'package:ecommerce/core/store.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, dynamic, _) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          SizedBox(
            width: 15.0,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).buttonColor),
            ),
            child: Text(
              'Buy',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Text('Cart is Empty')
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () => RemoveMutation(_cart.items[index])),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
