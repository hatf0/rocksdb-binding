module rocksdb.options;

import std.conv : to;
import std.string : fromStringz;
import core.stdc.stdlib : cfree = free;

import rocksdb.comparator;
import rocksdb.env : Env;
import rocksdb.snapshot : Snapshot;
import rocksdb.binding;

enum CompressionType : int {
  NONE = 0x0,
  SNAPPY = 0x1,
  ZLIB = 0x2,
  BZIP2 = 0x3,
  LZ4 = 0x4,
  LZ4HC = 0x5,
  XPRESS = 0x6,
  ZSTD = 0x7,
}

enum CompactionStyle : int {
  LEVEL = 0,
  UNIVERSAL = 1,
  FIFO = 2,
}

enum ReadTier : int {
  READ_ALL = 0x0,
  BLOCK_CACHE = 0x1,
  PERSISTED = 0x2,
}

class WriteOptions {
  rocksdb_writeoptions_t* opts;

  this() {
    this.opts = rocksdb_writeoptions_create();
  }

  ~this() {
    rocksdb_writeoptions_destroy(this.opts);
  }

  @property void sync(bool v) {
    rocksdb_writeoptions_set_sync(this.opts, cast(ubyte)v);
  }

  @property void disableWAL(bool v) {
    rocksdb_writeoptions_disable_WAL(this.opts, cast(int)v);
  }
}

class ReadOptions {
  rocksdb_readoptions_t* opts;

  this() {
    this.opts = rocksdb_readoptions_create();
  }

  ~this() {
    rocksdb_readoptions_destroy(this.opts);
  }

  @property void verifyChecksums(bool v) {
    rocksdb_readoptions_set_verify_checksums(this.opts, cast(ubyte)v);
  }

  @property void fillCache(bool v) {
    rocksdb_readoptions_set_fill_cache(this.opts, cast(ubyte)v);
  }

  @property void readTier(ReadTier tier) {
    rocksdb_readoptions_set_read_tier(this.opts, tier);
  }

  @property void tailing(bool v) {
    rocksdb_readoptions_set_tailing(this.opts, cast(ubyte)v);
  }

  @property void readAheadSize(size_t size) {
    rocksdb_readoptions_set_readahead_size(this.opts, size);
  }

  @property void snapshot(Snapshot snap) {
    rocksdb_readoptions_set_snapshot(this.opts, snap.snap);
  }
}

class DBOptions {
   rocksdb_options_t* opts;

  this() {
    this.opts = rocksdb_options_create();
  }

  ~this() {
    rocksdb_options_destroy(this.opts);
  }

  @property void parallelism(int totalThreads) {
    rocksdb_options_increase_parallelism(this.opts, totalThreads);
  }

  @property void createIfMissing(bool value) {
    rocksdb_options_set_create_if_missing(this.opts, cast(ubyte)value);
  }

  @property void createMissingColumnFamilies(bool value) {
    rocksdb_options_set_create_missing_column_families(this.opts, cast(ubyte)value);
  }

  @property void errorIfExists(bool value) {
    rocksdb_options_set_error_if_exists(this.opts, cast(ubyte)value);
  }

  @property void paranoidChecks(bool value) {
    rocksdb_options_set_paranoid_checks(this.opts, cast(ubyte)value);
  }

  @property void env(Env env) {
    rocksdb_options_set_env(this.opts, env.env);
  }

  @property void compression(CompressionType type) {
    rocksdb_options_set_compression(this.opts, type);
  }

  @property void compactionStyle(CompactionStyle style) {
    rocksdb_options_set_compaction_style(this.opts, style);
  }

  @property void comparator(Comparator cmp) {
    rocksdb_options_set_comparator(this.opts, cmp.cmp);
  }

  void enableStatistics() {
    rocksdb_options_enable_statistics(this.opts);
  }

  string getStatisticsString() {
    char* cresult = rocksdb_options_statistics_get_string(this.opts);
    string result = fromStringz(cresult).to!string;
    cfree(cresult);
    return result;
  }
}
