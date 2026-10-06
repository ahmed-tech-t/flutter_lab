
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/common/CElevatedButton.dart';
import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/screens/counter/widgets/counter_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 1, 1, 28),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25),
              ),
    
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      CElevatedButton(icon: Icons.add, onPressed: () {
                        context.read<CounterBloc>().add(CounterIncremented());
                      }),
                      BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          return CounterText(counter: state.counter);
                        },
                      ),
                      CElevatedButton(icon: Icons.remove, onPressed: () {
                        context.read<CounterBloc>().add(CounterDecremented());
                      }),
                    ],
                  ),
                ],
              ),
            ),
            // ElevatedButton(onPressed: () {}, child: Text("Reset")),
          ],
        ),
      ),
    );
  }
}

