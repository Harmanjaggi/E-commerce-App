import 'dart:async';
import 'package:ecommerce/core/store.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:ecommerce/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Theme.of(context).buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Theme.of(context).indicatorColor,
          ),
        ).badge(color: Colors.red, size: 22, count: _cart.items.length),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items!.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items![index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
