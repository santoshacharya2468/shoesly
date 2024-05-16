import 'package:flutter/cupertino.dart';

class LoadingPlaceHolder extends StatelessWidget {
  const LoadingPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator());
  }
}

Widget loadingView() {
  return const LoadingPlaceHolder();
}
