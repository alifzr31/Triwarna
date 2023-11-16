import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    required this.noUndian,
  }) : super(key: key);

  final String noUndian;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFF493169),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(
              Icons.airplane_ticket,
              size: 30,
              color: Colors.amber,
            ),
            Expanded(
              child: Center(
                child: Text(
                  noUndian,
                  style: const TextStyle(
                    color: Color(0xFF493169),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.airplane_ticket,
              size: 30,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
