import 'package:basic_store/screens/discovery/LandingItemsSection.dart';
import 'package:basic_store/screens/discovery/LandingSearchSection.dart';
import 'package:basic_store/screens/shared/CustomEndDrawer.dart';
import 'package:basic_store/screens/shared/CustomDrawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/landing';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      drawer: CustomDrawer(),
      endDrawer: CustomEndDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            _buildSliverAppBar(context, innerBoxIsScrolled),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                child: LandingItemsSection(),
              ),
            ),
            Row()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSliverAppBar(
    BuildContext context,
    bool innerBoxIsScrolled,
  ) =>
      [
        SliverAppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Buy us some stuff',
            style: Theme.of(context).textTheme.headline6,
          ),
          pinned: true, // Keep pinned the appbar
          floating: true, // Disappear the top part
          snap: true,
          forceElevated: innerBoxIsScrolled, // Show Shandow when is scrolled
          bottom: LandingSearchSection(
            searchFunction: _searchFunction,
          ),
          actions: <Widget>[
            CustomEndDrawer.actionBuilder(),
          ],
        )
      ];

  void _searchFunction(String searchTerms) {
    print("Searching: " + searchTerms);
  }
}
