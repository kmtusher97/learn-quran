import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:learnquran/screens/word/word_details.dart';
import 'package:learnquran/widgets/text/arabic_text.dart';
import 'package:learnquran/widgets/word/word_icon.dart';
import 'package:learnquran/dto/word.dart';
import 'package:learnquran/theme/theme_helper.dart';

class WordFlipCard extends StatelessWidget {
  final Word word;

  const WordFlipCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      front: FlipCardWord(text: word.arabic),
      back: FlipCardMeaning(word: word),
    ));
  }
}

class FlipCardWord extends StatelessWidget {
  const FlipCardWord({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
          child: SizedBox(
        height: 250,
        width: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: ArabicText(text, textAlign: TextAlign.center, fontSize: 48),
        ),
      )),
    );
  }
}

class FlipCardMeaning extends StatelessWidget {
  const FlipCardMeaning({
    super.key,
    required this.word,
  });

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
          color: getWordBackgroundColor(context, word),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      word.meaning,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 48),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text("Examples"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WordDetails(word: word)),
                          );
                        },
                      ),
                      WordIcon(word: word),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
