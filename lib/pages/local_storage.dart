import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/dialog_box.dart';
import '../widgets/page_title.dart';

class LocalStorage extends StatefulWidget {
  const LocalStorage({super.key});

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  var box = Hive.box('digibox');
  TextEditingController fieldControllerA = TextEditingController();
  TextEditingController fieldControllerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const PageTitle(
            title: 'LOCAL STORAGE',
          ),
          SizedBox(
            height: h * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
              children: [
                SizedBox(
                  width: w * 0.8,
                  child: TextField(
                    controller: fieldControllerA,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter The Key',
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                SizedBox(
                  width: w * 0.8,
                  child: TextField(
                    controller: fieldControllerB,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter The value',
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  width: w * 0.8,
                  height: h * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    onTap: () {
                      fieldControllerA.text.isEmpty ||
                              fieldControllerB.text.isEmpty
                          ? showErrorDialog(context, 'Please Fill All Details')
                          : saveData(fieldControllerA, fieldControllerB);
                    },
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                const Text(
                  "Local Storage Data",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: h * 0.58,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: w * 0.05, right: w * 0.05, top: 20),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Key'),
                                  Text('value'),
                                  Text('Delete'),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black)),
                              child: ListTile(
                                  leading: SelectableText(
                                    box.keys.elementAt(index),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  title: SelectableText(
                                    box
                                        .get(box.keys.elementAt(index))
                                        .toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  trailing: TextButton(
                                    child: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        box.delete(box.keys.elementAt(index));
                                      });
                                    },
                                  )),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  saveData(fieldControllerA, fieldControllerB) {
    setState(() {
      box.put(fieldControllerA.text, fieldControllerB.text);
      fieldControllerA.clear();
      fieldControllerB.clear();
    });
  }
}
