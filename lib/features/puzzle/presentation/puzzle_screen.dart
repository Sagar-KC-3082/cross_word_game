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
  final List<int> _filledList = [1, 2, 3, 6, 7, 11, 16, 21];
  bool _visible = false;

  triggerAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _visible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    triggerAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: widget.puzzleScreenModel.levelName,
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage(widget.puzzleScreenModel.backgroundImage),
                      fit: BoxFit.fill))),
          AnimatedPositioned(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                    itemCount: 25,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            childAspectRatio: 0.9,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6),
                    itemBuilder: (context, index) {
                      return PuzzleContainer(
                          value: 'A', isFilled: _filledList.contains(index));
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
