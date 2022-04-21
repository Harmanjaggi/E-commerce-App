import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/pages/home_detail_page.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : //assert(item != 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Theme.of(context).cardColor,
        child: ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: item,
              ),
            ),
          ),
          leading: Hero(
            tag: Key(
              item.id.toString(),
            ),
            child: Image.network(
              item.image,
              height: 50,
            ),
          ),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
