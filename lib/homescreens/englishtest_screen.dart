import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/testresult_screen.dart';
import '../data/questions.dart';

class EnglishTestScreen extends StatefulWidget {
  @override
  _EnglishTestScreenState createState() => _EnglishTestScreenState();
}

class _EnglishTestScreenState extends State<EnglishTestScreen> {
  List<Question> _selectedQuestions = [];
  Map<int, int> _answers = {};
  Timer? _timer;
  int _remainingTime = 1200; 

  @override
  void initState() {
    super.initState();
    _selectedQuestions = getRandomQuestions(30);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  List<Question> getRandomQuestions(int count) {
    var random = Random();
    var questions = List<Question>.from(allQuestions);
    questions.shuffle(random);
    return questions.take(count).toList();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _submitAnswers(); // Auto-submit when the timer reaches zero
      }
    });
  }

  void _submitAnswers() {
    _timer?.cancel();
    int score = _calculateScore();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TestResultScreen(score: score),
      ),
    );
  }

  int _calculateScore() {
    int correctAnswers = 0;
    _answers.forEach((index, choice) {
      if (_selectedQuestions[index].correctAnswerIndex == choice) {
        correctAnswers++;
      }
    });
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: _selectedQuestions.length,
                itemBuilder: (context, index) {
                  var question = _selectedQuestions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.question,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          ...List.generate(question.choices.length,
                              (choiceIndex) {
                            return RadioListTile<int>(
                              title: Text(question.choices[choiceIndex]),
                              value: choiceIndex,
                              groupValue: _answers[index],
                              onChanged: (value) {
                                setState(() {
                                  _answers[index] = value!;
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitAnswers,
                    child: Text('Submit Answers'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Time Remaining: ${_formatTime(_remainingTime)}',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsLeft = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secondsLeft';
  }
}
