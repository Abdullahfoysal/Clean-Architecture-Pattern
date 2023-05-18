

import 'package:flutter/widgets.dart';

typedef OnData<T> = Widget Function(T data);
typedef OnError = Widget Function(dynamic e);
typedef OnLoading = Widget Function();

class CustomStreamBuilder<T> extends StatelessWidget {
  const CustomStreamBuilder({super.key,
    required this.stream,
    required this.onData,
    required this.onErrorRefresh,
    required this.onError,
    required this.onLoading,
  });

  final Stream<T> stream;
  final VoidCallback onErrorRefresh;
  final OnData<T> onData;
  final OnError onError;
  final OnLoading onLoading;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onData(snapshot.data!);
        } else if (snapshot.hasError) {
          return onError(snapshot.error);
        } else {
          return onLoading();
        }
      },

    );
  }
}