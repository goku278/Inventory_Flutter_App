import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app2/business_logic/api_bloc/api_bloc.dart';

import 'items_display.dart';

class DataDisplayPage extends StatefulWidget {
  const DataDisplayPage({super.key});

  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {
  late ApiBloc apiBloc;

  @override
  void initState() {
    apiBloc = BlocProvider.of<ApiBloc>(context);
    apiBloc.add(GetDataItems(id: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Inventory App'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        bloc: apiBloc,
        builder: (context, state) {
          debugPrint("state is -> ${state}");
          if (state is DataInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataLoaded) {
            debugPrint("Inside data loaded!");
            return ListView.builder(
                itemCount: state.listOfItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: Card(
                        elevation: 1,
                        color: const Color(0xFDFDFEFE),
                        child: ListTile(
                            // ClipOval(
                            leading: ClipOval(
                              child: Image.network(
                                state.listOfItems[index].image!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // ),
                            contentPadding: const EdgeInsets.only(left: 25),
                            title: Text(
                              state.listOfItems[index].name.toString(),
                              textDirection: TextDirection.ltr,
                            ),
                            subtitle: Text(
                              state.listOfItems[index].price.toString(),
                              textDirection: TextDirection.ltr,
                            )),
                      ),
                      onTap: () {
                        debugPrint(
                            "Clicked on ${state.listOfItems[index].name}");
                        // Navigator.pushNamed(context, "/Completed");
                        var item = state.listOfItems[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DisplayIndividualData(item: item),
                            ));
                      });
                }
                /*itemBuilder: (context, index) {
                Items items = state.listOfItems[index];

                child:
                Card(
                  elevation: 1,
                  color: const Color(0xFDFDFEFE),
                  child: ListTile(
                    // ClipOval(
                    leading: ClipOval(
                      child: Image.network(
                        items.image!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // ),
                    contentPadding: const EdgeInsets.only(left: 25),
                    title: Text(
                      items.name.toString(),
                      textDirection: TextDirection.ltr,
                    ),
                    subtitle: Text(
                      items.price.toString(),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                );
                // );
              },*/
                );
          } else if (state is DataError) {
            return const Center(
              child: SizedBox(
                child: Text('Error has been detected!'),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
