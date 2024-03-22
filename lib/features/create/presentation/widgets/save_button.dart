import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/features/create/presentation/event_bloc/event_bloc.dart';
import '../../../../core/extensions/extensions.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<CreateEventBloc>().add(SaveButtonPressed());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.colors.skipButtonColor,
            ),
            height: 40,
            width: 380,
            child: Center(
              child: Text(
                context.localization.save,
                style: context.style.fontSize16Weight500,
              ),
            ),
          ),
        );
      },
    );
  }
}
