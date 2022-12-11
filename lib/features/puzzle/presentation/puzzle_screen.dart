import 'package:cross_word_games/core/themes/custom_colors.dart';
import 'package:cross_word_games/core/ui_components/custom_scaffold.dart';
import 'package:cross_word_games/features/puzzle/enitities/puzzle_model.dart';
import 'package:cross_word_games/features/puzzle/presentation/widgets/puzzle_container.dart';
import 'package:flutter/material.dart';

/// @author: Sagar KC
/// @email: sagar.kc@fonepay.com
/// @created_at:  12/6/2022, Tuesday

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({Key? key, required this.puzzleScreenModel})
      : super(key: key);
  final PuzzleScreenModel puzzleScreenModel;

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  final List<int> _filledList = [];
  final List<LetterPosition> _letterPositionList = [];
  bool _visible = false;
  final TextEditingController _textEditingController = TextEditingController();

  triggerAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _visible = true;
    });
  }

  initialiseLettersPosition() {
    for (var element in widget.puzzleScreenModel.puzzleModel) {
      //With the assumption that number of letters in the word and the array's length are always same..
      for (int i = 0; i < element.wordsLocationList.length; i++) {
        _letterPositionList.add(LetterPosition(
            letter: element.word[i], position: element.wordsLocationList[i]));
      }
    }
    setState(() {});
  }

  void checkIfMatched(String word) {
    for (var element in widget.puzzleScreenModel.puzzleModel) {
      if (element.word == word) {
        _filledList.addAll(element.wordsLocationList);
        _textEditingController.clear();
        setState(() {});
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    triggerAnimation();
    initialiseLettersPosition();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: widget.puzzleScreenModel.levelName,
      body: Stack(
        children: [
          _backgroundImageWidget(context),
          _puzzleSection(context),
          const SizedBox(height: 20),
          _textFieldSection(),
          /*Positioned(
              bottom: 20,
              child: _getDraggableSection())*/
        ],
      ),
    );
  }

  Container _backgroundImageWidget(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.puzzleScreenModel.backgroundImage),
                fit: BoxFit.fill)));
  }

  AnimatedPositioned _puzzleSection(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      top: _visible ? 50 : 20,
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1200),
        opacity: _visible ? 1 : 0,
        curve: Curves.easeOut,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              shrinkWrap: true,
              primary: true,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
              itemCount: 25,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6),
              itemBuilder: (context, index) {
                late int letterPositionInCustomList = 1000;
                final List<bool> isLetterPresent = _letterPositionList.map((e) {
                  if (e.position == index) {
                    letterPositionInCustomList = _letterPositionList.indexOf(e);
                    return true;
                  } else {
                    return false;
                  }
                }).toList();
                return isLetterPresent.contains(true)
                    ? PuzzleContainer(
                        value: letterPositionInCustomList == 1000
                            ? ''
                            : _letterPositionList[letterPositionInCustomList]
                                .letter,
                        isFilled: _filledList.contains(index))
                    : const SizedBox();
              }),
        ),
      ),
    );
  }

  AnimatedPositioned _textFieldSection() => AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      bottom: _visible ? 50 : 20,
      left: 24,
      right: 24,
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1200),
        opacity: _visible ? 1 : 0,
        curve: Curves.easeOut,
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: _textEditingController,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColors.containerColorOrange)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColors.containerColorOrange)),
            ),
            onSubmitted: checkIfMatched,
          ),
        ),
      ));

  Container _getDraggableSection() {
    return Container(
      height: 200,
      width: 300,
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Listener(
                  onPointerMove: (opm){
                    print('${opm.localPosition} ada ${opm.position}');
                  },
                  child: Container(
                height: 50,
                width: 50,
                color: Colors.orangeAccent,
              ),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.orangeAccent,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.orangeAccent,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LetterPosition {
  final String letter;
  final int position;

  LetterPosition({required this.letter, required this.position});
}
