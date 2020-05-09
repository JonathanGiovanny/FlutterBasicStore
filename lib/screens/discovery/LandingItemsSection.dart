import 'package:basic_store/model/models.dart';
import 'package:basic_store/screens/detail/DetailPage.dart';
import 'package:basic_store/services/cart/CartBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingItemsSection extends StatefulWidget {
  @override
  _LandingItemsSectionState createState() => _LandingItemsSectionState();
}

class _LandingItemsSectionState extends State<LandingItemsSection> {
  /*List<Item> items = [
    Item(
        id: 'A111',
        name: 'Item 1',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In lorem magna, euismod eu lacus a, posuere bibendum neque. Maecenas in lorem vel odio sollicitudin convallis eu at nisi. Donec urna urna, pharetra eu libero vel, consequat ultricies nisi. Aenean vel facilisis leo, et pulvinar odio. Quisque in mi ligula. Nam tristique, ex ultricies sodales vehicula, ante mi lobortis lectus, sed convallis ipsum quam vitae justo. Nam volutpat nisl et neque porta viverra.\n\n' +
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque euismod volutpat ipsum, quis bibendum mi molestie et. Sed id aliquet nibh. Mauris consectetur ullamcorper diam et accumsan. Nam posuere sapien vel semper facilisis. Curabitur pulvinar at nunc quis mattis. Sed egestas diam sollicitudin tempus dictum. Vestibulum gravida mauris quis ligula sagittis accumsan. Donec felis velit, bibendum at pharetra at, vulputate dignissim massa. Vestibulum iaculis quis nisi et volutpat. Fusce sollicitudin eros nec bibendum convallis. Aenean imperdiet aliquet lorem vitae eleifend. Nam eu dictum arcu, eget tempor felis.\n\n' +
                'Donec nec eros sagittis felis maximus ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sit amet laoreet tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vitae auctor diam. Vestibulum tempus nunc eu sem iaculis lobortis. Donec nec feugiat enim. Quisque vitae neque sem. Vivamus magna ante, venenatis in erat posuere, molestie varius metus. Etiam non justo egestas, tempus ipsum et, iaculis libero. Quisque efficitur ante fringilla urna auctor lobortis. Nam tristique porttitor diam eu ultricies. Nullam ut quam eu augue ultricies congue.',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A222',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
    Item(
        id: 'A333',
        name: 'Item 1',
        description: 'Lorem Ipsum dolor et something',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A444',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
    Item(
        id: 'A555',
        name: 'Item 1',
        description: 'Lorem Ipsum dolor et something',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A666',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
    Item(
        id: 'A777',
        name: 'Item 1',
        description: 'Lorem Ipsum dolor et something',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A888',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
    Item(
        id: 'A000',
        name: 'Item 1',
        description: 'Lorem Ipsum dolor et something',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A900',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
    Item(
        id: 'A701',
        name: 'Item 1',
        description: 'Lorem Ipsum dolor et something',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A802',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
    Item(
        id: 'A003',
        name: 'Item 1',
        description: 'Lorem Ipsum dolor et something',
        image: 'assets/images/item1.jpg',
        price: 10.2),
    Item(
        id: 'A904',
        name: 'Long name for an item that you wouldn\'t expect to happen',
        description: 'Lorem Ipsum dolor et something x2',
        image: 'assets/images/item2.jpg',
        price: 7.2),
  ];*/

  @override
  Widget build(BuildContext context) {
    final List<Item> items = Provider.of<List<Item>>(context);
    if (items.isEmpty) {
      return Center(child: Text('There are not available items.'));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildListRow(items[index]),
    );
  }

  /// Build the list row decoration (padding + inkwell + padding [yes, again])
  Widget _buildListRow(Item item) => Padding(
        key: Key(item.id),
        padding: const EdgeInsets.only(
          top: 7.5,
          right: 10.0,
          bottom: 7.5,
          left: 20.0,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailPage.routeName,
              arguments: item,
            );
          },
          child: Container(
            padding: const EdgeInsets.only(
              top: 7.5,
              right: 10.0,
              bottom: 7.5,
              left: 20.0,
            ),
            child: _buildListRowContent(item),
          ),
        ),
      );

  /// This is trully the real row content
  Widget _buildListRowContent(Item item) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(item.image),
            radius: 30,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$ ${item.price.toString()}',
                  style: TextStyle(color: Theme.of(context).disabledColor),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              CartBloc cart = Provider.of<CartBloc>(context, listen: false);
              cart.addItemToCart(item);
              print('Add to cart ${item.id} - ${item.name}');
            },
          )
        ],
      );
}
