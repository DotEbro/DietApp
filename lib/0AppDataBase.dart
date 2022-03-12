import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbHelper{
  static final dbHelper instance = dbHelper._init();
  static Database? _database;
  final tableName = "userData";
  dbHelper._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB("dbDieto.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    await db.execute('''
    CREATE TABLE $tableName (
    ${ColumnsName.id} $idType,
    ${ColumnsName.name} $textType,
    ${ColumnsName.email} $textType,
    ${ColumnsName.pass} $textType,
    ${ColumnsName.weight} $integerType,
    ${ColumnsName.sex} $textType,
    ${ColumnsName.height} $integerType,
    ${ColumnsName.age} $integerType,
    ${ColumnsName.goal} $textType,
    ${ColumnsName.cal} $integerType,
    ${ColumnsName.protein} $integerType,
    ${ColumnsName.fats} $integerType,
    ${ColumnsName.carbs} $integerType
    )
    ''');
  }
  
  Future<Columns> create(Columns col) async{
    final db = await instance.database;
    final id = await db.insert(tableName, col.toJson());
    return col.copy(id:id);
  }
  
  Future<Columns> query(int id) async{
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: ColumnsName.values,
      where: '${ColumnsName.id} = ?',
      whereArgs: [id],
    );
    if(maps.isNotEmpty){
      return Columns.fromJson(maps.first);
    } else{
      throw Exception('ID $id not found');
    }
  }

  Future<List<Columns>> queryAll() async{
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Columns.fromJson(json)).toList();
  }

  Future<int> update(Columns col) async{
    final db = await instance.database;
    return db.update(tableName, col.toJson(), where: '${ColumnsName.id} = ?', whereArgs: [col.id]);
  }

  Future<int> delete(int id) async{
    final db = await instance.database;
    return await db.delete(tableName, where: '${ColumnsName.id} = ?', whereArgs: [id]);
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}



class ColumnsName{
  static final List<String> values = [
    id, name, email, pass, weight, sex, height, age, goal, cal, protein, fats, carbs
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String email = 'email';
  static final String pass = 'pass';
  static final String weight = 'weight';
  static final String sex = 'sex';
  static final String height = 'height';
  static final String age = 'age';
  static final String goal = 'goal';
  static final String cal = 'cal';
  static final String protein = 'protein';
  static final String fats = 'fats';
  static final String carbs = 'carbs';
}



class Columns{
   final int? id; final String name; final String email; final String pass;
   final int weight; final String sex; final int height; final int age;
   final String goal; final int cal; final int protein; final int fats;
   final int carbs;
  const Columns({
    this.id,  required this.name, required this.email, required this.pass,
    required this.weight, required this.sex, required this.height, 
    required this.age, required this.goal, required this.cal,
    required this.protein, required this.fats, required this.carbs,
});

  Map<String, Object?> toJson() => {
    ColumnsName.id: id, ColumnsName.name: name, ColumnsName.email: email,
    ColumnsName.pass: pass, ColumnsName.weight: weight, ColumnsName.sex: sex,
    ColumnsName.height: height, ColumnsName.age: age, ColumnsName.goal: goal,
    ColumnsName.cal: cal, ColumnsName.protein: protein, ColumnsName.fats: fats,
    ColumnsName.carbs: carbs,
  };

  Columns copy({
    int? id, String? name, String? email, String? pass, int? weight, String? sex,
    int? height, int? age, String? goal, int? cal, int? protein, int? fats, int? carbs,
  }) => Columns(
    id: id ?? this.id, name: name ?? this.name, email: email ?? this.email,
    pass: pass ?? this.pass, weight: weight ?? this.weight, sex: sex ?? this.sex,
    height: height ?? this.height, age: age ?? this.age, goal: goal ?? this.goal,
    cal: cal ?? this.cal, protein: protein ?? this.protein, fats: fats ?? this.fats,
    carbs: carbs ?? this.carbs,
  );

  static Columns fromJson(Map<String, Object?> json) => Columns(
    id: json[ColumnsName.id] as int?,
    name: json[ColumnsName.name] as String,
    email: json[ColumnsName.email] as String,
    pass: json[ColumnsName.pass] as String,
    weight: json[ColumnsName.weight] as int,
    sex: json[ColumnsName.sex] as String,
    height: json[ColumnsName.height] as int,
    age: json[ColumnsName.age] as int,
    goal: json[ColumnsName.goal] as String,
    cal: json[ColumnsName.cal] as int,
    protein: json[ColumnsName.protein] as int,
    fats: json[ColumnsName.fats] as int,
    carbs: json[ColumnsName.carbs] as int,
  );
}

// class DatabaseHelper{
//
//   static final _dbName = 'myDatabase.db';
//   static final _dbVersion = 1;
//   static final _tableName = 'userData';
//

//
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   DatabaseHelper._privateConstructor();
//
//
//   Database? _database;
//
//   Future<Database?> get database async{
//     if(_database != null) return _database;
//
//
//     _database = await _initiateDatabase();
//     return _database;
//   }
//
//   _initiateDatabase() async{
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, _dbName);
//     await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
//   }
//
//   _onCreate(Database db, int version){
//     db.execute(
//       '''
//       CREATE TABLE $_tableName(
//       $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//       $columnName TEXT NOT NULL,
//       $columnEmail TEXT NOT NULL,
//       $columnPass TEXT NOT NULL,
//       $columnWeight INTEGER NOT NULL,
//       $columnSex INTEGER NOT NULL,
//       $columnHeight INTEGER NOT NULL,
//       $columnAge INTEGER NOT NULL,
//       $columnGoal INTEGER NOT NULL,
//       $columnCal INTEGER NOT NULL,
//       $columnProtein INTEGER NOT NULL,
//       $columnFats INTEGER NOT NULL,
//       $columnCarbs INTEGER NOT NULL,
//       )
//       '''
//     );
//   }
//
//   Future<int> insert(Map<String,dynamic> row) async{
//     Database? db = await instance.database;
//     return await db!.insert(_tableName, row);
//   }
//
//   Future<List<Map<String, dynamic>>> queryAll() async{
//     Database? db = await instance.database;
//     return await db!.query(_tableName);
//   }
//
//   Future<int> update(Map<String,dynamic> row) async{
//     Database? db = await instance.database;
//     int id = row[columnId];
//     return await db!.update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
//   }
//
//   Future<int> delete(int id) async{
//     Database? db = await instance.database;
//     return await db!.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
//   }
// }