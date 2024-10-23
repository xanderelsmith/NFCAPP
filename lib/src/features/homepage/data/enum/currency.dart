import 'package:flutter/material.dart';

enum Currency {
  naira('Naira', Icon(Icons.abc)),
  dollar('Dollar', Icon(Icons.abc)),
  euro('Euro', Icon(Icons.abc)),
  pounds('Pounds', Icon(Icons.abc));

  const Currency(this.name, this.symbol);
  final String name;
  final Widget symbol;
}
