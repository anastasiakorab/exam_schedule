import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _formatDateTime(DateTime dt) {
    final day = dt.day.toString().padLeft(2, '0');
    final month = dt.month.toString().padLeft(2, '0');
    final year = dt.year;
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$day.$month.$year - $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    
    final difference = now.difference(exam.dateTime);
    final days = difference.inDays.abs();
    final hours = difference.inHours.remainder(24).abs();

   
    final color = isPast ? Colors.purple : Colors.green;
    final bgColor = isPast ? Colors.purple.shade50 : Colors.green.shade50;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: color,
        elevation: 2,
        title: const Text(
          'Детали за испит',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              exam.subject,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

           
            Row(
              children: [
                Icon(Icons.calendar_today, color: color),
                const SizedBox(width: 10),
                Text(
                  _formatDateTime(exam.dateTime),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),

        
            Row(
              children: [
                Icon(Icons.meeting_room, color: color),
                const SizedBox(width: 10),
                Text(
                  exam.rooms.join(', '),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 1.2),

            
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.access_time_filled, color: color),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    isPast
                        ? 'Испитот беше пред:  $days дена, $hours часа.'
                        : 'Испитот ќе биде за:  $days дена, $hours часа.',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

           
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  isPast ? '✅ Поминат испит' : '📅 Претстоен испит',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
