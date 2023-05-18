import 'package:flutter/cupertino.dart';
import 'package:result_monad/result_monad.dart';

import '../../error/error.dart';

extension StreamMapping<T> on Stream<Result<T, ErrorModel>> {
  Stream<S> mapSuccess<S>(S Function(T event) convert) {
    return skipWhile((element) => element.isFailure)
        .map((event) => convert(event.value));
  }
}

extension WidgetStream<T> on Stream<T> {
  StreamBuilder<T> toWidget(
      {required T initialData,
      required Widget Function(T event) widgetBuilder}) {
    return StreamBuilder(
        initialData: initialData,
        stream: this,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          return widgetBuilder(snapshot.data!);
        });
  }
}
