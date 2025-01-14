import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModel extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  DataModel() {
    _loadData();
  }

  void addItem(DateTime date, String data) {
    _items.add({
      'date': date.toIso8601String(),
      'data': data,
    });
    _saveData();
    _sortItems();
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    _saveData();
    _sortItems();
    notifyListeners();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('data_list');
    if (jsonString != null) {
      _items = List<Map<String, dynamic>>.from(json.decode(jsonString));
      _sortItems();
      notifyListeners();
    }
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(_items);
    prefs.setString('data_list', jsonString);
  }

  void _sortItems() {
    _items.sort((a, b) {
      DateTime dateA = DateTime.parse(a['date']!);
      DateTime dateB = DateTime.parse(b['date']!);
      return dateB.compareTo(dateA); // Sort in descending order
    });
  }
}
