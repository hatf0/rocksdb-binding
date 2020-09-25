project('rocksdb-binding', 'd', default_options: [])

rocksdb_src = ['src/rocksdb/batch.d', 'src/rocksdb/binding.d', 'src/rocksdb/columnfamily.d', 'src/rocksdb/comparator.d', 'src/rocksdb/database.d', 'src/rocksdb/env.d', 'src/rocksdb/iterator.d', 'src/rocksdb/options.d', 'src/rocksdb/package.d', 'src/rocksdb/queryable.d', 'src/rocksdb/slice.d', 'src/rocksdb/snapshot.d']

include_dir = include_directories('src')
# we only need to link to it, not include the cflags
rdb = dependency('rocksdb').partial_dependency(links: true)

lib = library('rocksdb-binding', 
              rocksdb_src, 
              include_directories: include_dir,
              dependencies: [rdb],
              cpp_args: '')

