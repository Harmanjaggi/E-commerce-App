import 'package:ecommerce/models/catalog.dart';
import 'package:ecommerce/widgets/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : // assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: Key(
                  catalog.id.toString(),
                ),
                child: Image.network(
                  catalog.image,
                ),
              ),
            ),
            Expanded(
              child: ClipPath(
                // clipper: ArcClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).cardColor,
                  child: Column(
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        catalog.desc,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text('Some early treatises—such as those of '
                            'Cicero on the pleasantness of old age or '
                            'on the art of “divination,” Seneca on anger '
                            'or clemency, and Plutarch on the passing of '
                            'oracles—presage to a certain degree the form '
                            'and tone of the essay, but not until the late '
                            '16th century was the flexible and deliberately '
                            'nonchalant and versatile form of the essay '
                            'perfected by the French writer Michel de Montaigne.'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Text(
              '\$${catalog.price.toString()}',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 32.0),
            ),
            AddToCart(
              catalog: catalog,
            ),
          ],
        ),
      ),
    );
  }
}

// class ArcClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width * .03, size.height);
//     path.quadraticBezierTo(
//         size.height * .2, size.width * .5, size.height * .03, 0);
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper old) => false;
// }
