import 'package:cross_word_games/core/static_data/static_data.dart';
import 'package:cross_word_games/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'features/puzzle/presentation/puzzle_screen.dart';

void main() {
  runApp(const  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
