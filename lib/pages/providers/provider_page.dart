import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorials/widgets/text_widget.dart';

// You cannot change and only provide an initial value
// only the provider definition is global, the state is locally storage
// with ref you can access to another provider
final numberProvider = Provider<int>((ref) => 42);

class ProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final number = watch(numberProvider).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(child: TextWidget(number)),
    );
  }
}

// class ProviderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, watch, child) {
//             final number = watch(numberProvider).toString();

//             return TextWidget(number);
//           },
//         ),
//       ),
//     );
//   }
// }