import 'package:cross_word_games/core/helpers/router_transition_builder.dart';
import 'package:cross_word_games/core/static_data/static_data.dart';
import 'package:cross_word_games/core/themes/custom_textstyle.dart';
import 'package:cross_word_games/core/ui_components/custom_scaffold.dart';
import 'package:cross_word_games/features/puzzle/presentation/puzzle_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author: Sagar KC
/// @email: sagar.kc@fonepay.com
/// @created_at:  12/6/2022, Tuesday

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/images/background1.jpg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'),
                fit: BoxFit.fill)),
        child: Center(
          child: ElevatedButton(
            child: const Text(
              'Play',
              style: CustomTextStyle.containerTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).push(createRoute(PuzzleScreen(
                  puzzleScreenModel: StaticData.puzzleScreenData1)));
            },
          ),
        ),
      ),
    );
  }
}
