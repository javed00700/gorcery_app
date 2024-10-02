import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorcery_app/features/groceries/data/models/grocery.dart';
import 'package:gorcery_app/features/groceries/presentation/blocs/grocery_bloc.dart';
import 'package:uuid/uuid.dart';

class AddGrocery extends StatefulWidget {
  const AddGrocery({super.key});

  @override
  State<AddGrocery> createState() => _AddGroceryState();
}

class _AddGroceryState extends State<AddGrocery> {
  // TextEditingController itemCode = TextEditingController();
  TextEditingController itemName = TextEditingController();
  TextEditingController itemDesc = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Grocery"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FilledButton(
          child: const Text('submit'),
          onPressed: () {
            if (key.currentState?.validate() ?? false) {
              context.read<GroceryBloc>().add(AddGroceryEvent(
                  grocery: Grocery(
                      itemCode: const Uuid().v1(),
                      itemName: itemName.text,
                      itemDescription: itemDesc.text,
                      hasBought: false)));
              // if(state.)
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('Name')),
                controller: itemName,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter Item Code';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Dersciption')),
                controller: itemDesc,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter Item Dersciption';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
