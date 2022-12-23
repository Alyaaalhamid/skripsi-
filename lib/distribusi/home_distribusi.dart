import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skripsi/distribusi/add_edit_distribusi.dart';
import 'package:skripsi/distribusi/db_sever.dart';
import 'package:skripsi/distribusi/distribusimodel.dart';
import 'package:skripsi/distribusi/model.dart';
//import 'package:skripsi/distribut/distribusimatkul.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/list_helper.dart';

class HomeDistribusi extends StatefulWidget {
  const HomeDistribusi({
    Key? key,
  }) : super(key: key);

  @override
  _HomeDistribusi createState() => _HomeDistribusi();
}

class _HomeDistribusi extends State<HomeDistribusi> {
  late bool ascending;
  bool sort = true;
  //var datamatkul;
  DBserver dBserver = DBserver();
  //bool isDescending = false;

  @override
  void initState() {
    super.initState();
    ascending = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Distribusi Mata Kuliah'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // TextButton.icon(
              //   onPressed: () => setState(() {
              //     isDescending = !isDescending;
              //   }),
              //   icon: RotatedBox(
              //     quarterTurns: 1,
              //     child: Icon(
              //       Icons.compare_arrows,
              //       size: 18,
              //       color: Colors.green,
              //     ),
              //   ),
              //   label: Text(
              //     isDescending ? 'Descending' : 'Ascending',
              //     style: TextStyle(fontSize: 16, color: Colors.green),
              //   ),
              // ),
              _fetchData(),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: FormHelper.submitButton(
                    'Tambah',
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddEditDistribusi()));
                    },
                    borderRadius: 10,
                    btnColor: Colors.green,
                    borderColor: Colors.green,
                  )),
            ],
          ),
        ));
  }

  _fetchData() {
    return FutureBuilder<List<DistribusiModel>>(
      future: dBserver.getDistribusi(),
      builder:
          (BuildContext context, AsyncSnapshot<List<DistribusiModel>> matkul) {
        // final sortedItems = Nilai
        //   ..sort((data1, data2) => isDescending? data2.compareTo(data1) : data2.compareTo(data1)) ;
        // final item = sortedItems[matkul];
        if (matkul.hasData) {
          return _buildDataTable(matkul.data!);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _buildDataTable(List<DistribusiModel> model) {
    return ListUtils.buildDataTable(
        context,
        ['Mata Kuliah ', 'Nilai', 'Keterangan', ''],
        ['nama', 'nilai', 'keterangan', ''],
        sort,
        1,
        model,
        (DistribusiModel data) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditDistribusi(
                isEditMode: true,
                // model: ,
              ),
            ),
          );
        },
        (DistribusiModel data) {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Delete'),
                  content: const Text('Anda yakin ingin menghapus ?'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FormHelper.submitButton('Ya', () {
                          dBserver.deleteDistribusi(data).then((value) {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          });
                        },
                            width: 100,
                            borderRadius: 5,
                            btnColor: Colors.green,
                            borderColor: Colors.green),
                        SizedBox(
                          width: 5,
                        ),
                        FormHelper.submitButton('Tidak', () {
                          Navigator.of(context).pop();
                        },
                            width: 100,
                            borderRadius: 5,
                            btnColor: Colors.grey,
                            borderColor: Colors.grey),
                      ],
                    )
                  ],
                );
              });
        },
        headingRowColor: Colors.green,
        isScrollable: false,
        columnTextFontSize: 14,
        columnTextBold: false,
        columnSpacing: 4,
        onSort: (columnIndex, columnName, asc) {
          if (columnIndex == 1) {
            setState(() {
              if (ascending) {
                model.sort((a, b) => a.Nilai!.compareTo(b.Nilai!));
              } else {
                model.sort((a, b) => b.Nilai!.compareTo(a.Nilai!));
              }
              this.ascending = ascending;
            });
          }
        }
        //=> onSortColumn(),
        );
  }

  // void onSortColumn({columnIndex, colmnName, asc}) {
  //   if (columnIndex == 1) {
  //     setState(() {
  //       if (ascending) {
  //           .sort((a, b) => a.Nilai.compareTo(b.Nilai));
  //       }
  //     });
  //   }
  // }
}
