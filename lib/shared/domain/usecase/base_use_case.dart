import 'dart:async';

abstract class BaseUseCaseParam<P, R> {
  StreamController<R> resultController = StreamController.broadcast();

  Stream<R> get result => resultController.stream;

  void execute(P params) {
    resultController.addStream(invoke(params));
  }

  Stream<R> invoke(P params);
}

abstract class BaseUseCase<R> {
  StreamController<R> resultController = StreamController.broadcast();

  Stream<R> get result => resultController.stream;

  void execute() {
    resultController.addStream(invoke());
  }

  Stream<R> invoke();
}
