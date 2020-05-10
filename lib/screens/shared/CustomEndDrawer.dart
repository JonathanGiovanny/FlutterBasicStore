import 'package:basic_store/model/models.dart';
import 'package:basic_store/screens/shared/CartIconSection.dart';
import 'package:basic_store/screens/shared/CustomAddRemove.dart';
import 'package:basic_store/screens/shared/CustomFinishBuyButton.dart';
import 'package:basic_store/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomEndDrawer extends StatefulWidget {
  static Widget actionBuilder() => Builder(
        builder: (context) => IconButton(
          icon: CartIconSection(),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      );

  @override
  _CustomEndDrawerState createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  @override
  Widget build(BuildContext context) {
    Map<Item, int> items = Provider.of<CartBloc>(context).items;

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(),
          items.isEmpty
              ? Center(child: Text('No elements in the cart.'))
              : _buildItemsList(items),
          _buildFinishButton(items.isNotEmpty),
        ],
      ),
    );
  }

  Widget _buildHeader() => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
        ),
        padding: const EdgeInsets.only(
          top: 70,
          bottom: 30,
          right: 40,
          left: 40,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Shopping Cart',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      );

  Widget _buildItemsList(Map<Item, int> items) => Flexible(
        child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildTiles(index, items),
        ),
      );

  Widget _buildTiles(int index, Map<Item, int> items) {
    Item item = items.keys.toList()[index];
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${item.price.toString()}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          CustomAddRemove(item),
        ],
      ),
    );
  }

  Widget _buildFinishButton(bool hasItems) => hasItems
      ? CustomFinishBuyButton()
      : SizedBox(
          height: 1,
        );
}
