import 'package:basic_store/model/models.dart';
import 'package:basic_store/screens/detail/DetailBottomButton.dart';
import 'package:basic_store/screens/shared/CustomEndDrawer.dart';
import 'package:basic_store/screens/shared/CustomReadMore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text('Details'),
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        centerTitle: true,
        actions: <Widget>[
          CustomEndDrawer.actionBuilder(),
        ],
      ),
      endDrawer: CustomEndDrawer(),
      body: Stack(
        children: <Widget>[
          _buildBg(),
          Container(
            padding: EdgeInsets.only(bottom: 70.0),
            child: SingleChildScrollView(
              child: _buildContent(itemArgs),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DetailBottomButton(
        item: itemArgs,
      ),
    );
  }

  Widget _buildBg() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
            topRight: Radius.circular(75.0),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      );

  Widget _buildContent(Item item) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 40.0),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: ExactAssetImage(item.image),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: _buildNamePrice(item),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomReadMore(
              text: item.description,
              initialLines: 5,
              expendedLines: 60,
            ),
          ),
        ],
      );

  Widget _buildNamePrice(Item item) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Text(
            '\$${item.price.toString()}',
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ],
      );
}
