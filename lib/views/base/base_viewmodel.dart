import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext _context;
  setContext(BuildContext value) {
    _context = value;
  }

  BuildContext get context => _context;

  // Future<T?> showBTS<T>({required Widget child, bool isDismissible = false}) {
  //   return showModalBottomSheet<T>(
  //     isDismissible: isDismissible,
  //     isScrollControlled: true,
  //     enableDrag: isDismissible,
  //     context: context,
  //     builder: (context) {
  //       return KeyboardDismisser(child: child);
  //     },
  //   );
  // }

  Future<T?> showDialogCustom<T>({required Widget child}) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  void showDialogLoading() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );
  }

  _isThereCurrentDialogShowing() => ModalRoute.of(context)?.isCurrent != true;

  void showOffDialogLoading() {
    if (!_isThereCurrentDialogShowing()) return;
    Navigator.pop(context);
  }


  @override
  void dispose() {
    super.dispose();
  }
}

