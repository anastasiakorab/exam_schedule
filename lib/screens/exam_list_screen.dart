import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  static const String indexNumber = '221096';

  static final List<Exam> _exams = [
    
    Exam(
      subject: 'Алгоритми и податочни структури',
      dateTime: DateTime(2025, 8, 22, 12, 0),
      rooms: ['Лаб 1'],
    ),
    Exam(
      subject: 'Објектно - ориентирано програмирање',
      dateTime: DateTime(2025, 9, 24, 10, 0),
      rooms: ['Лаб 215'],
    ),
    Exam(
      subject: 'Вештачка интелигенција',
      dateTime: DateTime(2025, 9, 28, 9, 0),
      rooms: ['Лаб 12', 'Лаб 13'],
    ),
   Exam(
      subject: 'Мобилни информациски системи',
      dateTime: DateTime(2025, 8, 20, 9, 0),
      rooms: ['Лаб 215'],
    ),
    Exam(
      subject: 'Дискретна математика',
      dateTime: DateTime(2025, 10, 3, 8, 0),
      rooms: ['Лаб 2'],
    ),
    Exam(
      subject: 'Интегрирани системи',
      dateTime: DateTime(2025, 11, 19, 10, 0),
      rooms: ['Лаб 3'],
    ),
    Exam(
      subject: 'Архитектура на компјутери',
      dateTime: DateTime(2025, 10, 5, 13, 0),
      rooms: ['117'],
    ),
    Exam(
      subject: 'Софтверско инженерство',
      dateTime: DateTime(2025, 11, 14, 9, 0),
      rooms: ['138'],
    ),
    Exam(
      subject: 'Мрежи и комуникации',
      dateTime: DateTime(2025, 11, 18, 14, 0),
      rooms: ['Лаб АБ'],
    ),
    
      Exam(
      subject: 'Интернет технологии',
      dateTime: DateTime(2025, 11, 20, 9, 0),
      rooms: ['Лаб 4'],
    ),
     Exam(
      subject: 'Бази на податоци',
      dateTime: DateTime(2025, 9, 1, 11, 0),
      rooms: ['Лаб 2'],
    ),
    Exam(
      subject: 'Информациски системи',
      dateTime: DateTime(2025, 11, 23, 11, 0),
      rooms: ['Амфитеатар 2'],
    ),
  ];

  List<Exam> get _sortedExams {
    final List<Exam> copy = List.of(_exams);
    copy.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return copy;
  }

  @override
  Widget build(BuildContext context) {
    final sortedExams = _sortedExams;

    return Scaffold(
     appBar: AppBar(
  backgroundColor: Colors.blue.shade50,
  elevation: 1,
  centerTitle: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.schedule, color: Colors.blueAccent),
      const SizedBox(width: 8),
      Text(
        'Распоред за испити',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      const SizedBox(width: 6),
      Text(
        '- $indexNumber',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.blueGrey,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),


      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sortedExams.length,
              itemBuilder: (context, index) {
                final exam = sortedExams[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ExamDetailScreen(exam: exam),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.blue.shade50,
    border: const Border(
      top: BorderSide(color: Colors.grey, width: 0.5),
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.school,
        color: Colors.blueAccent,
        size: 24,
      ),
      const SizedBox(width: 8),
      const Text(
        'Вкупно испити:',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      const SizedBox(width: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          sortedExams.length.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
),

        ],
      ),
    );
  }
}
