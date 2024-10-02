// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'grocery_bloc.dart';

sealed class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class GetGroceryEvent extends GroceryEvent {}

class CleartBoughtGroceryEvent extends GroceryEvent {}

class SetBoughtEvent extends GroceryEvent {
  final Grocery grocery;
  const SetBoughtEvent({
    required this.grocery,
  });
}

class AddGroceryEvent extends GroceryEvent {
  final Grocery grocery;
  const AddGroceryEvent({
    required this.grocery,
  });
}
