import 'package:flutter/material.dart';
import 'package:flutter_exam/data/question_data.dart';
import 'package:flutter_exam/model/option.dart';
import 'package:flutter_exam/model/quesiton.dart';
import 'package:flutter_exam/views/result/result_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;
  late PageController _controller;

  @override
  void initState() {
    questionData.shuffle();
    super.initState();
    _isLocked = false;
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 32,
            ),
            Text('Question $_questionNumber / ${questionData.length}'),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                itemCount: questionData.length,
                itemBuilder: ((context, index) {
                  var _question = questionData[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      Text(
                        _question.text,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Expanded(
                          child: Column(
                        children: _question.options
                            .map((option) => buildOption(_question, option))
                            .toList(),
                      ))
                    ],
                  );
                }),
              ),
            ),
            _isLocked ? buildElevatedButton(questionData) : SizedBox.shrink(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget buildOption(Question _question, Option option) {
    final color = getColorForOption(option, _question);
    return GestureDetector(
      onTap: () {
        if (_question.isLocked) {
          return;
        } else {
          setState(() {
            _question.isLocked = true;
            _question.selectedOption = option;
          });
          _isLocked = _question.isLocked;
          if (_question.selectedOption!.isCorrect) {
            _score++;
          }
        }
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: TextStyle(fontSize: 20),
            ),
            getIconForOption(option, _question),
          ],
        ),
      ),
    );
  }

  getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return SizedBox.shrink();
  }

  Widget buildElevatedButton(List<Question> questions) {
    return ElevatedButton(
      onPressed: () {
        if (_questionNumber < questions.length) {
          _controller.nextPage(
              duration: Duration(
                milliseconds: 250,
              ),
              curve: Curves.easeInExpo);
          setState(() {
            _questionNumber++;
            _isLocked = false;
          });
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(score: _score)));
        }
      },
      child:
          Text(_questionNumber < questions.length ? 'Next Page' : 'See Result'),
    );
  }
}
