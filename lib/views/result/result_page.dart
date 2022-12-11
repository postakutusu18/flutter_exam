import 'package:flutter/material.dart';
import 'package:flutter_exam/data/question_data.dart';
import 'package:flutter_exam/views/detail/detail_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.score});
  final int score;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset('images/result.png'),
            ),
          ),
          Center(
              child: Text('Skore : ${widget.score} / ${questionData.length}')),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: Colors.purple,
              minimumSize: Size(200, 32),
            ),
            onPressed: () {
              setState(() {
                for (var item in questionData) {
                  item.selectedOption = null;
                  item.isLocked = false;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              });
            },
            child: const Text('Tekrar Deneyiniz'),
          ),
        ],
      ),
    );
  }
}
