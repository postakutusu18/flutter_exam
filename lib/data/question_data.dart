import 'package:flutter_exam/model/option.dart';
import 'package:flutter_exam/model/quesiton.dart';

final questionData = [
  Question(
    text: 'Pazartesi günün ingilizcesi nedir?',
    options: [
      Option(text: 'Monday', isCorrect: true),
      Option(text: 'Saturday', isCorrect: false),
      Option(text: 'Friday', isCorrect: false),
      Option(text: 'Tuesday', isCorrect: false),
    ],
  ),
  Question(
    text: 'Pazar günün ingilizcesi nedir?',
    options: [
      Option(text: 'Monday', isCorrect: false),
      Option(text: 'Sunday', isCorrect: true),
      Option(text: 'Wednesday', isCorrect: false),
      Option(text: 'Tuesday', isCorrect: false),
    ],
  ),
  Question(
    text: 'Cuma günün ingilizcesi nedir?',
    options: [
      Option(text: 'Wednesday ', isCorrect: false),
      Option(text: 'Sunday', isCorrect: false),
      Option(text: 'Friday', isCorrect: true),
      Option(text: 'Thursday ', isCorrect: false),
    ],
  ),
  Question(
    text: 'Perşembe günün ingilizcesi nedir?',
    options: [
      Option(text: 'Monday ', isCorrect: false),
      Option(text: 'Sunday', isCorrect: false),
      Option(text: 'Friday', isCorrect: false),
      Option(text: 'Thursday ', isCorrect: true),
    ],
  ),
  Question(
    text: 'Çarşamba günün ingilizcesi nedir?',
    options: [
      Option(text: 'Monday ', isCorrect: false),
      Option(text: 'Sunday', isCorrect: false),
      Option(text: 'Wednesday', isCorrect: true),
      Option(text: 'Thursday ', isCorrect: false),
    ],
  ),
];
