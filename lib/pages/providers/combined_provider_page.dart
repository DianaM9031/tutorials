import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorials/widgets/text_widget.dart';


final cityProvider = Provider<String>((ref) => 'Munich2');

final futureProvider = FutureProvider<int>((ref) async {
  final city = ref.watch(cityProvider);

  return fetchWeather(city);
});

Future<int> fetchWeather(String city) async {
  await Future.delayed(Duration(seconds: 2));

  return city == 'Munich' ? 20 : 15;
}

class CombinedProvidersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final future = watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Combining Providers'),
      ),
      body: Center(
        child: future.when(
          data: (value) => TextWidget(value.toString()),
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => TextWidget('Error: $e'),
        ),
      ),
    );
  }
}