import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ViewState<T> with _$ViewState<T> {
  const factory ViewState.initial() = Initial;
  const factory ViewState.loading() = Loading;
  const factory ViewState.loaded({required T data}) = Loaded<T>;
  const factory ViewState.error({required String message}) = Error;
}