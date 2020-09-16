import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_children_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_program_offline_provider.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganisationUnitOffline extends OfflineDbProvider {
  Database _db;
  String id = 'id';
  String name = 'name';
  String parent = 'parent';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      this._onCreate(_db, version);
      return _db;
    }
  }

  initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "$databaseName.db");
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS  ${OrganisationUnits.organisationUnitTable} ($id TEXT PRIMARY KEY, $name TEXT, $parent TEXT)");
  }

  addOrUpdateOrganisationUnits(List<OrganisationUnits> organisationUnit) async {
    var dbClient = await db;
    organisationUnit.forEach((organisation) async {
      await dbClient.insert(OrganisationUnits.organisationUnitTable,
          organisation.toOffline(organisation),
          conflictAlgorithm: ConflictAlgorithm.replace);
      await OrganisationUnitChildrenOfflineProvider()
          .addOrUpdateChildrenOrganisationUnits(organisation);
      await OrganisationUnitProgramOfflineProvider()
          .addOrUpdateProgramOrganisationUnits(organisation);
    });
  }

  deleteOrganisation(String organisationId) async {
    var dbClient = await db;
    return await dbClient.delete(OrganisationUnits.organisationUnitTable,
        where: '$id = ?', whereArgs: [organisationId]);
  }

  Future<List<OrganisationUnits>> getOrganisationUnits() async {
    List<OrganisationUnits> organisationUnitList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        OrganisationUnits.organisationUnitTable,
        columns: [
          id,
          name,
          parent,
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          String organizationUnitId = map['id'];
          List childrens = await OrganisationUnitChildrenOfflineProvider()
              .getChildrenOrganisationUnits(organizationUnitId);
          List programs = await OrganisationUnitProgramOfflineProvider()
              .getProgramOrganisationUnits(organizationUnitId);
          OrganisationUnits organisationUnits =
              OrganisationUnits.fromOffline(map);
          organisationUnits.program = programs;
          organisationUnits.children = childrens;
          organisationUnitList.add(organisationUnits);
        }
      }
    } catch (e) {}
    return organisationUnitList;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
