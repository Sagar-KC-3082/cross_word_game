import 'dart:core';

/// @author: Sagar KC
/// @email: sagar.kc@fonepay.com
/// @created_at:  12/6/2022, Tuesday

class PuzzleScreenModel {
  final String backgroundImage;
  final int levelNumber;
  final String levelName;
  final List<PuzzleModel> puzzleModel;

  PuzzleScreenModel(
      {required this.backgroundImage,
      required this.levelNumber,
      required this.levelName,
      required this.puzzleModel});
}

class PuzzleModel {
  final String word;
  final List<int> wordsLocationList;

  PuzzleModel({required this.word, required this.wordsLocationList});
}
