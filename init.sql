CREATE TABLE IF NOT EXISTS default.graphite_data (
  Path String CODEC(ZSTD(3)),
  Value Float64 CODEC(Gorilla, LZ4),
  Time UInt32 CODEC(DoubleDelta, LZ4),
  Date Date CODEC(DoubleDelta, LZ4),
  Timestamp UInt32 CODEC(DoubleDelta, LZ4) TTL Date + INTERVAL 1 MONTH
) ENGINE = GraphiteMergeTree('graphite_rollup')
PARTITION BY toYYYYMMDD(Date)
ORDER BY (Path, Time);

CREATE TABLE IF NOT EXISTS default.graphite_reverse (
  Path String CODEC(ZSTD(3)),
  Value Float64 CODEC(Gorilla, LZ4),
  Time UInt32 CODEC(DoubleDelta, LZ4),
  Date Date CODEC(DoubleDelta, LZ4),
  Timestamp UInt32 CODEC(DoubleDelta, LZ4) TTL Date + INTERVAL 1 MONTH
) ENGINE = GraphiteMergeTree('graphite_rollup')
PARTITION BY toYYYYMMDD(Date)
ORDER BY (Path, Time);

CREATE TABLE IF NOT EXISTS default.graphite_index (
  Date Date CODEC(DoubleDelta, LZ4),
  Level UInt32,
  Path String CODEC(ZSTD(3)),
  Version UInt32
) ENGINE = ReplacingMergeTree(Version)
PARTITION BY toYYYYMMDD(Date)
ORDER BY (Level, Path, Date);

CREATE TABLE IF NOT EXISTS default.graphite_tagged (
  Date Date CODEC(DoubleDelta, LZ4),
  Tag1 String CODEC(ZSTD(3)),
  Path String CODEC(ZSTD(3)),
  Tags Array(String) CODEC(ZSTD(3)),
  Version UInt32 TTL Date + INTERVAL 1 MONTH
) ENGINE = ReplacingMergeTree(Version)
PARTITION BY toYYYYMMDD(Date)
ORDER BY (Tag1, Path, Date);
