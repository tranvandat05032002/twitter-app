import 'package:flutter/material.dart';
import 'package:meteor_app/views/base/base_viewmodel.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatelessWidget {
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final ValueChanged<T>? onViewModelReady;
  const BaseWidget({
    super.key,
    required this.viewModel,
    required this.builder,
    this.onViewModelReady,
  });

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return ChangeNotifierProvider<T>(
      create: (context) {
        onViewModelReady?.call(viewModel);
        return viewModel;
      },
      child: Consumer<T>(
          builder: builder,
        ),
    );
  }
}
