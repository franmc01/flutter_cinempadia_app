import 'package:flutter/material.dart';

class ScreeLoader extends StatelessWidget {
  const ScreeLoader({super.key});



  Stream<String> getLoadingMessages(){
  final messages = <String>[
    'Loading movies',
    'Calling my girlfriend',
  ];

    return Stream.periodic(const Duration(microseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          CircularProgressIndicator(strokeWidth: 2),
          StreamBuilder(stream: getLoadingMessages(), builder: (context, snapshot) {
            if(!snapshot.hasData) return Text('Loading...');

             return Text(snapshot.data ?? '');
          })
        ],
      ),
    );
  }
}