import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:km_test/models/user.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String _selectedUserName = 'Selected User Name';
  List<User> _users = [];
  bool _isLoading = false;
  int _page = 1;
  bool _hasMore = true;

  String get name => _name;
  String get selectedUserName => _selectedUserName;
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setSelectedUserName(String name) {
    _selectedUserName = name;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=$_page&per_page=10'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<User> fetchedUsers =
            (data['data'] as List)
                .map((userJson) => User.fromJson(userJson))
                .toList();

        if (fetchedUsers.isNotEmpty) {
          _users.addAll(fetchedUsers);
          _page++;
        } else {
          _hasMore = false;
        }
      } else {
        print('Failed to load users');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshUsers() async {
    _users = [];
    _page = 1;
    _hasMore = true;
    await fetchUsers();
  }
}
