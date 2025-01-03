import 'package:flutter/material.dart';
import 'package:meteor_app/views/base/base_widget.dart';
import 'package:meteor_app/views/edit_profile/edit_profile_viewmodel.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      viewModel: EditProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            children: [],
          ),
        );
      },
    );
  }
}
