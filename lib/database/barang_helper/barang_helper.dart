import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String db_name = 'item';
const String k_id = 'id';
const String k_nama = 'name';

class JenisBarang {
  String _id;
  String nama;

  JenisBarang(this._id, this.nama);

  JenisBarang.fromMap(Map<String, dynamic> map) {
    this._id = map[k_id];
    this.nama = map[k_nama];
  }

  String get id => _id;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map[k_id] = this._id;
    map[k_nama] = this.nama;
    return map;
  }
}

class JenisBarangDBHelper {
  JenisBarangDBHelper._();
  static final JenisBarangDBHelper dbHelper = JenisBarangDBHelper._();
  static Database _db;

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), '$db_name.db');
    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $db_name (
        $k_id TEXT PRIMARY KEY,
        $k_nama TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  Future<List<JenisBarang>> selectAll() async {
    Database db = await this.database;
    var mapList = await db.query(db_name, orderBy: k_nama);
    var result = List<JenisBarang>.generate(
        mapList.length, (index) => JenisBarang.fromMap(mapList[index]));
    return result;
  }

  Future<int> insert(JenisBarang barang) async {
    Database db = await this.database;
    int count = await db.insert(db_name, barang.toMap());
    return count;
  }

  Future<int> update(JenisBarang barang) async {
    Database db = await this.database;
    int count = await db.update(db_name, barang.toMap(),
        where: '$k_id=?', whereArgs: [barang.id]);
    return count;
  }

  Future<int> delete(String id) async {
    Database db = await this.database;
    int count = await db.delete(db_name, where: '$k_id=?', whereArgs: [id]);
    return count;
  }
}
