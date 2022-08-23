import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({Key? key}) : super(key: key);
  static const screenRouds = '/filters';
  final Function savefilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.savefilter, this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _Winter = false;
  var _Summer = false;
  var _Family = false;
  @override
  initState() {
    _Summer = widget.currentFilters['summer'] as bool;
    _Winter = widget.currentFilters['winter'] as bool;
    _Family = widget.currentFilters['family'] as bool;
    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    var currentValue,
    Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'cairo'),
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' الفلترة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'summer': _Summer,
                'winter': _Winter,
                'family': _Family,
              };
              widget.savefilter(selectedFilter);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'الرحلات الصيفية ',
                "اظهار الرحلات في الصيف فقط",
                _Summer,
                (bool newValue) {
                  setState(() {
                    _Summer = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'الرحلات الشتوية ',
                "اظهار الرحلات في الشتاء فقط",
                _Winter,
                (bool newValue) {
                  setState(() {
                    _Winter = newValue;
                  });
                },
              ),
              buildSwitchListTile('الرحلات العائلية ',
                  "اظهار الرحلات التي للعائلات فقط", _Family, (bool newValue) {
                setState(() {
                  _Family = newValue;
                });
              })
            ],
          )),
        ],
      ),
    );
  }
}
