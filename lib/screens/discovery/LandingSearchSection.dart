import 'dart:async';

import 'package:flutter/material.dart';

class LandingSearchSection extends StatefulWidget
    implements PreferredSizeWidget {
  final Function searchFunction;

  LandingSearchSection({@required this.searchFunction});

  @override
  _LandingSearchSectionState createState() => _LandingSearchSectionState();

  @override
  Size get preferredSize =>
      Size.fromHeight(78); // Should be the size of the component
}

class _LandingSearchSectionState extends State<LandingSearchSection> {
  final TextEditingController _searchController = TextEditingController();
  Timer _debounce;

  _onSearchChanged() {
    // ? continue if _debounce is not null / ?? if null validation
    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.searchFunction(_searchController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, top: 10.0, right: 20.0, bottom: 20.0),
      child: Form(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(20.0),
            ),
            color: Theme.of(context).backgroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
