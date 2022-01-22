import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controllers/counter_controller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CounterWidget(),
              Gap(16),
              CounterListWidget(),
              Gap(16),
              AverageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends HookConsumerWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countState);

    return Column(children: [
      Text(count.toString(), style: const TextStyle(fontSize: 48)),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            ref.read(counterController).countUp();
          },
          child: const Text('CountUp'))
    ]);
  }
}

class CounterListWidget extends HookConsumerWidget {
  const CounterListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countList = ref.watch(countListState);

    return Column(children: [
      Text(countList.toString()),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            ref.read(counterController).addToCountList();
          },
          child: const Text('Append'))
    ]);
  }
}

class AverageWidget extends HookConsumerWidget {
  const AverageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final average = ref.watch(averageProvider);

    return Text('avg: $average');
  }
}
