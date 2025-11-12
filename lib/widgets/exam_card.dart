import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  bool get isPast => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: isPast ? Colors.purple.shade50 : Colors.green.shade50,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.calendar_today,
                      color: isPast ? Colors.purple : Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    '${exam.dateTime.day.toString().padLeft(2, '0')}.${exam.dateTime.month.toString().padLeft(2, '0')}.${exam.dateTime.year} - '
                    '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              Row(
                children: [
                  Icon(Icons.meeting_room,
                      color: isPast ? Colors.purple : Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    exam.rooms.join(', '),
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isPast ? Colors.purple : Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isPast ? 'Поминат испит' : 'Претстоен испит',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
