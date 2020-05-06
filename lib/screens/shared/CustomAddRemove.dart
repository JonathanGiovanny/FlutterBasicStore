import 'package:basic_store/model/models.dart';
import 'package:basic_store/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAddRemove extends StatelessWidget {
  final Item item;

  CustomAddRemove(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 55,
            child: FlatButton(
              onPressed: () => _removeItem(context),
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Consumer<CartBloc>(
              builder: (context, cart, child) =>
                  Text(cart.countElementInCart(item.id).toString())),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 55,
            child: FlatButton(
              onPressed: () => _addItem(context),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _addItem(BuildContext context) {
    CartBloc cart = Provider.of<CartBloc>(context, listen: false);
    cart.addItemToCart(item);
  }

  void _removeItem(BuildContext context) {
    CartBloc cart = Provider.of<CartBloc>(context, listen: false);
    cart.removeItemFromCart(item.id);
  }
}
