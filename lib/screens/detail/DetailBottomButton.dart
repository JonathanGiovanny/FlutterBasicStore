import 'package:basic_store/model/models.dart';
import 'package:basic_store/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailBottomButton extends StatefulWidget {
  final Item item;

  DetailBottomButton({@required this.item});

  @override
  _DetailBottomButtonState createState() => _DetailBottomButtonState();
}

class _DetailBottomButtonState extends State<DetailBottomButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => _pressedAction(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75.0),
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  void _pressedAction() {
    CartBloc cart = Provider.of<CartBloc>(context, listen: false);
    cart.addItemToCart(widget.item);
  }

  Widget _buildButtonContent() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          Text(
            'Add to Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      );
}
