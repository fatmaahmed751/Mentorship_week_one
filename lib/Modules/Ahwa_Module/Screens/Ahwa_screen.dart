import 'package:flutter/material.dart';
import '../Repository/order_manager.dart';

class AhwaDashboard extends StatelessWidget {
  final OrderManager manager;

  const AhwaDashboard({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final dailyTopDrinks = manager.getDailyTopSellingDrinks();
    final dailyOrdersCount = manager.dailyOrdersServed;

    return Scaffold(
      appBar: AppBar(title: const Text('Smart Ahwa Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily Report', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('Completed Daily Order: $dailyOrdersCount', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text('Top Selling Drinks:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            if (dailyTopDrinks.isEmpty)
              const Text('No Selling Drink Today')
            else
              ...dailyTopDrinks.entries.map((e) => ListTile(
                title: Text(e.key),
                trailing: Text('${e.value} Order', style: const TextStyle(fontWeight: FontWeight.bold)),
              )),
          ],
        ),
      ),
    );
  }
}