module rocksdb.binding;

import core.stdc.config;
import core.stdc.stdarg: va_list;
static import core.simd;
static import std.conv;

struct Int128 { long lower; long upper; }
struct UInt128 { ulong lower; ulong upper; }

struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }


    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C)
{
    alias wchar_t = int;
    alias size_t = c_ulong;
    alias ptrdiff_t = c_long;
    struct max_align_t
    {
        long __clang_max_align_nonce1;
        real __clang_max_align_nonce2;
    }
    alias uintmax_t = c_ulong;
    alias intmax_t = c_long;
    alias uintptr_t = c_ulong;
    alias intptr_t = c_long;
    alias uint_fast64_t = c_ulong;
    alias uint_fast32_t = c_ulong;
    alias uint_fast16_t = c_ulong;
    alias uint_fast8_t = ubyte;
    alias int_fast64_t = c_long;
    alias int_fast32_t = c_long;
    alias int_fast16_t = c_long;
    alias int_fast8_t = byte;
    alias uint_least64_t = c_ulong;
    alias uint_least32_t = uint;
    alias uint_least16_t = ushort;
    alias uint_least8_t = ubyte;
    alias int_least64_t = c_long;
    alias int_least32_t = int;
    alias int_least16_t = short;
    alias int_least8_t = byte;
    void rocksdb_options_set_memtable_whole_key_filtering(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_dump_malloc_stats(rocksdb_options_t*, ubyte) @nogc nothrow;
    c_ulong rocksdb_approximate_memory_usage_get_cache_total(rocksdb_memory_usage_t*) @nogc nothrow;
    c_ulong rocksdb_approximate_memory_usage_get_mem_table_readers_total(rocksdb_memory_usage_t*) @nogc nothrow;
    c_ulong rocksdb_approximate_memory_usage_get_mem_table_unflushed(rocksdb_memory_usage_t*) @nogc nothrow;
    c_ulong rocksdb_approximate_memory_usage_get_mem_table_total(rocksdb_memory_usage_t*) @nogc nothrow;
    void rocksdb_approximate_memory_usage_destroy(rocksdb_memory_usage_t*) @nogc nothrow;
    rocksdb_memory_usage_t* rocksdb_approximate_memory_usage_create(rocksdb_memory_consumers_t*, char**) @nogc nothrow;
    void rocksdb_memory_consumers_destroy(rocksdb_memory_consumers_t*) @nogc nothrow;
    void rocksdb_memory_consumers_add_cache(rocksdb_memory_consumers_t*, rocksdb_cache_t*) @nogc nothrow;
    void rocksdb_memory_consumers_add_db(rocksdb_memory_consumers_t*, rocksdb_t*) @nogc nothrow;
    rocksdb_memory_consumers_t* rocksdb_memory_consumers_create() @nogc nothrow;
    const(char)* rocksdb_pinnableslice_value(const(rocksdb_pinnableslice_t)*, c_ulong*) @nogc nothrow;
    void rocksdb_pinnableslice_destroy(rocksdb_pinnableslice_t*) @nogc nothrow;
    rocksdb_pinnableslice_t* rocksdb_get_pinned_cf(rocksdb_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    rocksdb_pinnableslice_t* rocksdb_get_pinned(rocksdb_t*, const(rocksdb_readoptions_t)*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_free(void*) @nogc nothrow;
    void rocksdb_optimistictransaction_options_set_set_snapshot(rocksdb_optimistictransaction_options_t*, ubyte) @nogc nothrow;
    void rocksdb_optimistictransaction_options_destroy(rocksdb_optimistictransaction_options_t*) @nogc nothrow;
    rocksdb_optimistictransaction_options_t* rocksdb_optimistictransaction_options_create() @nogc nothrow;
    void rocksdb_transaction_options_set_max_write_batch_size(rocksdb_transaction_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_transaction_options_set_deadlock_detect_depth(rocksdb_transaction_options_t*, c_long) @nogc nothrow;
    void rocksdb_transaction_options_set_expiration(rocksdb_transaction_options_t*, c_long) @nogc nothrow;
    void rocksdb_transaction_options_set_lock_timeout(rocksdb_transaction_options_t*, c_long) @nogc nothrow;
    void rocksdb_transaction_options_set_deadlock_detect(rocksdb_transaction_options_t*, ubyte) @nogc nothrow;
    void rocksdb_transaction_options_set_set_snapshot(rocksdb_transaction_options_t*, ubyte) @nogc nothrow;
    void rocksdb_transaction_options_destroy(rocksdb_transaction_options_t*) @nogc nothrow;
    rocksdb_transaction_options_t* rocksdb_transaction_options_create() @nogc nothrow;
    void rocksdb_transactiondb_options_set_default_lock_timeout(rocksdb_transactiondb_options_t*, c_long) @nogc nothrow;
    void rocksdb_transactiondb_options_set_transaction_lock_timeout(rocksdb_transactiondb_options_t*, c_long) @nogc nothrow;
    void rocksdb_transactiondb_options_set_num_stripes(rocksdb_transactiondb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_transactiondb_options_set_max_num_locks(rocksdb_transactiondb_options_t*, c_long) @nogc nothrow;
    void rocksdb_transactiondb_options_destroy(rocksdb_transactiondb_options_t*) @nogc nothrow;
    rocksdb_transactiondb_options_t* rocksdb_transactiondb_options_create() @nogc nothrow;
    void rocksdb_optimistictransactiondb_close(rocksdb_optimistictransactiondb_t*) @nogc nothrow;
    rocksdb_transaction_t* rocksdb_optimistictransaction_begin(rocksdb_optimistictransactiondb_t*, const(rocksdb_writeoptions_t)*, const(rocksdb_optimistictransaction_options_t)*, rocksdb_transaction_t*) @nogc nothrow;
    void rocksdb_optimistictransactiondb_close_base_db(rocksdb_t*) @nogc nothrow;
    rocksdb_t* rocksdb_optimistictransactiondb_get_base_db(rocksdb_optimistictransactiondb_t*) @nogc nothrow;
    rocksdb_optimistictransactiondb_t* rocksdb_optimistictransactiondb_open_column_families(const(rocksdb_options_t)*, const(char)*, int, const(const(char)*)*, const(const(rocksdb_options_t)*)*, rocksdb_column_family_handle_t**, char**) @nogc nothrow;
    rocksdb_optimistictransactiondb_t* rocksdb_optimistictransactiondb_open(const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    rocksdb_checkpoint_t* rocksdb_transactiondb_checkpoint_object_create(rocksdb_transactiondb_t*, char**) @nogc nothrow;
    void rocksdb_transactiondb_close(rocksdb_transactiondb_t*) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_transactiondb_create_iterator_cf(rocksdb_transactiondb_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_transactiondb_create_iterator(rocksdb_transactiondb_t*, const(rocksdb_readoptions_t)*) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_transaction_create_iterator_cf(rocksdb_transaction_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_transaction_create_iterator(rocksdb_transaction_t*, const(rocksdb_readoptions_t)*) @nogc nothrow;
    void rocksdb_transactiondb_delete_cf(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transactiondb_delete(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transaction_delete_cf(rocksdb_transaction_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transaction_delete(rocksdb_transaction_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transactiondb_merge_cf(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transactiondb_merge(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transaction_merge_cf(rocksdb_transaction_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transaction_merge(rocksdb_transaction_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transactiondb_write(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, rocksdb_writebatch_t*, char**) @nogc nothrow;
    void rocksdb_transactiondb_put_cf(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transactiondb_put(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transaction_put_cf(rocksdb_transaction_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_transaction_put(rocksdb_transaction_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    char* rocksdb_transactiondb_get_cf(rocksdb_transactiondb_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_transactiondb_get(rocksdb_transactiondb_t*, const(rocksdb_readoptions_t)*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_transaction_get_for_update_cf(rocksdb_transaction_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, c_ulong*, ubyte, char**) @nogc nothrow;
    char* rocksdb_transaction_get_for_update(rocksdb_transaction_t*, const(rocksdb_readoptions_t)*, const(char)*, c_ulong, c_ulong*, ubyte, char**) @nogc nothrow;
    char* rocksdb_transaction_get_cf(rocksdb_transaction_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_transaction_get(rocksdb_transaction_t*, const(rocksdb_readoptions_t)*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    const(rocksdb_snapshot_t)* rocksdb_transaction_get_snapshot(rocksdb_transaction_t*) @nogc nothrow;
    void rocksdb_transaction_destroy(rocksdb_transaction_t*) @nogc nothrow;
    void rocksdb_transaction_rollback_to_savepoint(rocksdb_transaction_t*, char**) @nogc nothrow;
    void rocksdb_transaction_set_savepoint(rocksdb_transaction_t*) @nogc nothrow;
    void rocksdb_transaction_rollback(rocksdb_transaction_t*, char**) @nogc nothrow;
    void rocksdb_transaction_commit(rocksdb_transaction_t*, char**) @nogc nothrow;
    rocksdb_transaction_t* rocksdb_transaction_begin(rocksdb_transactiondb_t*, const(rocksdb_writeoptions_t)*, const(rocksdb_transaction_options_t)*, rocksdb_transaction_t*) @nogc nothrow;
    void rocksdb_transactiondb_release_snapshot(rocksdb_transactiondb_t*, const(rocksdb_snapshot_t)*) @nogc nothrow;
    const(rocksdb_snapshot_t)* rocksdb_transactiondb_create_snapshot(rocksdb_transactiondb_t*) @nogc nothrow;
    rocksdb_transactiondb_t* rocksdb_transactiondb_open_column_families(const(rocksdb_options_t)*, const(rocksdb_transactiondb_options_t)*, const(char)*, int, const(const(char)*)*, const(const(rocksdb_options_t)*)*, rocksdb_column_family_handle_t**, char**) @nogc nothrow;
    rocksdb_transactiondb_t* rocksdb_transactiondb_open(const(rocksdb_options_t)*, const(rocksdb_transactiondb_options_t)*, const(char)*, char**) @nogc nothrow;
    rocksdb_column_family_handle_t* rocksdb_transactiondb_create_column_family(rocksdb_transactiondb_t*, const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    void rocksdb_delete_file_in_range_cf(rocksdb_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_delete_file_in_range(rocksdb_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_get_options_from_string(const(rocksdb_options_t)*, const(char)*, rocksdb_options_t*, char**) @nogc nothrow;
    void rocksdb_livefiles_destroy(const(rocksdb_livefiles_t)*) @nogc nothrow;
    c_ulong rocksdb_livefiles_deletions(const(rocksdb_livefiles_t)*, int) @nogc nothrow;
    c_ulong rocksdb_livefiles_entries(const(rocksdb_livefiles_t)*, int) @nogc nothrow;
    const(char)* rocksdb_livefiles_largestkey(const(rocksdb_livefiles_t)*, int, c_ulong*) @nogc nothrow;
    const(char)* rocksdb_livefiles_smallestkey(const(rocksdb_livefiles_t)*, int, c_ulong*) @nogc nothrow;
    c_ulong rocksdb_livefiles_size(const(rocksdb_livefiles_t)*, int) @nogc nothrow;
    int rocksdb_livefiles_level(const(rocksdb_livefiles_t)*, int) @nogc nothrow;
    const(char)* rocksdb_livefiles_name(const(rocksdb_livefiles_t)*, int) @nogc nothrow;
    int rocksdb_livefiles_count(const(rocksdb_livefiles_t)*) @nogc nothrow;
    void rocksdb_fifo_compaction_options_destroy(rocksdb_fifo_compaction_options_t*) @nogc nothrow;
    void rocksdb_fifo_compaction_options_set_max_table_files_size(rocksdb_fifo_compaction_options_t*, c_ulong) @nogc nothrow;
    rocksdb_fifo_compaction_options_t* rocksdb_fifo_compaction_options_create() @nogc nothrow;
    void rocksdb_universal_compaction_options_destroy(rocksdb_universal_compaction_options_t*) @nogc nothrow;
    void rocksdb_universal_compaction_options_set_stop_style(rocksdb_universal_compaction_options_t*, int) @nogc nothrow;
    void rocksdb_universal_compaction_options_set_compression_size_percent(rocksdb_universal_compaction_options_t*, int) @nogc nothrow;
    void rocksdb_universal_compaction_options_set_max_size_amplification_percent(rocksdb_universal_compaction_options_t*, int) @nogc nothrow;
    void rocksdb_universal_compaction_options_set_max_merge_width(rocksdb_universal_compaction_options_t*, int) @nogc nothrow;
    void rocksdb_universal_compaction_options_set_min_merge_width(rocksdb_universal_compaction_options_t*, int) @nogc nothrow;
    void rocksdb_universal_compaction_options_set_size_ratio(rocksdb_universal_compaction_options_t*, int) @nogc nothrow;
    rocksdb_universal_compaction_options_t* rocksdb_universal_compaction_options_create() @nogc nothrow;
    enum _Anonymous_0
    {
        rocksdb_similar_size_compaction_stop_style = 0,
        rocksdb_total_size_compaction_stop_style = 1,
    }
    enum rocksdb_similar_size_compaction_stop_style = _Anonymous_0.rocksdb_similar_size_compaction_stop_style;
    enum rocksdb_total_size_compaction_stop_style = _Anonymous_0.rocksdb_total_size_compaction_stop_style;
    void rocksdb_slicetransform_destroy(rocksdb_slicetransform_t*) @nogc nothrow;
    rocksdb_slicetransform_t* rocksdb_slicetransform_create_noop() @nogc nothrow;
    rocksdb_slicetransform_t* rocksdb_slicetransform_create_fixed_prefix(c_ulong) @nogc nothrow;
    rocksdb_slicetransform_t* rocksdb_slicetransform_create(void*, void function(void*), char* function(void*, const(char)*, c_ulong, c_ulong*), ubyte function(void*, const(char)*, c_ulong), ubyte function(void*, const(char)*, c_ulong), const(char)* function(void*)) @nogc nothrow;
    void rocksdb_try_catch_up_with_primary(rocksdb_t*, char**) @nogc nothrow;
    void rocksdb_ingest_external_file_cf(rocksdb_t*, rocksdb_column_family_handle_t*, const(const(char)*)*, const(c_ulong), const(rocksdb_ingestexternalfileoptions_t)*, char**) @nogc nothrow;
    void rocksdb_ingest_external_file(rocksdb_t*, const(const(char)*)*, const(c_ulong), const(rocksdb_ingestexternalfileoptions_t)*, char**) @nogc nothrow;
    void rocksdb_ingestexternalfileoptions_destroy(rocksdb_ingestexternalfileoptions_t*) @nogc nothrow;
    void rocksdb_ingestexternalfileoptions_set_ingest_behind(rocksdb_ingestexternalfileoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_ingestexternalfileoptions_set_allow_blocking_flush(rocksdb_ingestexternalfileoptions_t*, ubyte) @nogc nothrow;
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = c_long;
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    void rocksdb_ingestexternalfileoptions_set_allow_global_seqno(rocksdb_ingestexternalfileoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_ingestexternalfileoptions_set_snapshot_consistency(rocksdb_ingestexternalfileoptions_t*, ubyte) @nogc nothrow;
    alias __u_char = ubyte;
    alias __u_short = ushort;
    alias __u_int = uint;
    alias __u_long = c_ulong;
    alias __int8_t = byte;
    alias __uint8_t = ubyte;
    alias __int16_t = short;
    alias __uint16_t = ushort;
    alias __int32_t = int;
    alias __uint32_t = uint;
    alias __int64_t = c_long;
    alias __uint64_t = c_ulong;
    alias __int_least8_t = byte;
    alias __uint_least8_t = ubyte;
    alias __int_least16_t = short;
    alias __uint_least16_t = ushort;
    alias __int_least32_t = int;
    alias __uint_least32_t = uint;
    alias __int_least64_t = c_long;
    alias __uint_least64_t = c_ulong;
    alias __quad_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;
    void rocksdb_ingestexternalfileoptions_set_move_files(rocksdb_ingestexternalfileoptions_t*, ubyte) @nogc nothrow;
    rocksdb_ingestexternalfileoptions_t* rocksdb_ingestexternalfileoptions_create() @nogc nothrow;
    void rocksdb_sstfilewriter_destroy(rocksdb_sstfilewriter_t*) @nogc nothrow;
    void rocksdb_sstfilewriter_file_size(rocksdb_sstfilewriter_t*, c_ulong*) @nogc nothrow;
    void rocksdb_sstfilewriter_finish(rocksdb_sstfilewriter_t*, char**) @nogc nothrow;
    void rocksdb_sstfilewriter_delete(rocksdb_sstfilewriter_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_sstfilewriter_merge(rocksdb_sstfilewriter_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_sstfilewriter_put(rocksdb_sstfilewriter_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    alias __dev_t = c_ulong;
    alias __uid_t = uint;
    alias __gid_t = uint;
    alias __ino_t = c_ulong;
    alias __ino64_t = c_ulong;
    alias __mode_t = uint;
    alias __nlink_t = c_ulong;
    alias __off_t = c_long;
    alias __off64_t = c_long;
    alias __pid_t = int;
    struct __fsid_t
    {
        int[2] __val;
    }
    alias __clock_t = c_long;
    alias __rlim_t = c_ulong;
    alias __rlim64_t = c_ulong;
    alias __id_t = uint;
    alias __time_t = c_long;
    alias __useconds_t = uint;
    alias __suseconds_t = c_long;
    alias __suseconds64_t = c_long;
    alias __daddr_t = int;
    alias __key_t = int;
    alias __clockid_t = int;
    alias __timer_t = void*;
    alias __blksize_t = c_long;
    alias __blkcnt_t = c_long;
    alias __blkcnt64_t = c_long;
    alias __fsblkcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsfilcnt_t = c_ulong;
    alias __fsfilcnt64_t = c_ulong;
    alias __fsword_t = c_long;
    alias __ssize_t = c_long;
    alias __syscall_slong_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    alias __loff_t = c_long;
    alias __caddr_t = char*;
    alias __intptr_t = c_long;
    alias __socklen_t = uint;
    alias __sig_atomic_t = int;
    void rocksdb_sstfilewriter_add(rocksdb_sstfilewriter_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_sstfilewriter_open(rocksdb_sstfilewriter_t*, const(char)*, char**) @nogc nothrow;
    rocksdb_sstfilewriter_t* rocksdb_sstfilewriter_create_with_comparator(const(rocksdb_envoptions_t)*, const(rocksdb_options_t)*, const(rocksdb_comparator_t)*) @nogc nothrow;
    rocksdb_sstfilewriter_t* rocksdb_sstfilewriter_create(const(rocksdb_envoptions_t)*, const(rocksdb_options_t)*) @nogc nothrow;
    void rocksdb_envoptions_destroy(rocksdb_envoptions_t*) @nogc nothrow;
    rocksdb_envoptions_t* rocksdb_envoptions_create() @nogc nothrow;
    void rocksdb_env_destroy(rocksdb_env_t*) @nogc nothrow;
    void rocksdb_env_lower_high_priority_thread_pool_cpu_priority(rocksdb_env_t*) @nogc nothrow;
    void rocksdb_env_lower_thread_pool_cpu_priority(rocksdb_env_t*) @nogc nothrow;
    void rocksdb_env_lower_high_priority_thread_pool_io_priority(rocksdb_env_t*) @nogc nothrow;
    void rocksdb_env_lower_thread_pool_io_priority(rocksdb_env_t*) @nogc nothrow;
    void rocksdb_env_join_all_threads(rocksdb_env_t*) @nogc nothrow;
    void rocksdb_env_set_high_priority_background_threads(rocksdb_env_t*, int) @nogc nothrow;
    void rocksdb_env_set_background_threads(rocksdb_env_t*, int) @nogc nothrow;
    rocksdb_env_t* rocksdb_create_mem_env() @nogc nothrow;
    rocksdb_env_t* rocksdb_create_default_env() @nogc nothrow;
    void rocksdb_dbpath_destroy(rocksdb_dbpath_t*) @nogc nothrow;
    rocksdb_dbpath_t* rocksdb_dbpath_create(const(char)*, c_ulong) @nogc nothrow;
    c_ulong rocksdb_cache_get_pinned_usage(rocksdb_cache_t*) @nogc nothrow;
    c_ulong rocksdb_cache_get_usage(rocksdb_cache_t*) @nogc nothrow;
    void rocksdb_cache_set_capacity(rocksdb_cache_t*, c_ulong) @nogc nothrow;
    void rocksdb_cache_destroy(rocksdb_cache_t*) @nogc nothrow;
    rocksdb_cache_t* rocksdb_cache_create_lru(c_ulong) @nogc nothrow;
    void rocksdb_flushoptions_set_wait(rocksdb_flushoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_flushoptions_destroy(rocksdb_flushoptions_t*) @nogc nothrow;
    rocksdb_flushoptions_t* rocksdb_flushoptions_create() @nogc nothrow;
    void rocksdb_compactoptions_set_target_level(rocksdb_compactoptions_t*, int) @nogc nothrow;
    void rocksdb_compactoptions_set_change_level(rocksdb_compactoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_compactoptions_set_bottommost_level_compaction(rocksdb_compactoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_compactoptions_set_exclusive_manual_compaction(rocksdb_compactoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_compactoptions_destroy(rocksdb_compactoptions_t*) @nogc nothrow;
    rocksdb_compactoptions_t* rocksdb_compactoptions_create() @nogc nothrow;
    void rocksdb_writeoptions_set_memtable_insert_hint_per_batch(rocksdb_writeoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_writeoptions_set_low_pri(rocksdb_writeoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_writeoptions_set_no_slowdown(rocksdb_writeoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_writeoptions_set_ignore_missing_column_families(rocksdb_writeoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_writeoptions_disable_WAL(rocksdb_writeoptions_t*, int) @nogc nothrow;
    void rocksdb_writeoptions_set_sync(rocksdb_writeoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_writeoptions_destroy(rocksdb_writeoptions_t*) @nogc nothrow;
    rocksdb_writeoptions_t* rocksdb_writeoptions_create() @nogc nothrow;
    void rocksdb_readoptions_set_ignore_range_deletions(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_background_purge_on_iterator_cleanup(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_max_skippable_internal_keys(rocksdb_readoptions_t*, c_ulong) @nogc nothrow;
    void rocksdb_readoptions_set_total_order_seek(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_pin_data(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_prefix_same_as_start(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_readahead_size(rocksdb_readoptions_t*, c_ulong) @nogc nothrow;
    struct rocksdb_t;
    struct rocksdb_backup_engine_t;
    struct rocksdb_backup_engine_info_t;
    struct rocksdb_restore_options_t;
    struct rocksdb_cache_t;
    struct rocksdb_compactionfilter_t;
    struct rocksdb_compactionfiltercontext_t;
    struct rocksdb_compactionfilterfactory_t;
    struct rocksdb_comparator_t;
    struct rocksdb_dbpath_t;
    struct rocksdb_env_t;
    struct rocksdb_fifo_compaction_options_t;
    struct rocksdb_filelock_t;
    struct rocksdb_filterpolicy_t;
    struct rocksdb_flushoptions_t;
    struct rocksdb_iterator_t;
    struct rocksdb_logger_t;
    struct rocksdb_mergeoperator_t;
    struct rocksdb_options_t;
    struct rocksdb_compactoptions_t;
    struct rocksdb_block_based_table_options_t;
    struct rocksdb_cuckoo_table_options_t;
    struct rocksdb_randomfile_t;
    struct rocksdb_readoptions_t;
    struct rocksdb_seqfile_t;
    struct rocksdb_slicetransform_t;
    struct rocksdb_snapshot_t;
    struct rocksdb_writablefile_t;
    struct rocksdb_writebatch_t;
    struct rocksdb_writebatch_wi_t;
    struct rocksdb_writeoptions_t;
    struct rocksdb_universal_compaction_options_t;
    struct rocksdb_livefiles_t;
    struct rocksdb_column_family_handle_t;
    struct rocksdb_envoptions_t;
    struct rocksdb_ingestexternalfileoptions_t;
    struct rocksdb_sstfilewriter_t;
    struct rocksdb_ratelimiter_t;
    struct rocksdb_perfcontext_t;
    struct rocksdb_pinnableslice_t;
    struct rocksdb_transactiondb_options_t;
    struct rocksdb_transactiondb_t;
    struct rocksdb_transaction_options_t;
    struct rocksdb_optimistictransactiondb_t;
    struct rocksdb_optimistictransaction_options_t;
    struct rocksdb_transaction_t;
    struct rocksdb_checkpoint_t;
    struct rocksdb_wal_iterator_t;
    struct rocksdb_wal_readoptions_t;
    struct rocksdb_memory_consumers_t;
    struct rocksdb_memory_usage_t;
    rocksdb_t* rocksdb_open(const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    rocksdb_t* rocksdb_open_with_ttl(const(rocksdb_options_t)*, const(char)*, int, char**) @nogc nothrow;
    rocksdb_t* rocksdb_open_for_read_only(const(rocksdb_options_t)*, const(char)*, ubyte, char**) @nogc nothrow;
    rocksdb_t* rocksdb_open_as_secondary(const(rocksdb_options_t)*, const(char)*, const(char)*, char**) @nogc nothrow;
    rocksdb_backup_engine_t* rocksdb_backup_engine_open(const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    void rocksdb_backup_engine_create_new_backup(rocksdb_backup_engine_t*, rocksdb_t*, char**) @nogc nothrow;
    void rocksdb_backup_engine_create_new_backup_flush(rocksdb_backup_engine_t*, rocksdb_t*, ubyte, char**) @nogc nothrow;
    void rocksdb_backup_engine_purge_old_backups(rocksdb_backup_engine_t*, uint, char**) @nogc nothrow;
    rocksdb_restore_options_t* rocksdb_restore_options_create() @nogc nothrow;
    void rocksdb_restore_options_destroy(rocksdb_restore_options_t*) @nogc nothrow;
    void rocksdb_restore_options_set_keep_log_files(rocksdb_restore_options_t*, int) @nogc nothrow;
    void rocksdb_backup_engine_verify_backup(rocksdb_backup_engine_t*, uint, char**) @nogc nothrow;
    void rocksdb_backup_engine_restore_db_from_latest_backup(rocksdb_backup_engine_t*, const(char)*, const(char)*, const(rocksdb_restore_options_t)*, char**) @nogc nothrow;
    const(rocksdb_backup_engine_info_t)* rocksdb_backup_engine_get_backup_info(rocksdb_backup_engine_t*) @nogc nothrow;
    int rocksdb_backup_engine_info_count(const(rocksdb_backup_engine_info_t)*) @nogc nothrow;
    c_long rocksdb_backup_engine_info_timestamp(const(rocksdb_backup_engine_info_t)*, int) @nogc nothrow;
    uint rocksdb_backup_engine_info_backup_id(const(rocksdb_backup_engine_info_t)*, int) @nogc nothrow;
    c_ulong rocksdb_backup_engine_info_size(const(rocksdb_backup_engine_info_t)*, int) @nogc nothrow;
    uint rocksdb_backup_engine_info_number_files(const(rocksdb_backup_engine_info_t)*, int) @nogc nothrow;
    void rocksdb_backup_engine_info_destroy(const(rocksdb_backup_engine_info_t)*) @nogc nothrow;
    void rocksdb_backup_engine_close(rocksdb_backup_engine_t*) @nogc nothrow;
    rocksdb_checkpoint_t* rocksdb_checkpoint_object_create(rocksdb_t*, char**) @nogc nothrow;
    void rocksdb_checkpoint_create(rocksdb_checkpoint_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_checkpoint_object_destroy(rocksdb_checkpoint_t*) @nogc nothrow;
    rocksdb_t* rocksdb_open_column_families(const(rocksdb_options_t)*, const(char)*, int, const(const(char)*)*, const(const(rocksdb_options_t)*)*, rocksdb_column_family_handle_t**, char**) @nogc nothrow;
    rocksdb_t* rocksdb_open_for_read_only_column_families(const(rocksdb_options_t)*, const(char)*, int, const(const(char)*)*, const(const(rocksdb_options_t)*)*, rocksdb_column_family_handle_t**, ubyte, char**) @nogc nothrow;
    rocksdb_t* rocksdb_open_as_secondary_column_families(const(rocksdb_options_t)*, const(char)*, const(char)*, int, const(const(char)*)*, const(const(rocksdb_options_t)*)*, rocksdb_column_family_handle_t**, char**) @nogc nothrow;
    char** rocksdb_list_column_families(const(rocksdb_options_t)*, const(char)*, c_ulong*, char**) @nogc nothrow;
    void rocksdb_list_column_families_destroy(char**, c_ulong) @nogc nothrow;
    rocksdb_column_family_handle_t* rocksdb_create_column_family(rocksdb_t*, const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    void rocksdb_drop_column_family(rocksdb_t*, rocksdb_column_family_handle_t*, char**) @nogc nothrow;
    void rocksdb_column_family_handle_destroy(rocksdb_column_family_handle_t*) @nogc nothrow;
    void rocksdb_close(rocksdb_t*) @nogc nothrow;
    void rocksdb_put(rocksdb_t*, const(rocksdb_writeoptions_t)*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_put_cf(rocksdb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_delete(rocksdb_t*, const(rocksdb_writeoptions_t)*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_delete_cf(rocksdb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_delete_range_cf(rocksdb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_merge(rocksdb_t*, const(rocksdb_writeoptions_t)*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_merge_cf(rocksdb_t*, const(rocksdb_writeoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong, char**) @nogc nothrow;
    void rocksdb_write(rocksdb_t*, const(rocksdb_writeoptions_t)*, rocksdb_writebatch_t*, char**) @nogc nothrow;
    char* rocksdb_get(rocksdb_t*, const(rocksdb_readoptions_t)*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_get_cf(rocksdb_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    void rocksdb_multi_get(rocksdb_t*, const(rocksdb_readoptions_t)*, c_ulong, const(const(char)*)*, const(c_ulong)*, char**, c_ulong*, char**) @nogc nothrow;
    void rocksdb_multi_get_cf(rocksdb_t*, const(rocksdb_readoptions_t)*, const(const(rocksdb_column_family_handle_t)*)*, c_ulong, const(const(char)*)*, const(c_ulong)*, char**, c_ulong*, char**) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_create_iterator(rocksdb_t*, const(rocksdb_readoptions_t)*) @nogc nothrow;
    rocksdb_wal_iterator_t* rocksdb_get_updates_since(rocksdb_t*, c_ulong, const(rocksdb_wal_readoptions_t)*, char**) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_create_iterator_cf(rocksdb_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*) @nogc nothrow;
    void rocksdb_create_iterators(rocksdb_t*, rocksdb_readoptions_t*, rocksdb_column_family_handle_t**, rocksdb_iterator_t**, c_ulong, char**) @nogc nothrow;
    const(rocksdb_snapshot_t)* rocksdb_create_snapshot(rocksdb_t*) @nogc nothrow;
    void rocksdb_release_snapshot(rocksdb_t*, const(rocksdb_snapshot_t)*) @nogc nothrow;
    char* rocksdb_property_value(rocksdb_t*, const(char)*) @nogc nothrow;
    int rocksdb_property_int(rocksdb_t*, const(char)*, c_ulong*) @nogc nothrow;
    int rocksdb_property_int_cf(rocksdb_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong*) @nogc nothrow;
    char* rocksdb_property_value_cf(rocksdb_t*, rocksdb_column_family_handle_t*, const(char)*) @nogc nothrow;
    void rocksdb_approximate_sizes(rocksdb_t*, int, const(const(char)*)*, const(c_ulong)*, const(const(char)*)*, const(c_ulong)*, c_ulong*) @nogc nothrow;
    void rocksdb_approximate_sizes_cf(rocksdb_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, const(const(char)*)*, const(c_ulong)*, c_ulong*) @nogc nothrow;
    void rocksdb_compact_range(rocksdb_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_compact_range_cf(rocksdb_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_compact_range_opt(rocksdb_t*, rocksdb_compactoptions_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_compact_range_cf_opt(rocksdb_t*, rocksdb_column_family_handle_t*, rocksdb_compactoptions_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_delete_file(rocksdb_t*, const(char)*) @nogc nothrow;
    const(rocksdb_livefiles_t)* rocksdb_livefiles(rocksdb_t*) @nogc nothrow;
    void rocksdb_flush(rocksdb_t*, const(rocksdb_flushoptions_t)*, char**) @nogc nothrow;
    void rocksdb_flush_cf(rocksdb_t*, const(rocksdb_flushoptions_t)*, rocksdb_column_family_handle_t*, char**) @nogc nothrow;
    void rocksdb_disable_file_deletions(rocksdb_t*, char**) @nogc nothrow;
    void rocksdb_enable_file_deletions(rocksdb_t*, ubyte, char**) @nogc nothrow;
    void rocksdb_destroy_db(const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    void rocksdb_repair_db(const(rocksdb_options_t)*, const(char)*, char**) @nogc nothrow;
    void rocksdb_iter_destroy(rocksdb_iterator_t*) @nogc nothrow;
    ubyte rocksdb_iter_valid(const(rocksdb_iterator_t)*) @nogc nothrow;
    void rocksdb_iter_seek_to_first(rocksdb_iterator_t*) @nogc nothrow;
    void rocksdb_iter_seek_to_last(rocksdb_iterator_t*) @nogc nothrow;
    void rocksdb_iter_seek(rocksdb_iterator_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_iter_seek_for_prev(rocksdb_iterator_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_iter_next(rocksdb_iterator_t*) @nogc nothrow;
    void rocksdb_iter_prev(rocksdb_iterator_t*) @nogc nothrow;
    const(char)* rocksdb_iter_key(const(rocksdb_iterator_t)*, c_ulong*) @nogc nothrow;
    const(char)* rocksdb_iter_value(const(rocksdb_iterator_t)*, c_ulong*) @nogc nothrow;
    void rocksdb_iter_get_error(const(rocksdb_iterator_t)*, char**) @nogc nothrow;
    void rocksdb_wal_iter_next(rocksdb_wal_iterator_t*) @nogc nothrow;
    ubyte rocksdb_wal_iter_valid(const(rocksdb_wal_iterator_t)*) @nogc nothrow;
    void rocksdb_wal_iter_status(const(rocksdb_wal_iterator_t)*, char**) @nogc nothrow;
    rocksdb_writebatch_t* rocksdb_wal_iter_get_batch(const(rocksdb_wal_iterator_t)*, c_ulong*) @nogc nothrow;
    c_ulong rocksdb_get_latest_sequence_number(rocksdb_t*) @nogc nothrow;
    void rocksdb_wal_iter_destroy(const(rocksdb_wal_iterator_t)*) @nogc nothrow;
    rocksdb_writebatch_t* rocksdb_writebatch_create() @nogc nothrow;
    rocksdb_writebatch_t* rocksdb_writebatch_create_from(const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_destroy(rocksdb_writebatch_t*) @nogc nothrow;
    void rocksdb_writebatch_clear(rocksdb_writebatch_t*) @nogc nothrow;
    int rocksdb_writebatch_count(rocksdb_writebatch_t*) @nogc nothrow;
    void rocksdb_writebatch_put(rocksdb_writebatch_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_put_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_putv(rocksdb_writebatch_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_putv_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_merge(rocksdb_writebatch_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_merge_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_mergev(rocksdb_writebatch_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_mergev_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_delete(rocksdb_writebatch_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_delete_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_deletev(rocksdb_writebatch_t*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_deletev_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_delete_range(rocksdb_writebatch_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_delete_range_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_delete_rangev(rocksdb_writebatch_t*, int, const(const(char)*)*, const(c_ulong)*, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_delete_rangev_cf(rocksdb_writebatch_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_put_log_data(rocksdb_writebatch_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_iterate(rocksdb_writebatch_t*, void*, void function(void*, const(char)*, c_ulong, const(char)*, c_ulong), void function(void*, const(char)*, c_ulong)) @nogc nothrow;
    const(char)* rocksdb_writebatch_data(rocksdb_writebatch_t*, c_ulong*) @nogc nothrow;
    void rocksdb_writebatch_set_save_point(rocksdb_writebatch_t*) @nogc nothrow;
    void rocksdb_writebatch_rollback_to_save_point(rocksdb_writebatch_t*, char**) @nogc nothrow;
    void rocksdb_writebatch_pop_save_point(rocksdb_writebatch_t*, char**) @nogc nothrow;
    rocksdb_writebatch_wi_t* rocksdb_writebatch_wi_create(c_ulong, ubyte) @nogc nothrow;
    rocksdb_writebatch_wi_t* rocksdb_writebatch_wi_create_from(const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_destroy(rocksdb_writebatch_wi_t*) @nogc nothrow;
    void rocksdb_writebatch_wi_clear(rocksdb_writebatch_wi_t*) @nogc nothrow;
    int rocksdb_writebatch_wi_count(rocksdb_writebatch_wi_t*) @nogc nothrow;
    void rocksdb_writebatch_wi_put(rocksdb_writebatch_wi_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_put_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_putv(rocksdb_writebatch_wi_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_putv_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_merge(rocksdb_writebatch_wi_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_merge_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_mergev(rocksdb_writebatch_wi_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_mergev_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_delete(rocksdb_writebatch_wi_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_delete_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_deletev(rocksdb_writebatch_wi_t*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_deletev_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_delete_range(rocksdb_writebatch_wi_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_delete_range_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_delete_rangev(rocksdb_writebatch_wi_t*, int, const(const(char)*)*, const(c_ulong)*, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_delete_rangev_cf(rocksdb_writebatch_wi_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(c_ulong)*, const(const(char)*)*, const(c_ulong)*) @nogc nothrow;
    void rocksdb_writebatch_wi_put_log_data(rocksdb_writebatch_wi_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_writebatch_wi_iterate(rocksdb_writebatch_wi_t*, void*, void function(void*, const(char)*, c_ulong, const(char)*, c_ulong), void function(void*, const(char)*, c_ulong)) @nogc nothrow;
    const(char)* rocksdb_writebatch_wi_data(rocksdb_writebatch_wi_t*, c_ulong*) @nogc nothrow;
    void rocksdb_writebatch_wi_set_save_point(rocksdb_writebatch_wi_t*) @nogc nothrow;
    void rocksdb_writebatch_wi_rollback_to_save_point(rocksdb_writebatch_wi_t*, char**) @nogc nothrow;
    char* rocksdb_writebatch_wi_get_from_batch(rocksdb_writebatch_wi_t*, const(rocksdb_options_t)*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_writebatch_wi_get_from_batch_cf(rocksdb_writebatch_wi_t*, const(rocksdb_options_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_writebatch_wi_get_from_batch_and_db(rocksdb_writebatch_wi_t*, rocksdb_t*, const(rocksdb_readoptions_t)*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    char* rocksdb_writebatch_wi_get_from_batch_and_db_cf(rocksdb_writebatch_wi_t*, rocksdb_t*, const(rocksdb_readoptions_t)*, rocksdb_column_family_handle_t*, const(char)*, c_ulong, c_ulong*, char**) @nogc nothrow;
    void rocksdb_write_writebatch_wi(rocksdb_t*, const(rocksdb_writeoptions_t)*, rocksdb_writebatch_wi_t*, char**) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_writebatch_wi_create_iterator_with_base(rocksdb_writebatch_wi_t*, rocksdb_iterator_t*) @nogc nothrow;
    rocksdb_iterator_t* rocksdb_writebatch_wi_create_iterator_with_base_cf(rocksdb_writebatch_wi_t*, rocksdb_iterator_t*, rocksdb_column_family_handle_t*) @nogc nothrow;
    rocksdb_block_based_table_options_t* rocksdb_block_based_options_create() @nogc nothrow;
    void rocksdb_block_based_options_destroy(rocksdb_block_based_table_options_t*) @nogc nothrow;
    void rocksdb_block_based_options_set_block_size(rocksdb_block_based_table_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_block_based_options_set_block_size_deviation(rocksdb_block_based_table_options_t*, int) @nogc nothrow;
    void rocksdb_block_based_options_set_block_restart_interval(rocksdb_block_based_table_options_t*, int) @nogc nothrow;
    void rocksdb_block_based_options_set_index_block_restart_interval(rocksdb_block_based_table_options_t*, int) @nogc nothrow;
    void rocksdb_block_based_options_set_metadata_block_size(rocksdb_block_based_table_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_block_based_options_set_partition_filters(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_use_delta_encoding(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_filter_policy(rocksdb_block_based_table_options_t*, rocksdb_filterpolicy_t*) @nogc nothrow;
    void rocksdb_block_based_options_set_no_block_cache(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_block_cache(rocksdb_block_based_table_options_t*, rocksdb_cache_t*) @nogc nothrow;
    void rocksdb_block_based_options_set_block_cache_compressed(rocksdb_block_based_table_options_t*, rocksdb_cache_t*) @nogc nothrow;
    void rocksdb_block_based_options_set_whole_key_filtering(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_format_version(rocksdb_block_based_table_options_t*, int) @nogc nothrow;
    enum _Anonymous_1
    {
        rocksdb_block_based_table_index_type_binary_search = 0,
        rocksdb_block_based_table_index_type_hash_search = 1,
        rocksdb_block_based_table_index_type_two_level_index_search = 2,
    }
    enum rocksdb_block_based_table_index_type_binary_search = _Anonymous_1.rocksdb_block_based_table_index_type_binary_search;
    enum rocksdb_block_based_table_index_type_hash_search = _Anonymous_1.rocksdb_block_based_table_index_type_hash_search;
    enum rocksdb_block_based_table_index_type_two_level_index_search = _Anonymous_1.rocksdb_block_based_table_index_type_two_level_index_search;
    void rocksdb_block_based_options_set_index_type(rocksdb_block_based_table_options_t*, int) @nogc nothrow;
    enum _Anonymous_2
    {
        rocksdb_block_based_table_data_block_index_type_binary_search = 0,
        rocksdb_block_based_table_data_block_index_type_binary_search_and_hash = 1,
    }
    enum rocksdb_block_based_table_data_block_index_type_binary_search = _Anonymous_2.rocksdb_block_based_table_data_block_index_type_binary_search;
    enum rocksdb_block_based_table_data_block_index_type_binary_search_and_hash = _Anonymous_2.rocksdb_block_based_table_data_block_index_type_binary_search_and_hash;
    void rocksdb_block_based_options_set_data_block_index_type(rocksdb_block_based_table_options_t*, int) @nogc nothrow;
    void rocksdb_block_based_options_set_data_block_hash_ratio(rocksdb_block_based_table_options_t*, double) @nogc nothrow;
    void rocksdb_block_based_options_set_hash_index_allow_collision(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_cache_index_and_filter_blocks(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_cache_index_and_filter_blocks_with_high_priority(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_pin_l0_filter_and_index_blocks_in_cache(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_block_based_options_set_pin_top_level_index_and_filter(rocksdb_block_based_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_block_based_table_factory(rocksdb_options_t*, rocksdb_block_based_table_options_t*) @nogc nothrow;
    rocksdb_cuckoo_table_options_t* rocksdb_cuckoo_options_create() @nogc nothrow;
    void rocksdb_cuckoo_options_destroy(rocksdb_cuckoo_table_options_t*) @nogc nothrow;
    void rocksdb_cuckoo_options_set_hash_ratio(rocksdb_cuckoo_table_options_t*, double) @nogc nothrow;
    void rocksdb_cuckoo_options_set_max_search_depth(rocksdb_cuckoo_table_options_t*, uint) @nogc nothrow;
    void rocksdb_cuckoo_options_set_cuckoo_block_size(rocksdb_cuckoo_table_options_t*, uint) @nogc nothrow;
    void rocksdb_cuckoo_options_set_identity_as_first_hash(rocksdb_cuckoo_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_cuckoo_options_set_use_module_hash(rocksdb_cuckoo_table_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_cuckoo_table_factory(rocksdb_options_t*, rocksdb_cuckoo_table_options_t*) @nogc nothrow;
    void rocksdb_set_options(rocksdb_t*, int, const(const(char)*)*, const(const(char)*)*, char**) @nogc nothrow;
    void rocksdb_set_options_cf(rocksdb_t*, rocksdb_column_family_handle_t*, int, const(const(char)*)*, const(const(char)*)*, char**) @nogc nothrow;
    rocksdb_options_t* rocksdb_options_create() @nogc nothrow;
    void rocksdb_options_destroy(rocksdb_options_t*) @nogc nothrow;
    void rocksdb_options_increase_parallelism(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_optimize_for_point_lookup(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_optimize_level_style_compaction(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_optimize_universal_style_compaction(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_allow_ingest_behind(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_compaction_filter(rocksdb_options_t*, rocksdb_compactionfilter_t*) @nogc nothrow;
    void rocksdb_options_set_compaction_filter_factory(rocksdb_options_t*, rocksdb_compactionfilterfactory_t*) @nogc nothrow;
    void rocksdb_options_compaction_readahead_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_comparator(rocksdb_options_t*, rocksdb_comparator_t*) @nogc nothrow;
    void rocksdb_options_set_merge_operator(rocksdb_options_t*, rocksdb_mergeoperator_t*) @nogc nothrow;
    void rocksdb_options_set_uint64add_merge_operator(rocksdb_options_t*) @nogc nothrow;
    void rocksdb_options_set_compression_per_level(rocksdb_options_t*, int*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_create_if_missing(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_create_missing_column_families(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_error_if_exists(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_paranoid_checks(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_db_paths(rocksdb_options_t*, const(rocksdb_dbpath_t)**, c_ulong) @nogc nothrow;
    void rocksdb_options_set_env(rocksdb_options_t*, rocksdb_env_t*) @nogc nothrow;
    void rocksdb_options_set_info_log(rocksdb_options_t*, rocksdb_logger_t*) @nogc nothrow;
    void rocksdb_options_set_info_log_level(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_write_buffer_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_db_write_buffer_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_max_open_files(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_file_opening_threads(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_total_wal_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_compression_options(rocksdb_options_t*, int, int, int, int) @nogc nothrow;
    void rocksdb_options_set_prefix_extractor(rocksdb_options_t*, rocksdb_slicetransform_t*) @nogc nothrow;
    void rocksdb_options_set_num_levels(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_level0_file_num_compaction_trigger(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_level0_slowdown_writes_trigger(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_level0_stop_writes_trigger(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_mem_compaction_level(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_target_file_size_base(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_target_file_size_multiplier(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_bytes_for_level_base(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_level_compaction_dynamic_level_bytes(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_max_bytes_for_level_multiplier(rocksdb_options_t*, double) @nogc nothrow;
    void rocksdb_options_set_max_bytes_for_level_multiplier_additional(rocksdb_options_t*, int*, c_ulong) @nogc nothrow;
    void rocksdb_options_enable_statistics(rocksdb_options_t*) @nogc nothrow;
    void rocksdb_options_set_skip_stats_update_on_db_open(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_skip_checking_sst_file_sizes_on_db_open(rocksdb_options_t*, ubyte) @nogc nothrow;
    char* rocksdb_options_statistics_get_string(rocksdb_options_t*) @nogc nothrow;
    void rocksdb_options_set_max_write_buffer_number(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_min_write_buffer_number_to_merge(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_write_buffer_number_to_maintain(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_write_buffer_size_to_maintain(rocksdb_options_t*, c_long) @nogc nothrow;
    void rocksdb_options_set_enable_pipelined_write(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_unordered_write(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_max_subcompactions(rocksdb_options_t*, uint) @nogc nothrow;
    void rocksdb_options_set_max_background_jobs(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_background_compactions(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_base_background_compactions(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_background_flushes(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_max_log_file_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_log_file_time_to_roll(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_keep_log_file_num(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_recycle_log_file_num(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_soft_rate_limit(rocksdb_options_t*, double) @nogc nothrow;
    void rocksdb_options_set_hard_rate_limit(rocksdb_options_t*, double) @nogc nothrow;
    void rocksdb_options_set_soft_pending_compaction_bytes_limit(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_hard_pending_compaction_bytes_limit(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_rate_limit_delay_max_milliseconds(rocksdb_options_t*, uint) @nogc nothrow;
    void rocksdb_options_set_max_manifest_file_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_table_cache_numshardbits(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_table_cache_remove_scan_count_limit(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_arena_block_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_use_fsync(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_db_log_dir(rocksdb_options_t*, const(char)*) @nogc nothrow;
    void rocksdb_options_set_wal_dir(rocksdb_options_t*, const(char)*) @nogc nothrow;
    void rocksdb_options_set_WAL_ttl_seconds(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_WAL_size_limit_MB(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_manifest_preallocation_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_purge_redundant_kvs_while_flush(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_allow_mmap_reads(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_allow_mmap_writes(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_use_direct_reads(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_use_direct_io_for_flush_and_compaction(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_is_fd_close_on_exec(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_skip_log_error_on_recovery(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_stats_dump_period_sec(rocksdb_options_t*, uint) @nogc nothrow;
    void rocksdb_options_set_advise_random_on_open(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_access_hint_on_compaction_start(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_use_adaptive_mutex(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_bytes_per_sync(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_wal_bytes_per_sync(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_writable_file_max_buffer_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_allow_concurrent_memtable_write(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_enable_write_thread_adaptive_yield(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_max_sequential_skip_in_iterations(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_disable_auto_compactions(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_optimize_filters_for_hits(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_delete_obsolete_files_period_micros(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_prepare_for_bulk_load(rocksdb_options_t*) @nogc nothrow;
    void rocksdb_options_set_memtable_vector_rep(rocksdb_options_t*) @nogc nothrow;
    void rocksdb_options_set_memtable_prefix_bloom_size_ratio(rocksdb_options_t*, double) @nogc nothrow;
    void rocksdb_options_set_max_compaction_bytes(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_hash_skip_list_rep(rocksdb_options_t*, c_ulong, int, int) @nogc nothrow;
    void rocksdb_options_set_hash_link_list_rep(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_plain_table_factory(rocksdb_options_t*, uint, int, double, c_ulong) @nogc nothrow;
    void rocksdb_options_set_min_level_to_compress(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_memtable_huge_page_size(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_max_successive_merges(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_bloom_locality(rocksdb_options_t*, uint) @nogc nothrow;
    void rocksdb_options_set_inplace_update_support(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_inplace_update_num_locks(rocksdb_options_t*, c_ulong) @nogc nothrow;
    void rocksdb_options_set_report_bg_io_stats(rocksdb_options_t*, int) @nogc nothrow;
    enum _Anonymous_3
    {
        rocksdb_tolerate_corrupted_tail_records_recovery = 0,
        rocksdb_absolute_consistency_recovery = 1,
        rocksdb_point_in_time_recovery = 2,
        rocksdb_skip_any_corrupted_records_recovery = 3,
    }
    enum rocksdb_tolerate_corrupted_tail_records_recovery = _Anonymous_3.rocksdb_tolerate_corrupted_tail_records_recovery;
    enum rocksdb_absolute_consistency_recovery = _Anonymous_3.rocksdb_absolute_consistency_recovery;
    enum rocksdb_point_in_time_recovery = _Anonymous_3.rocksdb_point_in_time_recovery;
    enum rocksdb_skip_any_corrupted_records_recovery = _Anonymous_3.rocksdb_skip_any_corrupted_records_recovery;
    void rocksdb_options_set_wal_recovery_mode(rocksdb_options_t*, int) @nogc nothrow;
    enum _Anonymous_4
    {
        rocksdb_no_compression = 0,
        rocksdb_snappy_compression = 1,
        rocksdb_zlib_compression = 2,
        rocksdb_bz2_compression = 3,
        rocksdb_lz4_compression = 4,
        rocksdb_lz4hc_compression = 5,
        rocksdb_xpress_compression = 6,
        rocksdb_zstd_compression = 7,
    }
    enum rocksdb_no_compression = _Anonymous_4.rocksdb_no_compression;
    enum rocksdb_snappy_compression = _Anonymous_4.rocksdb_snappy_compression;
    enum rocksdb_zlib_compression = _Anonymous_4.rocksdb_zlib_compression;
    enum rocksdb_bz2_compression = _Anonymous_4.rocksdb_bz2_compression;
    enum rocksdb_lz4_compression = _Anonymous_4.rocksdb_lz4_compression;
    enum rocksdb_lz4hc_compression = _Anonymous_4.rocksdb_lz4hc_compression;
    enum rocksdb_xpress_compression = _Anonymous_4.rocksdb_xpress_compression;
    enum rocksdb_zstd_compression = _Anonymous_4.rocksdb_zstd_compression;
    void rocksdb_options_set_compression(rocksdb_options_t*, int) @nogc nothrow;
    enum _Anonymous_5
    {
        rocksdb_level_compaction = 0,
        rocksdb_universal_compaction = 1,
        rocksdb_fifo_compaction = 2,
    }
    enum rocksdb_level_compaction = _Anonymous_5.rocksdb_level_compaction;
    enum rocksdb_universal_compaction = _Anonymous_5.rocksdb_universal_compaction;
    enum rocksdb_fifo_compaction = _Anonymous_5.rocksdb_fifo_compaction;
    void rocksdb_options_set_compaction_style(rocksdb_options_t*, int) @nogc nothrow;
    void rocksdb_options_set_universal_compaction_options(rocksdb_options_t*, rocksdb_universal_compaction_options_t*) @nogc nothrow;
    void rocksdb_options_set_fifo_compaction_options(rocksdb_options_t*, rocksdb_fifo_compaction_options_t*) @nogc nothrow;
    void rocksdb_options_set_ratelimiter(rocksdb_options_t*, rocksdb_ratelimiter_t*) @nogc nothrow;
    void rocksdb_options_set_atomic_flush(rocksdb_options_t*, ubyte) @nogc nothrow;
    void rocksdb_options_set_row_cache(rocksdb_options_t*, rocksdb_cache_t*) @nogc nothrow;
    rocksdb_ratelimiter_t* rocksdb_ratelimiter_create(c_long, c_long, int) @nogc nothrow;
    void rocksdb_ratelimiter_destroy(rocksdb_ratelimiter_t*) @nogc nothrow;
    enum _Anonymous_6
    {
        rocksdb_uninitialized = 0,
        rocksdb_disable = 1,
        rocksdb_enable_count = 2,
        rocksdb_enable_time_except_for_mutex = 3,
        rocksdb_enable_time = 4,
        rocksdb_out_of_bounds = 5,
    }
    enum rocksdb_uninitialized = _Anonymous_6.rocksdb_uninitialized;
    enum rocksdb_disable = _Anonymous_6.rocksdb_disable;
    enum rocksdb_enable_count = _Anonymous_6.rocksdb_enable_count;
    enum rocksdb_enable_time_except_for_mutex = _Anonymous_6.rocksdb_enable_time_except_for_mutex;
    enum rocksdb_enable_time = _Anonymous_6.rocksdb_enable_time;
    enum rocksdb_out_of_bounds = _Anonymous_6.rocksdb_out_of_bounds;
    enum _Anonymous_7
    {
        rocksdb_user_key_comparison_count = 0,
        rocksdb_block_cache_hit_count = 1,
        rocksdb_block_read_count = 2,
        rocksdb_block_read_byte = 3,
        rocksdb_block_read_time = 4,
        rocksdb_block_checksum_time = 5,
        rocksdb_block_decompress_time = 6,
        rocksdb_get_read_bytes = 7,
        rocksdb_multiget_read_bytes = 8,
        rocksdb_iter_read_bytes = 9,
        rocksdb_internal_key_skipped_count = 10,
        rocksdb_internal_delete_skipped_count = 11,
        rocksdb_internal_recent_skipped_count = 12,
        rocksdb_internal_merge_count = 13,
        rocksdb_get_snapshot_time = 14,
        rocksdb_get_from_memtable_time = 15,
        rocksdb_get_from_memtable_count = 16,
        rocksdb_get_post_process_time = 17,
        rocksdb_get_from_output_files_time = 18,
        rocksdb_seek_on_memtable_time = 19,
        rocksdb_seek_on_memtable_count = 20,
        rocksdb_next_on_memtable_count = 21,
        rocksdb_prev_on_memtable_count = 22,
        rocksdb_seek_child_seek_time = 23,
        rocksdb_seek_child_seek_count = 24,
        rocksdb_seek_min_heap_time = 25,
        rocksdb_seek_max_heap_time = 26,
        rocksdb_seek_internal_seek_time = 27,
        rocksdb_find_next_user_entry_time = 28,
        rocksdb_write_wal_time = 29,
        rocksdb_write_memtable_time = 30,
        rocksdb_write_delay_time = 31,
        rocksdb_write_pre_and_post_process_time = 32,
        rocksdb_db_mutex_lock_nanos = 33,
        rocksdb_db_condition_wait_nanos = 34,
        rocksdb_merge_operator_time_nanos = 35,
        rocksdb_read_index_block_nanos = 36,
        rocksdb_read_filter_block_nanos = 37,
        rocksdb_new_table_block_iter_nanos = 38,
        rocksdb_new_table_iterator_nanos = 39,
        rocksdb_block_seek_nanos = 40,
        rocksdb_find_table_nanos = 41,
        rocksdb_bloom_memtable_hit_count = 42,
        rocksdb_bloom_memtable_miss_count = 43,
        rocksdb_bloom_sst_hit_count = 44,
        rocksdb_bloom_sst_miss_count = 45,
        rocksdb_key_lock_wait_time = 46,
        rocksdb_key_lock_wait_count = 47,
        rocksdb_env_new_sequential_file_nanos = 48,
        rocksdb_env_new_random_access_file_nanos = 49,
        rocksdb_env_new_writable_file_nanos = 50,
        rocksdb_env_reuse_writable_file_nanos = 51,
        rocksdb_env_new_random_rw_file_nanos = 52,
        rocksdb_env_new_directory_nanos = 53,
        rocksdb_env_file_exists_nanos = 54,
        rocksdb_env_get_children_nanos = 55,
        rocksdb_env_get_children_file_attributes_nanos = 56,
        rocksdb_env_delete_file_nanos = 57,
        rocksdb_env_create_dir_nanos = 58,
        rocksdb_env_create_dir_if_missing_nanos = 59,
        rocksdb_env_delete_dir_nanos = 60,
        rocksdb_env_get_file_size_nanos = 61,
        rocksdb_env_get_file_modification_time_nanos = 62,
        rocksdb_env_rename_file_nanos = 63,
        rocksdb_env_link_file_nanos = 64,
        rocksdb_env_lock_file_nanos = 65,
        rocksdb_env_unlock_file_nanos = 66,
        rocksdb_env_new_logger_nanos = 67,
        rocksdb_total_metric_count = 68,
    }
    enum rocksdb_user_key_comparison_count = _Anonymous_7.rocksdb_user_key_comparison_count;
    enum rocksdb_block_cache_hit_count = _Anonymous_7.rocksdb_block_cache_hit_count;
    enum rocksdb_block_read_count = _Anonymous_7.rocksdb_block_read_count;
    enum rocksdb_block_read_byte = _Anonymous_7.rocksdb_block_read_byte;
    enum rocksdb_block_read_time = _Anonymous_7.rocksdb_block_read_time;
    enum rocksdb_block_checksum_time = _Anonymous_7.rocksdb_block_checksum_time;
    enum rocksdb_block_decompress_time = _Anonymous_7.rocksdb_block_decompress_time;
    enum rocksdb_get_read_bytes = _Anonymous_7.rocksdb_get_read_bytes;
    enum rocksdb_multiget_read_bytes = _Anonymous_7.rocksdb_multiget_read_bytes;
    enum rocksdb_iter_read_bytes = _Anonymous_7.rocksdb_iter_read_bytes;
    enum rocksdb_internal_key_skipped_count = _Anonymous_7.rocksdb_internal_key_skipped_count;
    enum rocksdb_internal_delete_skipped_count = _Anonymous_7.rocksdb_internal_delete_skipped_count;
    enum rocksdb_internal_recent_skipped_count = _Anonymous_7.rocksdb_internal_recent_skipped_count;
    enum rocksdb_internal_merge_count = _Anonymous_7.rocksdb_internal_merge_count;
    enum rocksdb_get_snapshot_time = _Anonymous_7.rocksdb_get_snapshot_time;
    enum rocksdb_get_from_memtable_time = _Anonymous_7.rocksdb_get_from_memtable_time;
    enum rocksdb_get_from_memtable_count = _Anonymous_7.rocksdb_get_from_memtable_count;
    enum rocksdb_get_post_process_time = _Anonymous_7.rocksdb_get_post_process_time;
    enum rocksdb_get_from_output_files_time = _Anonymous_7.rocksdb_get_from_output_files_time;
    enum rocksdb_seek_on_memtable_time = _Anonymous_7.rocksdb_seek_on_memtable_time;
    enum rocksdb_seek_on_memtable_count = _Anonymous_7.rocksdb_seek_on_memtable_count;
    enum rocksdb_next_on_memtable_count = _Anonymous_7.rocksdb_next_on_memtable_count;
    enum rocksdb_prev_on_memtable_count = _Anonymous_7.rocksdb_prev_on_memtable_count;
    enum rocksdb_seek_child_seek_time = _Anonymous_7.rocksdb_seek_child_seek_time;
    enum rocksdb_seek_child_seek_count = _Anonymous_7.rocksdb_seek_child_seek_count;
    enum rocksdb_seek_min_heap_time = _Anonymous_7.rocksdb_seek_min_heap_time;
    enum rocksdb_seek_max_heap_time = _Anonymous_7.rocksdb_seek_max_heap_time;
    enum rocksdb_seek_internal_seek_time = _Anonymous_7.rocksdb_seek_internal_seek_time;
    enum rocksdb_find_next_user_entry_time = _Anonymous_7.rocksdb_find_next_user_entry_time;
    enum rocksdb_write_wal_time = _Anonymous_7.rocksdb_write_wal_time;
    enum rocksdb_write_memtable_time = _Anonymous_7.rocksdb_write_memtable_time;
    enum rocksdb_write_delay_time = _Anonymous_7.rocksdb_write_delay_time;
    enum rocksdb_write_pre_and_post_process_time = _Anonymous_7.rocksdb_write_pre_and_post_process_time;
    enum rocksdb_db_mutex_lock_nanos = _Anonymous_7.rocksdb_db_mutex_lock_nanos;
    enum rocksdb_db_condition_wait_nanos = _Anonymous_7.rocksdb_db_condition_wait_nanos;
    enum rocksdb_merge_operator_time_nanos = _Anonymous_7.rocksdb_merge_operator_time_nanos;
    enum rocksdb_read_index_block_nanos = _Anonymous_7.rocksdb_read_index_block_nanos;
    enum rocksdb_read_filter_block_nanos = _Anonymous_7.rocksdb_read_filter_block_nanos;
    enum rocksdb_new_table_block_iter_nanos = _Anonymous_7.rocksdb_new_table_block_iter_nanos;
    enum rocksdb_new_table_iterator_nanos = _Anonymous_7.rocksdb_new_table_iterator_nanos;
    enum rocksdb_block_seek_nanos = _Anonymous_7.rocksdb_block_seek_nanos;
    enum rocksdb_find_table_nanos = _Anonymous_7.rocksdb_find_table_nanos;
    enum rocksdb_bloom_memtable_hit_count = _Anonymous_7.rocksdb_bloom_memtable_hit_count;
    enum rocksdb_bloom_memtable_miss_count = _Anonymous_7.rocksdb_bloom_memtable_miss_count;
    enum rocksdb_bloom_sst_hit_count = _Anonymous_7.rocksdb_bloom_sst_hit_count;
    enum rocksdb_bloom_sst_miss_count = _Anonymous_7.rocksdb_bloom_sst_miss_count;
    enum rocksdb_key_lock_wait_time = _Anonymous_7.rocksdb_key_lock_wait_time;
    enum rocksdb_key_lock_wait_count = _Anonymous_7.rocksdb_key_lock_wait_count;
    enum rocksdb_env_new_sequential_file_nanos = _Anonymous_7.rocksdb_env_new_sequential_file_nanos;
    enum rocksdb_env_new_random_access_file_nanos = _Anonymous_7.rocksdb_env_new_random_access_file_nanos;
    enum rocksdb_env_new_writable_file_nanos = _Anonymous_7.rocksdb_env_new_writable_file_nanos;
    enum rocksdb_env_reuse_writable_file_nanos = _Anonymous_7.rocksdb_env_reuse_writable_file_nanos;
    enum rocksdb_env_new_random_rw_file_nanos = _Anonymous_7.rocksdb_env_new_random_rw_file_nanos;
    enum rocksdb_env_new_directory_nanos = _Anonymous_7.rocksdb_env_new_directory_nanos;
    enum rocksdb_env_file_exists_nanos = _Anonymous_7.rocksdb_env_file_exists_nanos;
    enum rocksdb_env_get_children_nanos = _Anonymous_7.rocksdb_env_get_children_nanos;
    enum rocksdb_env_get_children_file_attributes_nanos = _Anonymous_7.rocksdb_env_get_children_file_attributes_nanos;
    enum rocksdb_env_delete_file_nanos = _Anonymous_7.rocksdb_env_delete_file_nanos;
    enum rocksdb_env_create_dir_nanos = _Anonymous_7.rocksdb_env_create_dir_nanos;
    enum rocksdb_env_create_dir_if_missing_nanos = _Anonymous_7.rocksdb_env_create_dir_if_missing_nanos;
    enum rocksdb_env_delete_dir_nanos = _Anonymous_7.rocksdb_env_delete_dir_nanos;
    enum rocksdb_env_get_file_size_nanos = _Anonymous_7.rocksdb_env_get_file_size_nanos;
    enum rocksdb_env_get_file_modification_time_nanos = _Anonymous_7.rocksdb_env_get_file_modification_time_nanos;
    enum rocksdb_env_rename_file_nanos = _Anonymous_7.rocksdb_env_rename_file_nanos;
    enum rocksdb_env_link_file_nanos = _Anonymous_7.rocksdb_env_link_file_nanos;
    enum rocksdb_env_lock_file_nanos = _Anonymous_7.rocksdb_env_lock_file_nanos;
    enum rocksdb_env_unlock_file_nanos = _Anonymous_7.rocksdb_env_unlock_file_nanos;
    enum rocksdb_env_new_logger_nanos = _Anonymous_7.rocksdb_env_new_logger_nanos;
    enum rocksdb_total_metric_count = _Anonymous_7.rocksdb_total_metric_count;
    void rocksdb_set_perf_level(int) @nogc nothrow;
    rocksdb_perfcontext_t* rocksdb_perfcontext_create() @nogc nothrow;
    void rocksdb_perfcontext_reset(rocksdb_perfcontext_t*) @nogc nothrow;
    char* rocksdb_perfcontext_report(rocksdb_perfcontext_t*, ubyte) @nogc nothrow;
    c_ulong rocksdb_perfcontext_metric(rocksdb_perfcontext_t*, int) @nogc nothrow;
    void rocksdb_perfcontext_destroy(rocksdb_perfcontext_t*) @nogc nothrow;
    rocksdb_compactionfilter_t* rocksdb_compactionfilter_create(void*, void function(void*), ubyte function(void*, int, const(char)*, c_ulong, const(char)*, c_ulong, char**, c_ulong*, ubyte*), const(char)* function(void*)) @nogc nothrow;
    void rocksdb_compactionfilter_set_ignore_snapshots(rocksdb_compactionfilter_t*, ubyte) @nogc nothrow;
    void rocksdb_compactionfilter_destroy(rocksdb_compactionfilter_t*) @nogc nothrow;
    ubyte rocksdb_compactionfiltercontext_is_full_compaction(rocksdb_compactionfiltercontext_t*) @nogc nothrow;
    ubyte rocksdb_compactionfiltercontext_is_manual_compaction(rocksdb_compactionfiltercontext_t*) @nogc nothrow;
    rocksdb_compactionfilterfactory_t* rocksdb_compactionfilterfactory_create(void*, void function(void*), rocksdb_compactionfilter_t* function(void*, rocksdb_compactionfiltercontext_t*), const(char)* function(void*)) @nogc nothrow;
    void rocksdb_compactionfilterfactory_destroy(rocksdb_compactionfilterfactory_t*) @nogc nothrow;
    rocksdb_comparator_t* rocksdb_comparator_create(void*, void function(void*), int function(void*, const(char)*, c_ulong, const(char)*, c_ulong), const(char)* function(void*)) @nogc nothrow;
    void rocksdb_comparator_destroy(rocksdb_comparator_t*) @nogc nothrow;
    rocksdb_filterpolicy_t* rocksdb_filterpolicy_create(void*, void function(void*), char* function(void*, const(const(char)*)*, const(c_ulong)*, int, c_ulong*), ubyte function(void*, const(char)*, c_ulong, const(char)*, c_ulong), void function(void*, const(char)*, c_ulong), const(char)* function(void*)) @nogc nothrow;
    void rocksdb_filterpolicy_destroy(rocksdb_filterpolicy_t*) @nogc nothrow;
    rocksdb_filterpolicy_t* rocksdb_filterpolicy_create_bloom(int) @nogc nothrow;
    rocksdb_filterpolicy_t* rocksdb_filterpolicy_create_bloom_full(int) @nogc nothrow;
    rocksdb_mergeoperator_t* rocksdb_mergeoperator_create(void*, void function(void*), char* function(void*, const(char)*, c_ulong, const(char)*, c_ulong, const(const(char)*)*, const(c_ulong)*, int, ubyte*, c_ulong*), char* function(void*, const(char)*, c_ulong, const(const(char)*)*, const(c_ulong)*, int, ubyte*, c_ulong*), void function(void*, const(char)*, c_ulong), const(char)* function(void*)) @nogc nothrow;
    void rocksdb_mergeoperator_destroy(rocksdb_mergeoperator_t*) @nogc nothrow;
    rocksdb_readoptions_t* rocksdb_readoptions_create() @nogc nothrow;
    void rocksdb_readoptions_destroy(rocksdb_readoptions_t*) @nogc nothrow;
    void rocksdb_readoptions_set_verify_checksums(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_fill_cache(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_snapshot(rocksdb_readoptions_t*, const(rocksdb_snapshot_t)*) @nogc nothrow;
    void rocksdb_readoptions_set_iterate_upper_bound(rocksdb_readoptions_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_readoptions_set_iterate_lower_bound(rocksdb_readoptions_t*, const(char)*, c_ulong) @nogc nothrow;
    void rocksdb_readoptions_set_read_tier(rocksdb_readoptions_t*, int) @nogc nothrow;
    void rocksdb_readoptions_set_tailing(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    void rocksdb_readoptions_set_managed(rocksdb_readoptions_t*, ubyte) @nogc nothrow;
    static if(!is(typeof(__GLIBC_MINOR__))) {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 32;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); }))) {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }




    static if(!is(typeof(__GLIBC__))) {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC__); }))) {
            mixin(enumMixinStr___GLIBC__);
        }
    }




    static if(!is(typeof(__GNU_LIBRARY__))) {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if(is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); }))) {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_SCANF))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_GETS))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }




    static if(!is(typeof(__USE_FORTIFY_LEVEL))) {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); }))) {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }




    static if(!is(typeof(__USE_ATFILE))) {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ATFILE); }))) {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }




    static if(!is(typeof(__USE_MISC))) {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_MISC); }))) {
            mixin(enumMixinStr___USE_MISC);
        }
    }




    static if(!is(typeof(_ATFILE_SOURCE))) {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); }))) {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K8))) {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }




    static if(!is(typeof(__USE_ISOC99))) {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC99); }))) {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }




    static if(!is(typeof(__USE_ISOC95))) {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC95); }))) {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K))) {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); }))) {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }




    static if(!is(typeof(__USE_POSIX199506))) {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199506); }))) {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }




    static if(!is(typeof(__USE_POSIX199309))) {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199309); }))) {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }




    static if(!is(typeof(__USE_POSIX2))) {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX2); }))) {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }




    static if(!is(typeof(__USE_POSIX))) {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX); }))) {
            mixin(enumMixinStr___USE_POSIX);
        }
    }




    static if(!is(typeof(_POSIX_C_SOURCE))) {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }




    static if(!is(typeof(_POSIX_SOURCE))) {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }




    static if(!is(typeof(__USE_POSIX_IMPLICITLY))) {
        private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); }))) {
            mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
        }
    }




    static if(!is(typeof(__USE_ISOC11))) {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC11); }))) {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }




    static if(!is(typeof(__GLIBC_USE_ISOC2X))) {
        private enum enumMixinStr___GLIBC_USE_ISOC2X = `enum __GLIBC_USE_ISOC2X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_ISOC2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_ISOC2X);
        }
    }




    static if(!is(typeof(_DEFAULT_SOURCE))) {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); }))) {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }
    static if(!is(typeof(_FEATURES_H))) {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FEATURES_H); }))) {
            mixin(enumMixinStr__FEATURES_H);
        }
    }




    static if(!is(typeof(__SYSCALL_WORDSIZE))) {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); }))) {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }




    static if(!is(typeof(__WORDSIZE_TIME64_COMPAT32))) {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); }))) {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }




    static if(!is(typeof(__WORDSIZE))) {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE); }))) {
            mixin(enumMixinStr___WORDSIZE);
        }
    }




    static if(!is(typeof(__WCHAR_MIN))) {
        private enum enumMixinStr___WCHAR_MIN = `enum __WCHAR_MIN = ( - __WCHAR_MAX - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MIN); }))) {
            mixin(enumMixinStr___WCHAR_MIN);
        }
    }




    static if(!is(typeof(__WCHAR_MAX))) {
        private enum enumMixinStr___WCHAR_MAX = `enum __WCHAR_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MAX); }))) {
            mixin(enumMixinStr___WCHAR_MAX);
        }
    }




    static if(!is(typeof(_BITS_WCHAR_H))) {
        private enum enumMixinStr__BITS_WCHAR_H = `enum _BITS_WCHAR_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_WCHAR_H); }))) {
            mixin(enumMixinStr__BITS_WCHAR_H);
        }
    }




    static if(!is(typeof(__FD_SETSIZE))) {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr___FD_SETSIZE); }))) {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }




    static if(!is(typeof(__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64))) {
        private enum enumMixinStr___KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = `enum __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64); }))) {
            mixin(enumMixinStr___KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64);
        }
    }




    static if(!is(typeof(__STATFS_MATCHES_STATFS64))) {
        private enum enumMixinStr___STATFS_MATCHES_STATFS64 = `enum __STATFS_MATCHES_STATFS64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___STATFS_MATCHES_STATFS64); }))) {
            mixin(enumMixinStr___STATFS_MATCHES_STATFS64);
        }
    }




    static if(!is(typeof(__RLIM_T_MATCHES_RLIM64_T))) {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); }))) {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }




    static if(!is(typeof(__INO_T_MATCHES_INO64_T))) {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); }))) {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }




    static if(!is(typeof(__OFF_T_MATCHES_OFF64_T))) {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); }))) {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }




    static if(!is(typeof(__CPU_MASK_TYPE))) {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); }))) {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }




    static if(!is(typeof(__SSIZE_T_TYPE))) {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = __SWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__FSID_T_TYPE))) {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if(is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); }))) {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKSIZE_T_TYPE))) {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMER_T_TYPE))) {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); }))) {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCKID_T_TYPE))) {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }




    static if(!is(typeof(__KEY_T_TYPE))) {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); }))) {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }




    static if(!is(typeof(__DADDR_T_TYPE))) {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); }))) {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS64_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS64_T_TYPE = `enum __SUSECONDS64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS64_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS64_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__USECONDS_T_TYPE))) {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__TIME_T_TYPE))) {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); }))) {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCK_T_TYPE))) {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }




    static if(!is(typeof(__ID_T_TYPE))) {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___ID_T_TYPE); }))) {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT64_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT64_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT64_T_TYPE))) {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT_T_TYPE))) {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM64_T_TYPE))) {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM_T_TYPE))) {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }




    static if(!is(typeof(__PID_T_TYPE))) {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___PID_T_TYPE); }))) {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF64_T_TYPE))) {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); }))) {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_TYPE))) {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); }))) {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }




    static if(!is(typeof(__FSWORD_T_TYPE))) {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); }))) {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }




    static if(!is(typeof(__NLINK_T_TYPE))) {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); }))) {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }




    static if(!is(typeof(__MODE_T_TYPE))) {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); }))) {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }




    static if(!is(typeof(__INO64_T_TYPE))) {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); }))) {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }




    static if(!is(typeof(__INO_T_TYPE))) {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_TYPE); }))) {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }




    static if(!is(typeof(__GID_T_TYPE))) {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___GID_T_TYPE); }))) {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }




    static if(!is(typeof(__UID_T_TYPE))) {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___UID_T_TYPE); }))) {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }




    static if(!is(typeof(__DEV_T_TYPE))) {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); }))) {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_ULONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_SLONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TYPESIZES_H))) {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); }))) {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }




    static if(!is(typeof(__STD_TYPE))) {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if(is(typeof({ mixin(enumMixinStr___STD_TYPE); }))) {
            mixin(enumMixinStr___STD_TYPE);
        }
    }




    static if(!is(typeof(__U64_TYPE))) {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___U64_TYPE); }))) {
            mixin(enumMixinStr___U64_TYPE);
        }
    }




    static if(!is(typeof(__S64_TYPE))) {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___S64_TYPE); }))) {
            mixin(enumMixinStr___S64_TYPE);
        }
    }




    static if(!is(typeof(__ULONG32_TYPE))) {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); }))) {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }




    static if(!is(typeof(__SLONG32_TYPE))) {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); }))) {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }




    static if(!is(typeof(__UWORD_TYPE))) {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UWORD_TYPE); }))) {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }




    static if(!is(typeof(__SWORD_TYPE))) {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SWORD_TYPE); }))) {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }




    static if(!is(typeof(__UQUAD_TYPE))) {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); }))) {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }




    static if(!is(typeof(__SQUAD_TYPE))) {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); }))) {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }




    static if(!is(typeof(__ULONGWORD_TYPE))) {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); }))) {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__SLONGWORD_TYPE))) {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); }))) {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__U32_TYPE))) {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___U32_TYPE); }))) {
            mixin(enumMixinStr___U32_TYPE);
        }
    }




    static if(!is(typeof(__S32_TYPE))) {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___S32_TYPE); }))) {
            mixin(enumMixinStr___S32_TYPE);
        }
    }




    static if(!is(typeof(__U16_TYPE))) {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if(is(typeof({ mixin(enumMixinStr___U16_TYPE); }))) {
            mixin(enumMixinStr___U16_TYPE);
        }
    }




    static if(!is(typeof(__S16_TYPE))) {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if(is(typeof({ mixin(enumMixinStr___S16_TYPE); }))) {
            mixin(enumMixinStr___S16_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TYPES_H))) {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }




    static if(!is(typeof(__TIMESIZE))) {
        private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMESIZE); }))) {
            mixin(enumMixinStr___TIMESIZE);
        }
    }




    static if(!is(typeof(__TIME64_T_TYPE))) {
        private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); }))) {
            mixin(enumMixinStr___TIME64_T_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TIME64_H))) {
        private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); }))) {
            mixin(enumMixinStr__BITS_TIME64_H);
        }
    }




    static if(!is(typeof(_BITS_STDINT_UINTN_H))) {
        private enum enumMixinStr__BITS_STDINT_UINTN_H = `enum _BITS_STDINT_UINTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_UINTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_UINTN_H);
        }
    }




    static if(!is(typeof(_BITS_STDINT_INTN_H))) {
        private enum enumMixinStr__BITS_STDINT_INTN_H = `enum _BITS_STDINT_INTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_INTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_INTN_H);
        }
    }




    static if(!is(typeof(__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI))) {
        private enum enumMixinStr___LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = `enum __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___LDOUBLE_REDIRECTS_TO_FLOAT128_ABI); }))) {
            mixin(enumMixinStr___LDOUBLE_REDIRECTS_TO_FLOAT128_ABI);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT_C2X);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT_C2X))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X = `enum __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT_C2X);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_LIB_EXT2))) {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); }))) {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }




    static if(!is(typeof(_STDC_PREDEF_H))) {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); }))) {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }




    static if(!is(typeof(_STDINT_H))) {
        private enum enumMixinStr__STDINT_H = `enum _STDINT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDINT_H); }))) {
            mixin(enumMixinStr__STDINT_H);
        }
    }
    static if(!is(typeof(INT8_MIN))) {
        private enum enumMixinStr_INT8_MIN = `enum INT8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MIN); }))) {
            mixin(enumMixinStr_INT8_MIN);
        }
    }




    static if(!is(typeof(INT16_MIN))) {
        private enum enumMixinStr_INT16_MIN = `enum INT16_MIN = ( - 32767 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MIN); }))) {
            mixin(enumMixinStr_INT16_MIN);
        }
    }




    static if(!is(typeof(INT32_MIN))) {
        private enum enumMixinStr_INT32_MIN = `enum INT32_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MIN); }))) {
            mixin(enumMixinStr_INT32_MIN);
        }
    }




    static if(!is(typeof(INT64_MIN))) {
        private enum enumMixinStr_INT64_MIN = `enum INT64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MIN); }))) {
            mixin(enumMixinStr_INT64_MIN);
        }
    }




    static if(!is(typeof(INT8_MAX))) {
        private enum enumMixinStr_INT8_MAX = `enum INT8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MAX); }))) {
            mixin(enumMixinStr_INT8_MAX);
        }
    }




    static if(!is(typeof(INT16_MAX))) {
        private enum enumMixinStr_INT16_MAX = `enum INT16_MAX = ( 32767 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MAX); }))) {
            mixin(enumMixinStr_INT16_MAX);
        }
    }




    static if(!is(typeof(INT32_MAX))) {
        private enum enumMixinStr_INT32_MAX = `enum INT32_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MAX); }))) {
            mixin(enumMixinStr_INT32_MAX);
        }
    }




    static if(!is(typeof(INT64_MAX))) {
        private enum enumMixinStr_INT64_MAX = `enum INT64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MAX); }))) {
            mixin(enumMixinStr_INT64_MAX);
        }
    }




    static if(!is(typeof(UINT8_MAX))) {
        private enum enumMixinStr_UINT8_MAX = `enum UINT8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT8_MAX); }))) {
            mixin(enumMixinStr_UINT8_MAX);
        }
    }




    static if(!is(typeof(UINT16_MAX))) {
        private enum enumMixinStr_UINT16_MAX = `enum UINT16_MAX = ( 65535 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT16_MAX); }))) {
            mixin(enumMixinStr_UINT16_MAX);
        }
    }




    static if(!is(typeof(UINT32_MAX))) {
        private enum enumMixinStr_UINT32_MAX = `enum UINT32_MAX = ( 4294967295U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT32_MAX); }))) {
            mixin(enumMixinStr_UINT32_MAX);
        }
    }




    static if(!is(typeof(UINT64_MAX))) {
        private enum enumMixinStr_UINT64_MAX = `enum UINT64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT64_MAX); }))) {
            mixin(enumMixinStr_UINT64_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST8_MIN))) {
        private enum enumMixinStr_INT_LEAST8_MIN = `enum INT_LEAST8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST8_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST16_MIN))) {
        private enum enumMixinStr_INT_LEAST16_MIN = `enum INT_LEAST16_MIN = ( - 32767 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST16_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST32_MIN))) {
        private enum enumMixinStr_INT_LEAST32_MIN = `enum INT_LEAST32_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST32_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST64_MIN))) {
        private enum enumMixinStr_INT_LEAST64_MIN = `enum INT_LEAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST64_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST8_MAX))) {
        private enum enumMixinStr_INT_LEAST8_MAX = `enum INT_LEAST8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST16_MAX))) {
        private enum enumMixinStr_INT_LEAST16_MAX = `enum INT_LEAST16_MAX = ( 32767 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST32_MAX))) {
        private enum enumMixinStr_INT_LEAST32_MAX = `enum INT_LEAST32_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST64_MAX))) {
        private enum enumMixinStr_INT_LEAST64_MAX = `enum INT_LEAST64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST8_MAX))) {
        private enum enumMixinStr_UINT_LEAST8_MAX = `enum UINT_LEAST8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST16_MAX))) {
        private enum enumMixinStr_UINT_LEAST16_MAX = `enum UINT_LEAST16_MAX = ( 65535 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST32_MAX))) {
        private enum enumMixinStr_UINT_LEAST32_MAX = `enum UINT_LEAST32_MAX = ( 4294967295U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST64_MAX))) {
        private enum enumMixinStr_UINT_LEAST64_MAX = `enum UINT_LEAST64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(INT_FAST8_MIN))) {
        private enum enumMixinStr_INT_FAST8_MIN = `enum INT_FAST8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MIN); }))) {
            mixin(enumMixinStr_INT_FAST8_MIN);
        }
    }




    static if(!is(typeof(INT_FAST16_MIN))) {
        private enum enumMixinStr_INT_FAST16_MIN = `enum INT_FAST16_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MIN); }))) {
            mixin(enumMixinStr_INT_FAST16_MIN);
        }
    }




    static if(!is(typeof(INT_FAST32_MIN))) {
        private enum enumMixinStr_INT_FAST32_MIN = `enum INT_FAST32_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MIN); }))) {
            mixin(enumMixinStr_INT_FAST32_MIN);
        }
    }




    static if(!is(typeof(INT_FAST64_MIN))) {
        private enum enumMixinStr_INT_FAST64_MIN = `enum INT_FAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MIN); }))) {
            mixin(enumMixinStr_INT_FAST64_MIN);
        }
    }




    static if(!is(typeof(INT_FAST8_MAX))) {
        private enum enumMixinStr_INT_FAST8_MAX = `enum INT_FAST8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MAX); }))) {
            mixin(enumMixinStr_INT_FAST8_MAX);
        }
    }




    static if(!is(typeof(INT_FAST16_MAX))) {
        private enum enumMixinStr_INT_FAST16_MAX = `enum INT_FAST16_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MAX); }))) {
            mixin(enumMixinStr_INT_FAST16_MAX);
        }
    }




    static if(!is(typeof(INT_FAST32_MAX))) {
        private enum enumMixinStr_INT_FAST32_MAX = `enum INT_FAST32_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MAX); }))) {
            mixin(enumMixinStr_INT_FAST32_MAX);
        }
    }




    static if(!is(typeof(INT_FAST64_MAX))) {
        private enum enumMixinStr_INT_FAST64_MAX = `enum INT_FAST64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MAX); }))) {
            mixin(enumMixinStr_INT_FAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST8_MAX))) {
        private enum enumMixinStr_UINT_FAST8_MAX = `enum UINT_FAST8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST8_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST16_MAX))) {
        private enum enumMixinStr_UINT_FAST16_MAX = `enum UINT_FAST16_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST32_MAX))) {
        private enum enumMixinStr_UINT_FAST32_MAX = `enum UINT_FAST32_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST64_MAX))) {
        private enum enumMixinStr_UINT_FAST64_MAX = `enum UINT_FAST64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST64_MAX);
        }
    }




    static if(!is(typeof(INTPTR_MIN))) {
        private enum enumMixinStr_INTPTR_MIN = `enum INTPTR_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MIN); }))) {
            mixin(enumMixinStr_INTPTR_MIN);
        }
    }




    static if(!is(typeof(INTPTR_MAX))) {
        private enum enumMixinStr_INTPTR_MAX = `enum INTPTR_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MAX); }))) {
            mixin(enumMixinStr_INTPTR_MAX);
        }
    }




    static if(!is(typeof(UINTPTR_MAX))) {
        private enum enumMixinStr_UINTPTR_MAX = `enum UINTPTR_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINTPTR_MAX); }))) {
            mixin(enumMixinStr_UINTPTR_MAX);
        }
    }




    static if(!is(typeof(INTMAX_MIN))) {
        private enum enumMixinStr_INTMAX_MIN = `enum INTMAX_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MIN); }))) {
            mixin(enumMixinStr_INTMAX_MIN);
        }
    }




    static if(!is(typeof(INTMAX_MAX))) {
        private enum enumMixinStr_INTMAX_MAX = `enum INTMAX_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MAX); }))) {
            mixin(enumMixinStr_INTMAX_MAX);
        }
    }




    static if(!is(typeof(UINTMAX_MAX))) {
        private enum enumMixinStr_UINTMAX_MAX = `enum UINTMAX_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINTMAX_MAX); }))) {
            mixin(enumMixinStr_UINTMAX_MAX);
        }
    }




    static if(!is(typeof(PTRDIFF_MIN))) {
        private enum enumMixinStr_PTRDIFF_MIN = `enum PTRDIFF_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MIN); }))) {
            mixin(enumMixinStr_PTRDIFF_MIN);
        }
    }




    static if(!is(typeof(PTRDIFF_MAX))) {
        private enum enumMixinStr_PTRDIFF_MAX = `enum PTRDIFF_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MAX); }))) {
            mixin(enumMixinStr_PTRDIFF_MAX);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MIN))) {
        private enum enumMixinStr_SIG_ATOMIC_MIN = `enum SIG_ATOMIC_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MIN); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MIN);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MAX))) {
        private enum enumMixinStr_SIG_ATOMIC_MAX = `enum SIG_ATOMIC_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MAX); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MAX);
        }
    }




    static if(!is(typeof(SIZE_MAX))) {
        private enum enumMixinStr_SIZE_MAX = `enum SIZE_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_SIZE_MAX); }))) {
            mixin(enumMixinStr_SIZE_MAX);
        }
    }




    static if(!is(typeof(WCHAR_MIN))) {
        private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = ( - 0x7fffffff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MIN); }))) {
            mixin(enumMixinStr_WCHAR_MIN);
        }
    }




    static if(!is(typeof(WCHAR_MAX))) {
        private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MAX); }))) {
            mixin(enumMixinStr_WCHAR_MAX);
        }
    }




    static if(!is(typeof(WINT_MIN))) {
        private enum enumMixinStr_WINT_MIN = `enum WINT_MIN = ( 0u );`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MIN); }))) {
            mixin(enumMixinStr_WINT_MIN);
        }
    }




    static if(!is(typeof(WINT_MAX))) {
        private enum enumMixinStr_WINT_MAX = `enum WINT_MAX = ( 4294967295u );`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MAX); }))) {
            mixin(enumMixinStr_WINT_MAX);
        }
    }
    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }
    static if(!is(typeof(__THROW))) {
        private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROW); }))) {
            mixin(enumMixinStr___THROW);
        }
    }




    static if(!is(typeof(__THROWNL))) {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROWNL); }))) {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
        }
    }
    static if(!is(typeof(__flexarr))) {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if(is(typeof({ mixin(enumMixinStr___flexarr); }))) {
            mixin(enumMixinStr___flexarr);
        }
    }




    static if(!is(typeof(__glibc_c99_flexarr_available))) {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_c99_flexarr_available); }))) {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }
    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }






    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
        }
    }




    static if(!is(typeof(__attribute_used__))) {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_used__); }))) {
            mixin(enumMixinStr___attribute_used__);
        }
    }




    static if(!is(typeof(__attribute_noinline__))) {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_noinline__); }))) {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }
    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }






    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
        }
    }






    static if(!is(typeof(__extern_inline))) {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_inline); }))) {
            mixin(enumMixinStr___extern_inline);
        }
    }




    static if(!is(typeof(__extern_always_inline))) {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_always_inline); }))) {
            mixin(enumMixinStr___extern_always_inline);
        }
    }




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }




    static if(!is(typeof(__restrict_arr))) {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___restrict_arr); }))) {
            mixin(enumMixinStr___restrict_arr);
        }
    }
    static if(!is(typeof(__HAVE_GENERIC_SELECTION))) {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); }))) {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }
    static if(!is(typeof(__GNUC_VA_LIST))) {
        private enum enumMixinStr___GNUC_VA_LIST = `enum __GNUC_VA_LIST = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GNUC_VA_LIST); }))) {
            mixin(enumMixinStr___GNUC_VA_LIST);
        }
    }
    static if(!is(typeof(NULL))) {
        private enum enumMixinStr_NULL = `enum NULL = ( cast( void * ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_NULL); }))) {
            mixin(enumMixinStr_NULL);
        }
    }





}
