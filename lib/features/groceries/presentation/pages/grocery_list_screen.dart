import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorcery_app/features/groceries/presentation/blocs/grocery_bloc.dart';
import '../../../../core/status.dart';
import '../../data/models/grocery.dart';
import 'add_grocery_screen.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<GroceryBloc>().add(GetGroceryEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          TextButton(
              onPressed: () {
                context.read<GroceryBloc>().add(CleartBoughtGroceryEvent());
              },
              child: const Text('Clear Bought'))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddGrocery()));
          },
          label: const Text('Add Grocery Item')),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const CircularProgressIndicator.adaptive();
            case RequestStatus.loaded:
              return GroceryList(
                groceries: state.groceries,
              );
            case RequestStatus.error:
              return Text(state.message);
          }
        },
      ),
    );
  }
}

class GroceryList extends StatelessWidget {
  final List<Grocery> groceries;

  const GroceryList({super.key, required this.groceries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) {
          Grocery item = groceries.elementAt(index);
          return CheckboxListTile(
            title: Text(item.itemName ?? ''),
            subtitle: Text(item.itemDescription ?? ''),
            value: item.hasBought,
            onChanged: (value) {
              context.read<GroceryBloc>().add(
                  SetBoughtEvent(grocery: item.copyWith(hasBought: value)));
            },
          );
        });
  }
}
