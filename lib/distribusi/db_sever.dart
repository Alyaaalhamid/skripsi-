import 'package:skripsi/distribusi/dbhelperdistribut.dart';
import 'package:skripsi/distribusi/distribusimodel.dart';

class DBserver {
  Future<List<DistribusiModel>> getDistribusi() async {
    await DBHelper.init();

    List<Map<String, dynamic>> distribusi =
        await DBHelper.query(DistribusiModel.table);

    return distribusi.map((item) => DistribusiModel.fromMap(item)).toList();
  }

  Future<bool> addDistribusi(DistribusiModel model) async {
    await DBHelper.init();

    //bool isSaved = false;

    int ret = await DBHelper.insert(DistribusiModel.table, model);

    return ret > 0 ? true : false;
  }

  Future<bool> updateDistribusi(DistribusiModel model) async {
    await DBHelper.init();

    //bool isSaved = false;

    int ret = await DBHelper.update(DistribusiModel.table, model);

    return ret > 0 ? true : false;
  }

  Future<bool> deleteDistribusi(DistribusiModel model) async {
    await DBHelper.init();

    //bool isSaved = false;

    int ret = await DBHelper.delete(DistribusiModel.table, model);

    return ret > 0 ? true : false;
  }
}
