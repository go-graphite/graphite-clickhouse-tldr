CREATE DATABASE IF NOT EXISTS graphite;

CREATE TABLE IF NOT EXISTS graphite.data ( 
  Path String,  
  Value Float64,  
  Time UInt32,  
  Date Date,  
  Timestamp UInt32
) ENGINE = GraphiteMergeTree(Date, (Path, Time), 8192, 'graphite_rollup');

CREATE TABLE IF NOT EXISTS graphite.data_reverse ( 
  Path String,  
  Value Float64,  
  Time UInt32,
  Date Date,
  Timestamp UInt32
) ENGINE = GraphiteMergeTree('graphite_rollup') PARTITION BY Date ORDER BY (Path, Time) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS graphite.metrics ( 
  Date Date,
  Level UInt32,
  Path String,
  Deleted UInt8,
  Version UInt32
) ENGINE = ReplacingMergeTree(Date, (Level, Path), 8192, Version);

CREATE TABLE IF NOT EXISTS graphite.series ( 
  Date Date,
  Level UInt32,
  Path String,
  Deleted UInt8,
  Version UInt32
) ENGINE = ReplacingMergeTree(Date, (Level, Path, Date), 8192);

CREATE TABLE IF NOT EXISTS graphite.tagged (
  Date Date,
  Tag1 String,
  Path String,
  Tags Array(String),
  Version UInt32,
  Deleted UInt8
) ENGINE = ReplacingMergeTree(Date, (Tag1, Path, Date), 8192, Version);
