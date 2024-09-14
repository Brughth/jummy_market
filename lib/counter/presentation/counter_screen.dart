import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/counter/business_logic/bloc/counter_bloc.dart';
import 'package:marketplace/shared/extensions/context_extensions.dart';
import 'package:marketplace/shared/theme/app_colors.dart';
import 'package:marketplace/shared/widgets/app_button.dart';
import 'package:marketplace/shared/widgets/gap.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: CounterWidget(
              bloc: CounterBloc(),
              color: AppColors.secondary,
            ),
          ),
          Expanded(
            child: CounterWidget(
              bloc: CounterBloc(),
              color: Colors.primaries.first,
            ),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final CounterBloc bloc;
  final Color color;
  const CounterWidget({
    super.key,
    required this.bloc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        // emilys,  'emilyspass'
        children: [
          Spacer(),
          BlocBuilder<CounterBloc, CounterState>(
            bloc: bloc,
            builder: (context, state) {
              return Text(
                '${state.counter}',
                style: context.textTheme.displaySmall,
              );
            },
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  bgColor: AppColors.primary,
                  text: "Increment",
                  onPressed: () {
                    bloc.add(IncrementCounterEvent());
                  },
                ),
              ),
              GapW(20),
              Expanded(
                child: AppButton(
                  bgColor: AppColors.red400,
                  text: "Decrement",
                  onPressed: () {
                    bloc.add(DecrementCounterEvent());
                  },
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
