import 'package:flutter/material.dart';

enum Sort {
  stars('Stars', 'stars', Icons.star),
  forks('Forks', 'forks', Icons.call_split),
  updated('Updated', 'updated', Icons.update);

  const Sort(this.title, this.value, this.icon);

  final String title;
  final String value;
  final IconData icon;
}

enum Order {
  asc('Ascending', 'asc'),
  desc('Descending', 'desc');

  const Order(this.title, this.value);
  final String title;
  final String value;
}
