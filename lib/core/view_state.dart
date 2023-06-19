import 'package:equatable/equatable.dart';

enum State { initial, loading, success, failed }

class ViewState<T> extends Equatable {
  final State state;
  final T? data;
  final String? errorMessage;

  const ViewState.initial()
      : state = State.initial,
        data = null,
        errorMessage = null;

  const ViewState.loading()
      : state = State.loading,
        data = null,
        errorMessage = null;

  const ViewState.success({this.data})
      : state = State.success,
        errorMessage = null;

  const ViewState.failed({
    this.errorMessage,
  })  : state = State.failed,
        data = null;

  bool get isLoading => state == State.loading;
  bool get isSuccess => state == State.success;
  bool get isFailed => state == State.failed;

  @override
  List<Object?> get props => [state, data, errorMessage];
}
