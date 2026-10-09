
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/common/CElevatedButton.dart';
import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/screens/counter/widgets/counter_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ 
                   CElevatedButton(icon: Icons.lock_reset_outlined,size: Size(10, 10), onPressed: () {
                      context.read<CounterBloc>().add(CounterReset());
                    }) ,]),
                    BlocListener<CounterBloc, CounterState>(
                      listener: (context, state) {
                        // Handle state changes if needed
                      },
                    ),
                    CElevatedButton(icon: Icons.add,size: Size(200, 200), onPressed: () {
                      context.read<CounterBloc>().add(CounterIncremented());
                    }),
                  ],
                ),
                            // ElevatedButton(onPressed: () {}, child: Text("Reset")),
            ],
          ),
        ),
      ),
    );
  }
}

