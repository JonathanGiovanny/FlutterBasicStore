import 'package:basic_store/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIconSection extends StatefulWidget {
  @override
  _CartIconSectionState createState() => _CartIconSectionState();
}

class _CartIconSectionState extends State<CartIconSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(Icons.shopping_cart),
        ),
        _countBadge(),
      ],
    );
  }

  Widget _countBadge() => Consumer<CartBloc>(
      builder: (context, cart, child) =>
          cart.items.isEmpty ? _badgeHasNoValues() : _badgeHasValues(cart));

  Widget _badgeHasNoValues() => SizedBox(
        height: 1,
      );

  Widget _badgeHasValues(CartBloc cart) => Positioned(
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
            minWidth: 12,
            minHeight: 12,
          ),
          child: Text(
            cart.countElementsInCart().toString(),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
