import 'package:cross_word_games/features/puzzle/enitities/puzzle_model.dart';

/// @author: Sagar KC
/// @email: sagar.kc@fonepay.com
/// @created_at:  12/6/2022, Tuesday

class StaticData {
  static PuzzleScreenModel puzzleScreenData1 = PuzzleScreenModel(
      backgroundImage: 'assets/images/background1.jpg',
      levelNumber: 1,
      levelName: 'Level 1',
      puzzleModel: [
        PuzzleModel(word: 'BAT', wordsLocationList: [0,5,10]),
        PuzzleModel(word: 'AXE', wordsLocationList: [5,6,7]),
        PuzzleModel(word: 'EYE', wordsLocationList: [7,12,17]),
      ]);
}
