import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorcery_app/features/groceries/data/data_sources/local/grocery_data_source.dart';
import '../../../../core/status.dart';
import '../../data/models/grocery.dart';
part 'grocery_state.dart';
part 'grocery_events.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GroceryDataSource groceryDataSource;
  GroceryBloc(this.groceryDataSource) : super(const GroceryState()) {
    on<GetGroceryEvent>(_getMovies);
    on<SetBoughtEvent>(setBought);
    on<CleartBoughtGroceryEvent>(clearBought);
    on<AddGroceryEvent>(AddGrocery);
  }
  Future<void> _getMovies(
      GetGroceryEvent event, Emitter<GroceryState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = groceryDataSource.getAllGroceries();
    if (result.isNotEmpty) {
      emit(
        state.copyWith(
            status: RequestStatus.loaded,
            message: "success",
            groceries: result),
      );
    } else {
      emit(state.copyWith(
          status: RequestStatus.error, message: "error while fatching data"));
    }
  }

  FutureOr<void> setBought(
      SetBoughtEvent event, Emitter<GroceryState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await groceryDataSource.setBoughtGrocery(event.grocery);
    emit(state.copyWith(
        status: RequestStatus.loaded, message: "success", groceries: result));
  }

  FutureOr<void> clearBought(
      CleartBoughtGroceryEvent event, Emitter<GroceryState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await groceryDataSource.clearBoughtGrocery();
    emit(state.copyWith(
        status: RequestStatus.loaded, message: "success", groceries: result));
  }

  FutureOr<void> AddGrocery(
      AddGroceryEvent event, Emitter<GroceryState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await groceryDataSource.addGrocery(event.grocery);
    emit(state.copyWith(
        status: RequestStatus.loaded, message: "success", groceries: result));
  }
}
