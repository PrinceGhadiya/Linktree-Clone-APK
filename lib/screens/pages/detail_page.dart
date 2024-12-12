import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const SizedBox(height: 14),
              Text(
                data['name'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(color: Colors.white),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      data['desc'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.white),
              const SizedBox(height: 8),
              Column(
                children: data['links'].entries.map<Widget>((entry) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text("${entry.key}"),
                      ),
                      Expanded(flex: 2, child: Text("${entry.value}")),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
