import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = 'filters';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({this.currentFilters, this.setFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitch({
    String title,
    String subtitle,
    bool value,
    Function changeValue,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: changeValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.setFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              }),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitch(
                      title: 'Gluten-free',
                      subtitle: 'Only meals that are gluten-free.',
                      value: _glutenFree,
                      changeValue: (value) {
                        setState(() {
                          _glutenFree = value;
                        });
                      }),
                  _buildSwitch(
                      title: 'Lactose-free',
                      subtitle: 'Only meals that are lactose-free.',
                      value: _lactoseFree,
                      changeValue: (value) {
                        setState(() {
                          _lactoseFree = value;
                        });
                      }),
                  _buildSwitch(
                      title: 'Vegetarian',
                      subtitle: 'Only vegetarian meals.',
                      value: _vegetarian,
                      changeValue: (value) {
                        setState(() {
                          _vegetarian = value;
                        });
                      }),
                  _buildSwitch(
                      title: 'Gluten-free',
                      subtitle: 'Only vegan meals.',
                      value: _vegan,
                      changeValue: (value) {
                        setState(() {
                          _vegan = value;
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
