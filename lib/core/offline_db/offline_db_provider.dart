import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OfflineDbProvider {
  final String databaseName = "kb_ovc_dream";
  Database _db;
  // Script for migrations as well as intialization of tables
  final List<String> initialQuery = [
    "CREATE TABLE IF NOT EXISTS current_user (id TEXT PRIMARY KEY, name TEXT, username TEXT, password TEXT , implementingPartner TEXT ,isLogin INTEGER)",
    "CREATE TABLE IF NOT EXISTS current_user_ou (id TEXT PRIMARY KEY, userId TEXT)",
    "CREATE TABLE IF NOT EXISTS current_user_program (id TEXT PRIMARY KEY, userId TEXT)",
    "CREATE TABLE IF NOT EXISTS organisation_unit (id TEXT PRIMARY KEY, name TEXT, code TEXT, parent TEXT, level NUMBER)",
    "CREATE TABLE IF NOT EXISTS organisation_unit_children (id TEXT PRIMARY KEY, organisationId TEXT)",
    "CREATE TABLE IF NOT EXISTS organisation_unit_program (id TEXT PRIMARY KEY ,programId TEXT, organisationId TEXT)",
    "CREATE TABLE IF NOT EXISTS tracked_entity_instance (id TEXT PRIMARY KEY, trackedEntityInstance TEXT, trackedEntityType TEXT,orgUnit TEXT,syncStatus TEXT )",
    "CREATE TABLE IF NOT EXISTS tracked_entity_instance_attribute (id TEXT PRIMARY KEY,  trackedEntityInstance TEXT,attribute TEXT, value TEXT)",
    "CREATE TABLE IF NOT EXISTS enrollment (id TEXT PRIMARY KEY, enrollment TEXT ,enrollmentDate TEXT, incidentDate TEXT, program TEXT, orgUnit TEXT,trackedEntityInstance TEXT, status TEXT,syncStatus TEXT)",
    "CREATE TABLE IF NOT EXISTS events (id TEXT PRIMARY KEY, event TEXT, eventDate TEXT, program TEXT,programStage TEXT, trackedEntityInstance TEXT, status TEXT, orgUnit TEXT,syncStatus TEXT)",
    "CREATE TABLE IF NOT EXISTS event_data_value (id TEXT PRIMARY KEY, event TEXT,dataElement TEXT, value TEXT)",
    "CREATE TABLE IF NOT EXISTS tei_relationships (id TEXT PRIMARY KEY, relationshipType TEXT, fromTei TEXT, toTei TEXT)",
    "CREATE TABLE IF NOT EXISTS app_logs (id TEXT PRIMARY KEY, type TEXT, message TEXT, date TEXT)",
    "CREATE TABLE IF NOT EXISTS reserve_value (id TEXT PRIMARY KEY,attribute TEXT,value TEXT,expireDate TEXT)",
  ];

  final List<String> migrationQuery = [];

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    this.onCreate(_db, migrationQuery.length + 1);
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    return await openDatabase(
      path,
      version: migrationQuery.length + 1,
      onUpgrade: onUpgrade,
      onCreate: onCreate,
    );
  }

  onCreate(Database db, int version) async {
    for (String query in initialQuery) {
      await db.execute(query);
    }
  }

  onUpgrade(Database db, int oldVersion, int version) async {
    for (String query in migrationQuery) {
      await db.execute(query);
    }
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
