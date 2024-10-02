part of 'grocery_bloc.dart';

class GroceryState extends Equatable {
  final List<Grocery> groceries;
  final RequestStatus status;
  final String message;

  const GroceryState({
    this.groceries = const [],
    this.status = RequestStatus.loading,
    this.message = '',
  });

  GroceryState copyWith({
    List<Grocery>? groceries,
    RequestStatus? status,
    String? message,
  }) {
    return GroceryState(
      groceries: groceries ?? this.groceries,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        groceries,
        status,
        message,
      ];
}
