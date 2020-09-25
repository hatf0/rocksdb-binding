module rocksdb.snapshot;

import rocksdb.database : Database;
import rocksdb.binding;

class Snapshot {
  Database db;
  const(rocksdb_snapshot_t)* snap;

  this(Database db) {
    this.snap = rocksdb_create_snapshot(db.db);
  }

  ~this() {
    rocksdb_release_snapshot(this.db.db, this.snap);
  }
}
