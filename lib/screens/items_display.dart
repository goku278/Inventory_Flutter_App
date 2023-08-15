import 'package:flutter/material.dart';

import '../model/items.dart';

class DisplayIndividualData extends StatelessWidget {
  Items item;

  DisplayIndividualData({super.key, required this.item});

  late var contextt ;

  @override
  void onBackPressed() {
    Navigator.push(
        contextt,
        MaterialPageRoute(
          builder: (context) => DisplayIndividualData(item: item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    contextt = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Column(
        // SizedBox(),
        // padding: EdgeInsets.all(20),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.network(
              item.image!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              // height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Center(
          //
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              item.name.toString(),
              // textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Center(
              child: SizedBox(
                child: Row(
                  children: [
                    const Text(
                      'Cost: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      item.price.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 25),
            child: Text(
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.none),
                item.description.toString()),
          ),
        ],
      ),
    );
  }
}
