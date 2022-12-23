import 'package:flutter/material.dart';
import 'package:skripsi/distribusi/db_sever.dart';
import 'package:skripsi/distribusi/distribusimodel.dart';
import 'package:skripsi/model/color_pallete.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class AddEditDistribusi extends StatefulWidget {
  const AddEditDistribusi({Key? key, this.model, this.isEditMode = false})
      : super(key: key);
  final DistribusiModel? model;
  final bool isEditMode;

  @override
  _AddEditDistribusi createState() => _AddEditDistribusi();
}

class _AddEditDistribusi extends State<AddEditDistribusi> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late DistribusiModel model;
  List<dynamic> category = [];
  List<dynamic> Nilai = [];
  List<dynamic> keterangan = [];
  late DBserver dBserver;

  //var nilai = ['A', 'B', 'C', 'D', 'E'];

  @override
  void initState() {
    super.initState();
    dBserver = DBserver();
    model = DistribusiModel(nama: '', Nilai: '', ket: '');
    if (widget.isEditMode) {
      model = widget.model!;
    }
    category.add({'id': 1, 'name': 'Algoritma dan Pemrograman I'});
    category.add({'id': 2, 'name': 'Aljabar Linier'});
    category.add({'id': 3, 'name': 'Kalkulus I'});
    category.add(
        {'id': 4, 'name': 'Pengantar Teknologi Komunikasi dan Informatika'});
    category.add({'id': 5, 'name': 'TIK dan Masyarakat'});
    category.add({'id': 6, 'name': 'Pendidikan Kewarganegaraan'});
    category.add({'id': 7, 'name': 'Bahasa Indonesia'});
    category.add({'id': 8, 'name': 'Bahasa Inggris'});
    category.add({'id': 9, 'name': 'Algoritma dan Pemrograman II'});
    category.add({'id': 10, 'name': 'Kalkulus II'});
    category.add({'id': 11, 'name': 'Komunikasi Data dan Jaringan Komputer'});
    category.add({'id': 12, 'name': 'Matematika Diskrit'});
    category.add({'id': 13, 'name': 'Pemrograman Web'});
    category.add({'id': 14, 'name': 'Pendidikan Agama'});
    category.add({'id': 15, 'name': 'Pendidikan Pancasila'});
    category.add({'id': 16, 'name': 'Arsitektur dan Organisasi Komputer'});
    category.add({'id': 17, 'name': 'Basis Data'});
    category.add({'id': 18, 'name': 'Kecerdasan Artifisial'});
    category.add({'id': 19, 'name': 'Perancangan dan Analisis Algoritma'});
    category.add({'id': 20, 'name': 'Sistem Digital'});
    category.add({'id': 21, 'name': 'Statistika dan Probabilitas'});
    category.add({'id': 22, 'name': 'Struktur Data dan Algoritma'});
    category.add({'id': 23, 'name': 'Automata dan Kompilasi'});
    category.add({'id': 24, 'name': 'Interaksi Manusia dan Komputer'});
    category.add({'id': 25, 'name': 'Machine Learning'});
    category.add({'id': 26, 'name': 'Metode Numerik'});
    category.add({'id': 27, 'name': 'Mobile Programming'});
    category.add({'id': 28, 'name': 'Rekayasa Perangkat Lunak'});
    category.add({'id': 29, 'name': 'Data Science'});
    category.add({'id': 30, 'name': 'Manajemen Proyek'});
    category.add({'id': 31, 'name': 'Pemrograman Game'});
    category.add({'id': 32, 'name': 'Pengolahan Citra'});
    category.add({'id': 33, 'name': 'Sistem Operasi'});
    category.add({'id': 34, 'name': 'Kewirausahaan'});
    category.add({'id': 35, 'name': 'Olahraga/Seni'});
    category.add({'id': 36, 'name': 'Konservasi Alam dan Lingkungan'});
    category.add({'id': 37, 'name': 'Pendidikan Anti Korupsi'});
    category.add({'id': 38, 'name': 'Algoritma Paralel'});
    category.add({'id': 39, 'name': 'Augmented and Virtual Reality'});
    category.add({'id': 40, 'name': 'Cloud Computing'});
    category.add({'id': 41, 'name': 'Keamanan Siber'});
    category.add({'id': 42, 'name': 'Kriptografi'});
    category.add({'id': 43, 'name': 'Simulasi dan Pemodelan'});
    category.add({'id': 44, 'name': 'Kerja Praktek'});
    category.add({'id': 45, 'name': 'Deep Learning'});
    category.add({'id': 46, 'name': 'Etika Profesi Teknologi Informasi'});
    category.add({'id': 47, 'name': 'Natural Language Processing'});
    category.add({'id': 48, 'name': 'Sistem Terdistribusi'});
    category.add({'id': 49, 'name': 'Metodologi Penelitian'});
    category.add({'id': 50, 'name': 'ICT Technopreneurship and Leadership'});
    category.add({'id': 51, 'name': 'Internet of Things'});
    category.add({'id': 52, 'name': 'Skripsi'});

    Nilai.add({'id': 1, 'name': 'A'});
    Nilai.add({'id': 2, 'name': 'B'});
    Nilai.add({'id': 3, 'name': 'C'});
    Nilai.add({'id': 4, 'name': 'D'});
    Nilai.add({'id': 5, 'name': 'E'});

    keterangan.add({'name': 'A', 'ket': 'LULUS'});
    keterangan.add({'name': 'B', 'ket': 'LULUS'});
    keterangan.add({'name': 'C', 'ket': 'LULUS'});
    keterangan.add({'name': 'D', 'ket': 'Mengulang'});
    keterangan.add({'name': 'E', 'ket': 'Mengulang'});
    keterangan.add({'name': '', 'ket': 'Belum Mengambil'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          automaticallyImplyLeading: true,
          title: Text(
            widget.isEditMode ? 'Edis Distribusi' : 'Add Distribusi',
          ),
        ),
        body: Form(key: globalKey, child: _formUI()),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormHelper.submitButton('Save', () {
                // var selected = Nilai.where((e) => e == model.Nilai);

                // if (selected == 'A' || selected == 'B' || selected == 'C') {
                //   print(model.ket == 'LULUS');
                // } else if (selected == 'D') {
                //   print(model.ket == keterangan);
                // }

                var selectedKeterangan =
                    keterangan.where((ket) => ket['name'] == model.Nilai);
                if (selectedKeterangan.length == 1) {
                  model.ket = selectedKeterangan.first['ket'];
                } else {
                  print('belum ambil');
                }
                if (ValidateAndSave()) {
                  if (widget.isEditMode) {
                    dBserver.updateDistribusi(model).then((value) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        'SQFLITE',
                        'Data Berhasil diubah',
                        'OK',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    });
                  } else {
                    dBserver.addDistribusi(model).then((value) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        'SQFLITE',
                        'Data ditambah',
                        'OK',
                        () {
                          // if (Nilai == 'A' || Nilai == 'B' || Nilai == 'C') {
                          //   print(model.ket == 'LULUS');
                          // } else if (Nilai == 'D' || Nilai == 'E') {
                          //   print(model.ket == 'MENGULANG');
                          // }
                          // else {
                          //   print('Belum Ambil');
                          // }
                          Navigator.pop(context);
                        },
                      );
                    });
                  }
                  //print(model.toJson());
                }
                print(model.toJson());
              },
                  borderRadius: 10,
                  btnColor: Colors.green,
                  borderColor: colorpallete.WajahButtonPrimary),
              FormHelper.submitButton('Cancel', () {
                Navigator.of(context).pop();
              },
                  borderRadius: 10,
                  btnColor: Colors.grey,
                  borderColor: colorpallete.WajahButtonPrimary),
            ],
          ),
        ));
  }

  _formUI() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: FormHelper.dropDownWidgetWithLabel(
                      context,
                      'Mata Kuliah',
                      '--Select--',
                      model.nama,
                      category, (onChanged) {
                    this.model.nama = onChanged! ?? '';
                  }, (onValidate) {
                    if (onValidate == null) {
                      return 'Silahkan Pilih Mata Kuliah';
                    }
                    return null;
                  },
                      borderRadius: 10,
                      labelFontSize: 14,
                      paddingLeft: 0,
                      paddingRight: 0,
                      hintFontSize: 14,
                      borderColor: colorpallete.WajahButtonPrimary,
                      optionValue: 'name'),
                ),
                Flexible(
                  flex: 1,
                  child: FormHelper.dropDownWidgetWithLabel(
                      context, 'Nilai', '--Select--', model.Nilai, Nilai,
                      (onChanged) {
                    this.model.Nilai = onChanged! ?? '';
                  }, (onValidate) {
                    //   if (onValidate == null) {
                    //     return 'Silahkan Pilih Mata Kuliah';
                    //   }
                    //   return null;
                  },
                      borderRadius: 10,
                      labelFontSize: 14,
                      paddingLeft: 0,
                      paddingRight: 0,
                      hintFontSize: 14,
                      borderColor: colorpallete.WajahButtonPrimary,
                      optionValue: 'name'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool ValidateAndSave() {
    final from = globalKey.currentState;
    if (from!.validate()) {
      from.save();
      return true;
    }
    return false;
  }
}
