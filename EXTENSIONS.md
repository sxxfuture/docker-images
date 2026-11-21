# Extensions

# TIME

## timescaledb

`–sLdt-` | `2.31.0` | `18` `17` `16` | [`23.9k🌟`](https://github.com/timescale/timescaledb)

面向时序与事件数据的高性能实时分析数据库扩展。通过 hypertable 和 columnstore 自动按时间分区并加速聚合查询，适合监控指标、IoT 与实时分析场景。

## timescaledb_toolkit

`–s-dt-` | `1.27.0` | `18` `17` `16` | [`493🌟`](https://github.com/timescale/timescaledb-toolkit)

为时序工作负载补充分析型 hyperfunctions 的扩展，可用于 TimescaleDB 和原生 PostgreSQL。提供 tdigest、HyperLogLog 等近似聚合，以及时间加权平均、计数器与仪表分析、降采样等能力。

## timeseries

`—-d–` | `0.2.1` | `18` `17` `16` | [`423🌟`](https://github.com/ChuckHend/pg_timeseries)

简化 PostgreSQL 时序表创建与维护的扩展。调用 enable_ts_table 即可把普通表改造成按时间范围划分的原生分区表，并由定时维护作业自动补建当前和未来分区。

## periods

`–s-d–` | `1.2.3` | `18` `17` `16` | [`323🌟`](https://github.com/xocolatl/periods)

在 PostgreSQL 中实现 SQL:2016 定义的 periods 与 SYSTEM VERSIONING 行为。通过函数、视图和触发器约束起止时间列并支持唯一约束，可在旧版本上模拟系统版本化表。

## temporal_tables

`–s-d-r` | `1.2.2` | `18` `17` `16` | [`–`](https://pgxn.org/dist/temporal_tables/)

为 PostgreSQL 提供时态表支持，实现系统周期数据版本化。更新或删除行时自动把旧行归档到指定的历史表，便于保留事务时间维度的完整变更记录。

## emaj

`-b–d–` | `5.0.1` | `18` `17` `16` | [`94🌟`](https://github.com/dalibo/emaj)

记录一组或多组表上的 INSERT、UPDATE、DELETE 和 TRUNCATE 变更，并能撤销这些变更、把表集合恢复到预先定义的稳定状态。常用于开发环境中回滚程序执行产生的修改并重复回放，也在生产环境中为批次作业设置保存点和恢复点。

## table_version

`-b–d–` | `1.11.1` | `18` `17` `16` | [`68🌟`](https://github.com/linz/postgresql-tableversion)

基于 PL/pgSQL 触发器记录数据行的修改及其历史版本，并提供按修订号访问表快照、比较任意两个版本差异的接口。适用于需要追溯数据变化、审计和回看历史记录的场景。

## pg_cron

`–sLd–` | `1.6.8` | `18` `17` `16` | [`3.9k🌟`](https://github.com/citusdata/pg_cron)

在数据库内部运行的 cron 式定时任务调度器，由后台工作进程按 cron 语法执行 cron.job 表中登记的任务，支持多个任务并行而同一任务同时只跑一个实例。常用于数据库内的定期清理、汇总和运维作业。

## pg_task

`–sL—` | `3.0.0` | `18` `17` `16` | [`70🌟`](https://github.com/RekGRpth/pg_task)

面向 PostgreSQL、Greenplum 和 Greengage 的作业调度器，以一组完全运行在数据库内的后台工作进程异步执行任意 SQL 命令。调度任务只需向普通任务表插入一行并指定执行时间，无需外部守护进程或客户端库。

## pg_later

`–sLd–` | `0.4.0` | `18` `17` `16` | [`376🌟`](https://github.com/ChuckHend/pg_later)

异步执行 SQL 查询并在稍后取回结果：提交查询后立即返回，之后凭作业编号获取输出。基于 pgmq 构建，适合运行耗时较长的查询以及后台数据处理任务。

## pg_dispatch

`—-d–` | `0.1.5` | `18` `17` `16` | [`15🌟`](https://github.com/Snehil-Shah/pg_dispatch)

基于 pg_cron 的异步 SQL 调度器，把繁重的 SQL 作为可延迟任务放到独立事务中执行，避免阻塞主事务。常用于在触发器等场景异步派发通知、写入分析表等副作用，可替代 pg_later 用于 Supabase、AWS RDS 等受限环境。

## pg_background

`–s-d-r` | `2.0.4` | `18` `17` `16` | [`262🌟`](https://github.com/vibhorkum/pg_background)

在后台工作进程中执行任意 SQL，提供异步执行与自治事务，让长耗时操作不再阻塞客户端会话。还支持可取消的句柄、进度上报和可观测性，适合生产环境中的后台任务处理。

## pg_when

`–s-d–` | `0.1.10` | `18` `17` `16` | [`46🌟`](https://github.com/frectonz/pg-when)

用自然语言构造时间值的扩展，可以把诸如 next Friday at 8:00 PM、5 days ago in Asia/Tokyo 这样的短语解析为 timestamp，并支持日期、时间与时区三部分的组合。适合需要从人类可读描述生成时间戳的场景。

## edtf_postgres

`–s-dtr` | `1.3.2` | `18` `17` `16` | [`2🌟`](https://github.com/monumental-archive/edtf/tree/v1.3.2/crates/edtf-postgres)

把 EDTF（ISO 8601-2 扩展日期时间格式）的解析能力带入 SQL，提供格式校验、级别判断、规范化输出、可建索引的日期上下界以及三值时间关系函数。适合存储带有不确定性或近似区间的历史与档案日期。

## pg_stl

`–s-d-r` | `1.0.0` | `18` `17` `16` | [`6🌟`](https://github.com/nadyaloseva/pg_ts_analysis)

在 PostgreSQL 内部完成时间序列分析，实现自相关函数 ACF、偏自相关函数 PACF 和 STL 分解三种经典方法，并以数组形式返回各滞后阶的计算结果。适合直接在数据库中考察序列的相关性与趋势、季节性。

## cron_utils

`—-d-r` | `0.1.0` | `18` `17` `16` | [`0🌟`](https://github.com/Myshkouski/pg-cron-utils)

解析标准 5 字段 cron 表达式并推算其触发时间。parse_cron 把表达式拆成 cron_parts，cron_first_trigger 与 cron_last_trigger 分别求出指定时刻之后或之前最近的一次触发时间，可用于核对调度计划。

# GIS

## postgis

`-bs-d–` | `3.7.0` | `18` `17` `16` | [`–`](https://git.osgeo.org/gitea/postgis/postgis)

PostgreSQL 的空间数据库核心扩展，为几何与地理对象提供数据类型、空间索引和空间关系运算。广泛用于地图服务、位置检索与 GIS 数据的存储分析。

## postgis_topology

`–s-d–` | `3.7.0` | `18` `17` `16` | [`–`](https://git.osgeo.org/gitea/postgis/postgis)

在 PostGIS 之上提供拓扑数据模型支持，把共享边、节点和面组织成拓扑结构进行存储。适合需要保证相邻要素一致性的地图数据编辑与维护。

## postgis_raster

`–s-d–` | `3.7.0` | `18` `17` `16` | [`–`](https://git.osgeo.org/gitea/postgis/postgis)

PostGIS 的栅格数据支持扩展，可在数据库内存储、查询与运算栅格影像。常用于遥感影像、DEM 等连续表面数据的空间分析。

## postgis_sfcgal

`–s-d-r` | `3.7.0` | `18` `17` `16` | [`–`](https://git.osgeo.org/gitea/postgis/postgis)

为 PostGIS 引入基于 SFCGAL 的三维几何运算能力，支持三维实体与曲面的计算和处理。适合需要在库内完成立体几何分析的建模场景。

## postgis_tiger_geocoder

`—-dt-` | `2025.2` | `18` `17` `16` | [`–`](https://gitea.osgeo.org/postgis/postgis_tiger_geocoder)

PostGIS 生态中的美国地址地理编码扩展，基于 Census TIGER 数据把街道地址转换为经纬度坐标，也支持反向的地理位置查地址。常用于美国境内的地址定位与空间数据匹配。

## address_standardizer

`–s-d-r` | `3.7` | `18` `17` `16` | [`7🌟`](https://github.com/postgis/address_standardizer)

把单行美国街道地址字符串解析成门牌号、街道名、城市、州和邮编等组成部分。它是 PAGC 标准化器与单行地址解析器的分支，编译为单个 PostgreSQL 扩展库，适合地址清洗与归一化。

## address_standardizer_data_us

`—-d-r` | `3.7` | `18` `17` `16` | [`7🌟`](https://github.com/postgis/address_standardizer)

address_standardizer 的美国本地化数据包，提供解析美国地址时使用的词典与对照表，使州名缩写、街道后缀等要素可被正确识别，需与 address_standardizer 扩展配合安装使用。

## pgrouting

`–s-d-r` | `4.0.2` | `18` `17` `16` | [`1.4k🌟`](https://github.com/pgRouting/pgrouting)

扩展 PostgreSQL 与 PostGIS 的地理空间路径规划与网络分析能力，提供 Dijkstra、A*、双向搜索、驾驶距离、TSP 等算法。适合在道路网络上做最短路径计算与出行分析。

## pointcloud

`–s-d–` | `1.2.5` | `18` `17` `16` | [`429🌟`](https://github.com/pgpointcloud/pointcloud)

用于在 PostgreSQL 中存储点云（LIDAR）数据的扩展，提供点云数据类型与配套函数，便于将激光雷达扫描结果入库并做查询和空间分析。

## pointcloud_postgis

`—-dt-` | `1.2.5` | `18` `17` `16` | [`429🌟`](https://github.com/pgpointcloud/pointcloud)

用于在 PostgreSQL 中存储点云（LIDAR）数据的扩展，提供点云数据类型与压缩存储能力。pointcloud_postgis 变体与 PostGIS 配合使用，适合管理大规模点云并做空间查询分析。

## h3

`–s-d-r` | `4.5.0` | `18` `17` `16` | [`387🌟`](https://github.com/postgis/h3-pg)

为 PostgreSQL 提供 Uber H3 六边形层次化地理索引系统的绑定，可直接在 SQL 中生成和操作 H3 单元索引。常用于按六边形网格聚合、索引和分析空间数据。

## h3_postgis

`–s-d-r` | `4.5.0` | `18` `17` `16` | [`387🌟`](https://github.com/postgis/h3-pg)

H3 六边形地理索引的 PostGIS 配套扩展，在 h3 的基础上把几何数据与 H3 单元关联起来。适合在 PostGIS 环境中按六边形网格聚合和检索空间对象。

## q3c

`–s-d-r` | `2.0.6` | `18` `17` `16` | [`90🌟`](https://github.com/segasai/q3c)

在球面上进行空间索引的 PostgreSQL 扩展，最初为天文数据设计，可加速天球坐标的邻近查询与区域检索。适合星表、巡天数据等大规模球面点数据的索引与搜索。

## ogr_fdw

`-bs-d-r` | `1.1.9` | `18` `17` `16` | [`264🌟`](https://github.com/pramsey/pgsql-ogr-fdw)

基于 GDAL/OGR 的 PostgreSQL foreign data wrapper，可把 Shapefile、GeoPackage 等大量 GIS 矢量数据格式映射为外部表直接查询。支持部分条件下推与基于 && 的边界框过滤。

## geoip

`—-d–` | `0.4.0` | `18` `17` `16` | [`52🌟`](https://github.com/tvondra/geoip)

基于 IP 地址查询地理位置，输入 IP 即可得到国家、城市和 GPS 等信息。IP 数据需自行提供 MaxMind GeoLite 等数据集，并依赖 ip4r 扩展。

## pg_polyline

`–s-d–` | `0.0.1` | `18` `17` `16` | [`4🌟`](https://github.com/yihong0618/pg_polyline)

在 PostgreSQL 中快速编码和解码 Google Encoded Polyline，便于把地图路径以紧凑文本存储和传输。基于 Rust 的 pgrx 框架实现，兼容 PostgreSQL 13 至 18 版本，适合在数据库中直接处理轨迹数据。

## pg_eviltransform

`–s-d-r` | `0.0.7` | `18` `17` `16` | [`12🌟`](https://github.com/aiyou178/pg_eviltransform)

为 PostGIS 提供 GCJ02、BD09 与 CGCS2000 坐标系之间的转换，可配合 ST_Transform 使用，并提供精确的 Jenks 自然断点分级。常用于国内地图坐标纠偏与分级统计。

## pg_geohash

`–s-d-r` | `1.0` | `18` `17` `16` | [`17🌟`](https://github.com/jistok/pg_geohash)

用 C 实现的 geohash 函数，可由经纬度生成 geohash、再由 geohash 反算经纬度，并按哈希前缀把区域划分成若干分区做地理聚合。除 PostgreSQL 外也支持 Greenplum 和 HAWQ。

## pghydro

`—-d–` | `6.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

扩展 PostGIS/PostgreSQL，提供河网流向判定、Pfafstetter 流域编码、上下游河段选取、至河口距离、上游汇水面积、河流等级与流域分级等分析功能，用于水资源决策支持。

## pgh_raster

`—-d–` | `6.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

PgHydro 套件的栅格组件，用 PostGIS Raster 存储由数字高程模型派生的高程、流向、汇流累积量等水文栅格产品，并提供上下游像元查询，为河网提取与水资源分析提供栅格基础。

## pgh_hgm

`—-d–` | `2.2.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

PgHydro 的水文地貌计算扩展，基于 pghydro 与 pgh_raster 的数据计算流域和河段的地貌参数，如河网密度、形状系数、曲折度、比降、汇流时间与高程剖面，用于水文与水资源分析。

## pgh_output

`—-d–` | `6.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

PgHydro 的输出扩展，建立 GEOF BHO 标准的排水线、集水区、水系、排水节点与岸线导出表，并通过更新函数把河网分析结果写入其中，用于按统一结构导出河网数据。

## pgh_output_en_au

`—-d–` | `6.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

PgHydro 输出扩展的英文（澳大利亚）版本，在独立 schema 中建立以英文命名的 GEOF BHO 排水线、集水区与排水节点导出表，用于按英文数据结构输出河网分析结果。

## pgh_output_pt_br

`—-d–` | `6.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

PgHydro 输出扩展的葡萄牙文（巴西）版本，在独立 schema 中建立以葡文命名的 GEOF BHO 导出表，如 trecho_drenagem、area_drenagem，用于输出河网分析结果。

## pgh_consistency

`—-d–` | `6.6` | `18` `17` `16` | [`47🌟`](https://github.com/pghydro/pghydro)

PgHydro 系列扩展中负责河网数据一致性的部分，运行在 PostgreSQL/PostGIS 之上，用于构建拓扑正确的河流网络并校核水系对象之间的约束关系。适合水资源决策中的流域编码与河网分析场景。

## mobilitydb

`–sLd–` | `1.3.1` | `18` `17` `16` | [`635🌟`](https://github.com/MobilityDB/MobilityDB)

基于 PostgreSQL 与 PostGIS 的移动对象时空数据库扩展，为 GPS 轨迹等移动对象轨迹增加时态与时空数据类型支持。主要用于轨迹数据的管理、查询与分析。

## mobilitydb_datagen

`—-d-r` | `1.3.1` | `18` `17` `16` | [`635🌟`](https://github.com/MobilityDB/MobilityDB)

随 MobilityDB 一同提供的辅助扩展，用于生成移动对象轨迹数据，便于在 PostgreSQL 中构造演示与测试用的时空数据集。

## tzf

`–s-d–` | `0.3.1` | `18` `17` `16` | [`8🌟`](https://github.com/ringsaturn/pg-tzf)

根据 GPS 经纬度坐标快速查询所在时区名称的扩展，底层基于 tzf-rs 实现，支持单点与批量坐标查询。常用于按位置为轨迹或地理数据补全时区信息。

## qdgc

`—-dtr` | `0.1.0` | `18` `17` `16` | [`–`](https://pgxn.org/dist/qdgc/0.1.0/)

在数据库内编码、解码和导航 Extended Quarter Degree Grid Cell（QDGC）网格编码的扩展，核心为无依赖的纯 SQL 且标记为 trusted，另附 PostGIS 几何与地理类型绑定。适用于按网格单元组织与检索地理观测数据。

## qdgc_postgis

`—-d-r` | `0.1.0` | `18` `17` `16` | [`–`](https://pgxn.org/dist/qdgc/0.1.0/)

为 QDGC 网格编码提供 PostGIS 绑定：在数据库中编码、解码并导航 Extended Quarter Degree Grid Cell 代码，将结果映射为 geometry 与 geography，并支持四叉树区域填充。

# RAG

## vector

`–s-d-r` | `0.8.7` | `18` `17` `16` | [`23.7k🌟`](https://github.com/pgvector/pgvector)

在 Postgres 中存储向量并进行精确与近似最近邻搜索，支持单精度、半精度、二值与稀疏向量以及 L2、内积、余弦等多种距离，常用于 RAG 与语义搜索。

## vchord

`–sLd-r` | `1.3.0` | `18` `17` `16` | [`–`](https://vchord.pgsty.com/docs/vchord/)

基于 RaBitQ 量化实现可扩展、快速且对磁盘友好的向量相似度搜索，用于在 PostgreSQL 中承载大规模向量索引与检索，适合 RAG 等场景。

## vectorscale

`–s-d–` | `0.9.1` | `18` `17` `16` | [`3.2k🌟`](https://github.com/timescale/pgvectorscale)

在 pgvector 之上提供更高性能的向量检索，引入受 DiskANN 启发的 StreamingDiskANN 索引、统计二值量化压缩以及基于标签过滤的向量搜索，面向大规模 AI 应用。

## vectorize

`–sLd–` | `0.27.1` | `18` `17` `16` | [`835🌟`](https://github.com/ChuckHend/pg_vectorize)

自动将文本转换为 embedding 并编排 LLM 调用，在 Postgres 上提供语义搜索、全文搜索与混合搜索，帮助快速构建 RAG 与检索引擎。

## pg_similarity

`–s-d-r` | `1.0` | `18` `17` `16` | [`402🌟`](https://github.com/eulerto/pg_similarity)

在 PostgreSQL 中提供相似度查询能力，内置多种文献中的字符串相似度算法函数，并封装成 ~~~、~!~ 等操作符替代等值比较，配合可运行时设置的会话变量控制匹配阈值，适合模糊匹配与文本去重。

## pg_rrf

`–s-d–` | `0.0.3` | `18` `17` `16` | [`3🌟`](https://github.com/yuiseki/pg_rrf)

实现 Reciprocal Rank Fusion（RRF）算法，用于混合检索的分数融合。提供 rrf、rrf3、rrf_fuse、rrfn 等函数，可将多路检索的排名合并成统一排序，免去手写 FULL OUTER JOIN 加 COALESCE 的拼接逻辑。

## smlar

`–s-d-r` | `1.0` | `18` `17` `16` | [`129🌟`](https://github.com/jirutka/smlar)

用于数组之间高效相似度搜索的扩展。提供 smlar 函数计算两个同类型数组的相似度，支持自定义公式和带权重的复合类型，并提供 % 操作符在相似度超过阈值时返回真，常用于标签、集合类数据的相似匹配。

## pg_summarize

`–s-d–` | `0.0.1` | `18` `17` `16` | [`6🌟`](https://github.com/HexaCluster/pg_summarize)

用 Rust 和 pgrx 编写的 PostgreSQL 扩展，通过调用 OpenAI 的模型在数据库内对文本做摘要，并附带一个示例函数演示扩展开发。适合需要在 SQL 中直接调用 LLM 生成文本摘要的场景。

## pg_tiktoken

`–s-d–` | `0.0.1` | `18` `17` `16` | [`52🌟`](https://github.com/kelvich/pg_tiktoken)

在 PostgreSQL 中使用 OpenAI 的 tiktoken 对文本做分词。提供 tiktoken_count 和 tiktoken_encode 函数，第一个参数可传编码名或 OpenAI 模型名，便于在库内统计 token 数量、校验上下文长度。

## pg_tiktoken_c

`–s-d–` | `1.1` | `18` `17` `16` | [`3🌟`](https://github.com/relytcloud/pg_tiktoken_c)

用纯 C 实现把 OpenAI 的 tiktoken BPE 分词器带入 SQL，支持 cl100k_base、o200k_base 等编码和模型名别名。可在调用 OpenAI API 前统计 token 数量、控制 RAG 上下文长度，或把 token 数组随文本一起存储。

## pg_grammar_guard

`—-d–` | `0.4.9` | `18` `17` `16` | [`1🌟`](https://github.com/Manuelreyesbravo/pg_grammar_guard)

从数据库实时 catalog 编译出 token 级语法，可输出给 llama.cpp 等支持 GBNF 的采样器，使模型无法生成不存在的表名、列名或取值。适用于约束 LLM 生成 SQL 的场景，并能检测已批准的语法是否因迁移而失效。

## jev

`—-d–` | `0.2.1` | `17` `16` | [`1.3k🌟`](https://github.com/realZachi/pg-jev)

用自然语言条件筛选、排序和分类表中的行，由 TypeSafe 的 Jev 模型返回校准概率而非生成文本，无需索引或向量列。jev() 是普通布尔函数，可与 WHERE、JOIN、GROUP BY、ORDER BY 等 SQL 子句自由组合。

## pg4ml

`—-d–` | `2.0` | `18` `17` `16` | [`–`](https://gitee.com/guotiecheng/plpgsql_pg4ml)

用 PL/pgSQL 在 PostgreSQL 内部实现的机器学习框架，提供矩阵基础运算以及分类、回归、神经网络、聚类和科学计算等函数库。README 以 MNIST 手写数字数据集和 LeNet-5 模型的构建与训练作为示例。

## pgml

`–sLdt-` | `2.10.0` | `17` `16` | [`6.8k🌟`](https://github.com/postgresml/postgresml)

PostgresML 把机器学习与 AI 推理直接放进 PostgreSQL，支持 GPU 加速、集成 Hugging Face 与 OpenAI 等提供方的 LLM，并提供 chunk、embed、rank 等 RAG 流水线函数。目的是省去独立系统与数据搬运，在数据所在处完成训练和推理。

## pgmnemo

`—-dt-` | `0.21.0` | `18` `17` | [`8🌟`](https://github.com/pgmnemo/pgmnemo)

为编码 agent 提供持久化记忆，把调试中总结的经验连同来源信息写入 PostgreSQL 并建立混合检索索引，使新会话能直接召回既有结论而无需重复排查。适合多 agent 跨会话共享知识。

## pgcontext

`–s-d–` | `0.3.0` | `18` `17` | [`–`](https://pgxn.org/dist/pgcontext/0.3.0/)

在 PostgreSQL 的权威数据表上提供精确向量搜索、持久化 HNSW 索引、带元数据过滤的 ANN 查询以及混合检索，数据仍以 PostgreSQL 为唯一来源。适合在库内直接完成向量检索与 RAG。

## pg_turbovec

`–s-d–` | `2.15.0` | `18` `17` `16` | [`–`](https://codeberg.org/gregburd/pg_turbovec)

基于 Google Research 的 TurboQuant 算法为 PostgreSQL 提供向量相似度搜索，量化过程无需训练、无需遍历数据，可直接用于向量的压缩与近邻检索。

## pg_vectorsearch

`–s-d–` | `0.1.0` | `18` | [`446🌟`](https://github.com/timescale/pg_vectorsearch)

为 PostgreSQL 提供高性能近似最近邻搜索，核心是面向亿级向量的 PRISM 索引，配合 RaBitQ 量化与 SIMD 距离计算，并可直接为已有的 pgvector vector 与 halfvec 列建索引。目前处于 alpha 阶段。

# FTS

## pg_search

`–sLd–` | `0.26.6` | `18` `17` `16` | [`9.5k🌟`](https://github.com/paradedb/paradedb/tree/main/pg_search)

ParadeDB 提供的全文检索扩展，让 PostgreSQL 在同一实例内同时承担应用数据存储与全文搜索、向量检索和聚合查询，无需再额外部署独立搜索引擎。

## pgroonga

`-bs-d–` | `4.1.0` | `18` `17` `16` | [`762🌟`](https://github.com/pgroonga/pgroonga)

把 Groonga 作为索引接入 PostgreSQL，为所有语言提供高速全文检索能力，可用于多语言内容的模糊匹配与关键词搜索。

## pgroonga_database

`–s-d–` | `4.1.0` | `18` `17` `16` | [`762🌟`](https://github.com/pgroonga/pgroonga)

PGroonga 项目的配套扩展，用于在 PostgreSQL 内管理 Groonga 数据库，配合 PGroonga 实现多语言全文检索。

## pg_bigm

`–sLd-r` | `1.2` | `18` `17` `16` | [`159🌟`](https://github.com/pgbigm/pg_bigm)

为 PostgreSQL 提供全文检索能力，通过创建 2-gram（bigram）索引加速全文搜索，适合模糊匹配与子串查询场景。

## vgram

`–s-d-r` | `1.0` | `18` `17` `16` | [`12🌟`](https://github.com/akorotkov/vgram)

实现可变长度 q-gram 的索引与统计。相比 pg_trgm 固定 3-gram 的做法，它用 qgram_stat() 统计词频，通过 vgram_gin_ops 操作符类只索引频率较低的 q-gram，从而减少冗余索引项。

## zhparser

`–s-d-r` | `2.3` | `18` `17` `16` | [`873🌟`](https://github.com/amutu/zhparser)

基于 SCWS 中文分词实现的中文全文检索解析器，可为 PostgreSQL 建立中文文本搜索配置，用于中文内容的检索与分词调试。

## pg_bestmatch

`–sLd–` | `0.0.2` | `18` `17` `16` | [`98🌟`](https://github.com/tensorchord/pg_bestmatch.rs)

在 PostgreSQL 内部为文本生成 BM25 统计稀疏向量。它通过物化视图维护语料统计，提供创建统计信息、文档与查询转向量的函数，再以点积打分，配合 pgvector 或 pgvecto.rs 做检索，常用于 RAG 场景下的关键词召回。

## vchord_bm25

`–sLd-r` | `1.1.0` | `18` `17` `16` | [`–`](https://vchord.pgsty.com/docs/bm25/)

为 PostgreSQL 提供原生 Okapi BM25 排序索引与 Block-WeakAnd 全文检索。它解决关键词检索中按相关度排序的问题，可对文本列建立 BM25 索引并高效返回 top-k 结果，适合需要传统全文搜索能力的场景。

## pg_tokenizer

`–sLd–` | `1.1.0` | `18` `17` `16` | [`–`](https://vchord.pgsty.com/docs/tokenizer)

为 PostgreSQL 提供可配置的文本分词与分析能力。它支持文本分析器、字符与 token 过滤器，以及预训练和自定义模型，可实现多语言分词，常作为全文检索与 BM25 索引的前置组件使用。

## biscuit

`–s-d–` | `3.1.0` | `18` `17` `16` | [`303🌟`](https://github.com/CrystallineCore/Biscuit)

面向 LIKE 与 ILIKE 模式匹配的 PostgreSQL 索引访问方法。它以位图记录每个字符在各位置的出现情况，通过位图交并运算评估模式，支持多列索引和可归约为 glob 的正则表达式，擅长处理前缀锚定、下划线通配符和字符串长度等与位置相关的查询。

## pg_textsearch

`–sLd–` | `1.5.1` | `18` `17` | [`4.1k🌟`](https://github.com/timescale/pg_textsearch)

为 PostgreSQL 提供按 BM25 相关度排序的全文检索。它使用简洁的 ORDER BY 语法查询，支持可调的 k1 与 b 参数、表达式索引、部分索引和分区索引，并通过 Block-Max WAND 加速 top-k 查询，适合需要现代相关度排序的文本搜索场景。

## pg_pinyin

`–s-d-r` | `0.0.8` | `18` `17` `16` | [`14🌟`](https://github.com/aiyou178/pg_pinyin)

把中文按单字或按词转换为拼音的 PostgreSQL 扩展。提供 pinyin_char_romanize 与 pinyin_word_romanize 等函数，便于对中文文本做拼音检索与排序。

## pg_kazsearch

`–s-d–` | `2.3.0` | `18` `17` `16` | [`30🌟`](https://github.com/darkhanakh/pg-kazsearch)

为 PostgreSQL 提供哈萨克语全文检索能力的扩展，内含哈萨克语词干提取器。哈萨克语属黏着语，词干提取可让同一词根的不同词形归并为同一索引词，明显提升检索召回率。

## psql_bm25s

`–s-d–` | `0.4.14` | `18` `17` | [`202🌟`](https://github.com/Intelligent-Internet/Evoke)

为 PostgreSQL 提供 BM25 全文检索索引的扩展（Evoke），并可在同一索引内融合稀疏语义检索。词法精确排序与语义召回通过同一 SQL 接口、同一张关系表完成。

## pg_fts

`–s-dtr` | `1.16.0` | `18` `17` | [`–`](https://codeberg.org/gregburd/pg_fts)

为 PostgreSQL 实现完整 BM25 索引访问方法的扩展，支持 WAND/MaxScore 排序扫描。采用分段式 Lucene 风格存储，并具备崩溃安全、并行构建与合并、tombstone 等特性。

## pg_cjk_parser

`–s-d-r` | `0.1.0` | `18` `17` `16` | [`41🌟`](https://github.com/huangjimmy/pg_cjk_parser)

派生自 PostgreSQL 默认全文检索解析器的扩展，在数据库使用 UTF-8 编码时把中日韩文字切分为 2-gram 词元，其余语言仍按默认方式切分。另提供 cjk_zht2zhs 函数把繁体中文转换为简体。

## pg_jieba

`–s-d-r` | `1.1.0` | `18` `17` `16` | [`427🌟`](https://github.com/jaiminpan/pg_jieba)

为 PostgreSQL 提供中文全文检索能力，基于 cppjieba 实现中文分词与词性标注。可配合 jieba、jiebamp、jiebahmm 等分词配置使用。

## acdat

`–s-d–` | `0.1.1` | `18` `17` `16` | [`663🌟`](https://github.com/pgsty/acdat)

将大量精确字面量模式一次性编译为 Aho-Corasick 自动机并装入双数组 Trie，对每个 text 或 bytea 值只扫描一遍。用于敏感词与策略规则检测、IOC 与哈希等固定签名扫描、日志分类路由和大规模实体词典匹配。

## addressing_dictionary

`—-d-r` | `1.1` | `18` `17` `16` | [`59🌟`](https://github.com/pramsey/pgsql-addressing-dictionary)

为地址数据提供全文检索词典，内置 street type 缩写、方向标记和 first/1st 之类的数字街道变体，解决默认分词配置无法把“12 N Oak st”与“12 North Oak Street”匹配的问题。适合在单城市或州范围内搭建快速的地址查找与自动补全。

## hunspell_cs_cz

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供捷克语 Hunspell 词典，安装后即可创建 hunspell_cs_cz 扩展并用于捷克语文本的分词与词形归并。属于 postgrespro 维护的多语言 Hunspell 词典集合之一。

## hunspell_de_de

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供德语 Hunspell 词典，安装后即可创建 hunspell_de_de 扩展并用于德语文本的分词与词形归并。属于 postgrespro 维护的多语言 Hunspell 词典集合之一。

## hunspell_en_us

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供 Hunspell 英语（美国）词典，安装后可在文本搜索配置中启用该词典，用于英文单词的词形归并与搜索匹配。

## hunspell_fr

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供 Hunspell 法语词典，安装后可在文本搜索配置中启用，用于法语文本的词形归并与检索匹配。

## hunspell_ne_np

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供 Hunspell 尼泊尔语词典，安装后可在文本搜索配置中加载，用于尼泊尔语文本的分词与检索匹配。

## hunspell_nl_nl

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供 Hunspell 荷兰语词典，安装后可在文本搜索配置中使用，改善荷兰语文本的词形归并与搜索效果。

## hunspell_nn_no

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供 Hunspell 挪威语（尼诺斯克）词典，安装后可在文本搜索配置中启用，用于挪威语文本的检索匹配。

## hunspell_pt_pt

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供葡萄牙语（葡萄牙）的 Hunspell 词典，安装后创建扩展即可使用对应的词典与文本搜索配置，用于葡萄牙语文本的分词和检索。

## hunspell_ru_ru

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供俄语 Hunspell 词典，安装并创建扩展后即可使用对应的俄语词典和文本搜索配置，改善俄语文本的分词与检索效果。

## hunspell_ru_ru_aot

`—-d-r` | `1.0` | `18` `17` `16` | [`68🌟`](https://github.com/postgrespro/hunspell_dicts)

为 PostgreSQL 全文检索提供俄语 Hunspell 词典的另一个版本（AOT），同样在安装后创建扩展，即可使用该俄语词典与配套的文本搜索配置。

## textsearch_intl

`–s-d-r` | `1.0` | `18` `17` `16` | [`1🌟`](https://github.com/benjaminsanborn/textsearch_intl)

面向多语言短文本的全文检索组件，intl 解析器借助 ICU 断词规则切分中文、日文、泰文等无空格文字，并提供归一化词典、ngram 词典和三套现成配置。

## pg_icu_parser

`–s-d-r` | `1.0` | `18` `17` `16` | [`4🌟`](https://github.com/IgKh/pg_icu_parser)

使用 ICU 边界分析实现的 PostgreSQL 全文检索解析器，适用于中文、日文、韩文等词间不空格的语言以及希伯来文等场景，可替代默认解析器得到更合理的分词结果。

## tin

`–s-d–` | `1.0.6` | `18` `17` | [`168🌟`](https://github.com/planetscale/lead)

一个刻意面向非生产环境的 Postgres 全文搜索扩展，用于在开发、测试、CI 和预发布环境中运行兼容 TIN 的应用 SQL。它优先保证正确性而非查询性能，索引不存储搜索数据，不适合生产负载。

## stannum

`–s-d–` | `0.1.0` | `18` `17` | [`10🌟`](https://github.com/TeamSpringbird/stannum)

用 Rust 和 pgrx 编写的 PostgreSQL 全文搜索索引，实现 TIN 接口，支持 ==> 操作符、TINQL 查询语言、BM25 排序和高亮。它由 Lead 分支而来，改用面向超出内存规模语料的分段索引。

## pg_tre

`–s-d–` | `4.6.2` | `18` `17` | [`–`](https://codeberg.org/gregburd/pg_tre)

基于 TRE 正则库的 PostgreSQL 索引类型，支持近似（模糊）匹配。编辑距离实际上衡量了索引内容与给定正则表达式的相似度，因此用法类似向量索引。

# OLAP

## citus

`–sLd–` | `14.3.0` | `18` `17` `16` | [`12.9k🌟`](https://github.com/citusdata/citus)

把 PostgreSQL 变成分布式数据库的扩展。它支持分布式表分片、复制到所有节点的参考表、跨集群路由并并行执行查询的分布式查询引擎，以及列式存储，适合多租户应用、实时分析和时序或 IoT 数据。

## citus_columnar

`–s-d–` | `14.3.0` | `18` `17` `16` | [`12.9k🌟`](https://github.com/citusdata/citus)

Citus 提供的列式存储能力，可压缩数据、加速扫描并支持快速投影，既可用于普通表也可用于分布式表，常用于分析型查询场景。

## columnar

`–s-d–` | `1.1.2` | `16` | [`3.0k🌟`](https://github.com/hydradatabase/columnar)

为 PostgreSQL 提供原生列式存储与向量化执行能力。数据默认以列式格式加载，配合查询并行、列级缓存等手段加速聚合、过滤和批量导入等分析型负载。

## pg_duckdb

`–sLd–` | `1.2.0` | `18` `17` `16` | [`3.3k🌟`](https://github.com/duckdb/pg_duckdb)

将 DuckDB 的列式向量化分析引擎集成进 PostgreSQL，无需改写 SQL 即可加速现有分析查询。支持直接从 S3、GCS、Azure、R2 读写 Parquet、CSV、JSON、Iceberg 和 Delta Lake 数据。

## pg_mooncake

`–sLd–` | `0.3.0` | `18` `17` `16` | [`1🌟`](https://github.com/pgsty/pg_mooncake)

为 PostgreSQL 表在 Apache Iceberg 中建立实时列存镜像，实现亚秒级向量化分析查询。依托 moonlink 实时摄取与 pg_duckdb 透明查询路由，面向 Postgres 表上的实时分析场景。

## storage_engine

`–sLd–` | `2.4.0` | `18` `17` `16` | [`32🌟`](https://github.com/saulojb/storage_engine)

提供 colcompress 与 rowcompress 两种高性能表访问方法，分别面向列式压缩与行式批量压缩存储，适用于分析与 HTAP 负载。可与普通堆表共存，在显著节省存储的同时不明显损失查询性能。

## pg_clickhouse

`–s-d-r` | `0.11` | `18` `17` `16` | [`301🌟`](https://github.com/ClickHouse/pg_clickhouse)

在 PostgreSQL 中直接查询 ClickHouse 数据，无需改写 SQL 即可把分析查询下推到 ClickHouse 执行。支持查询下推与外部扫描，适合在 Postgres 侧统一访问 ClickHouse 的分析场景。

## duckdb_fdw

`–s-d-r` | `2.0.2` | `18` `17` `16` | [`415🌟`](https://github.com/alitrack/duckdb_fdw)

基于 DuckDB C API 实现的 PostgreSQL 外部数据包装器，让 Postgres 直接查询 DuckDB 的向量化分析能力。适用于 Parquet、Iceberg、S3 Tables、DuckLake、MotherDuck 等 Lakehouse 场景，并支持事务与子事务管理。

## pg_parquet

`–sLd–` | `0.5.1` | `18` `17` `16` | [`697🌟`](https://github.com/CrunchyData/pg_parquet/)

让 PostgreSQL 通过 COPY TO/FROM 直接读写 Parquet 文件，数据可位于 S3、Azure Blob Storage、Google Cloud Storage、http(s) 端点或本地文件系统。基于 Apache Arrow 与 pgrx 实现，还支持从 Parquet 建表、查看 schema 与元数据以及流式复制。

## pg_ducklake

`–sLd–` | `1.0.3` | `18` `17` `16` | [`150🌟`](https://github.com/relytcloud/pg_ducklake)

在 PostgreSQL 中提供由 DuckDB 与 DuckLake 驱动的原生湖仓表，可用 SQL 创建、写入和查询。支持时间旅行、事务、分区与排序键，也能与普通堆表做混合查询，并让 DuckDB 客户端直接读取这些表。

## pg_fkpart

`—-d–` | `1.7.0` | `18` `17` `16` | [`5🌟`](https://github.com/lemoineat/pg_fkpart)

按照表的外键关系对表进行分区的 PostgreSQL 扩展，在 pgfkpart schema 中提供 SQL 函数与记录已分区表的清单表，用 partition_with_fk 按指定外键完成分区。

## pg_partman

`-bs-d–` | `5.5.0` | `18` `17` `16` | [`2.9k🌟`](https://github.com/pgpartman/pg_partman)

创建和管理基于时间或数字的声明式分区集的 PostgreSQL 扩展，可自动新增子分区并按保留策略删除旧分区。它还支持把已有表转为分区表或反向转换，并自带后台工作进程在无需外部 cron 的情况下执行维护。

## plproxy

`–s-d–` | `2.12.0` | `18` `17` `16` | [`198🌟`](https://github.com/plproxy/plproxy)

以 PostgreSQL 过程语言处理器的形式实现数据库之间的远程过程调用，并可选支持分片。用 CLUSTER 或 CONNECT 指定目标数据库，再用 RUN ON ALL、RUN ON ANY 或哈希映射决定在哪些节点上执行同名函数。

## pg_strom

`-bsLd–` | `6.1` | `18` `17` `16` | [`1.4k🌟`](https://github.com/heterodb/pg-strom)

借助 GPU、NVMe SSD 和 Apache Arrow 列式存储加速 PostgreSQL 的批量处理与分析型查询负载。适用于以扫描和聚合为主的 OLAP 场景。

## pg_orca

`–sLd–` | `1.0.0` | `18` | [`12🌟`](https://github.com/quantumiodb/pgorca)

把源自 Greenplum 和 Apache Cloudberry 的 ORCA 查询优化器接入单机 PostgreSQL。ORCA 采用 Cascades 风格基于代价的搜索，在 memo 中保存等价计划并用转换规则改写，能够处理关联子查询等内置规划器难以优化的查询。

## pg_sorted_heap

`–sLd–` | `0.14.0` | `18` `17` `16` | [`62🌟`](https://github.com/skuznetsov/pg_sorted_heap)

提供按主键物理排序的表访问方法，并通过每页 zone map 跳过无关数据块来减少扫描量。还包含向量类型以及接入规划器的 HNSW 索引，用于近似最近邻检索。

## pg_lake

`-bsLd–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake)

把 Iceberg 表和对象存储中的数据文件集成进 PostgreSQL，使其可作为独立的 lakehouse 使用。可以直接创建和修改 Iceberg 表，查询或导入 S3 上的 Parquet、CSV、JSON 数据，并用 COPY 将查询结果导出回对象存储。

## pg_extension_base

`–sLd–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_extension_base)

为 PostgreSQL 扩展开发提供通用基础设施，解决自动加载扩展、管理扩展生命周期后台 worker、创建与更新依赖等难题，简化需要预加载模块或后台 worker 的扩展部署。

## pg_extension_updater

`–sLd–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_extension_updater)

在数据库启动时为其中每个已安装扩展执行 ALTER EXTENSION UPDATE，让 PostgreSQL 自动跟进新的扩展安装，降低 SQL 与二进制版本不匹配的风险；更新失败仅记录警告且只尝试一次。

## pg_map

`–s-d–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_map)

用键值对数组在 PostgreSQL 中模拟 key/value map，键和值可使用任意内置或用户创建的数据类型；使用时声明新的 map 类型，并自动生成配套类型与操作函数，适合半结构化数据。

## pg_lake_engine

`–sLd–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_lake_engine)

把 Iceberg 表和数据湖文件接入 PostgreSQL，使其可作为独立 lakehouse 使用，在事务保障下查询和修改 Iceberg 表，并直接读取 S3 等对象存储中的 Parquet、CSV、JSON 文件。

## pg_lake_iceberg

`–s-d–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_lake_iceberg)

为 pg_lake 提供 Iceberg 表能力，可直接在 PostgreSQL 中创建和修改 Iceberg 表并享有完整事务保证，同时这些表也能被其他引擎查询，便于构建开放格式的 lakehouse。

## pg_lake_table

`–sLd–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_lake_table)

为 PostgreSQL 提供 Iceberg 表访问能力的扩展，可直接创建和修改 Iceberg 表并具备完整事务保证，同时也能把堆表与外部数据文件放在同一查询中处理，适合把 Postgres 当作独立 lakehouse 使用。

## pg_lake_copy

`–sLd–` | `3.6` | `18` `17` `16` | [`1.7k🌟`](https://github.com/Snowflake-Labs/pg_lake/tree/main/pg_lake_copy)

为 PostgreSQL 的 COPY 命令增加对象存储读写能力的扩展，可将查询结果导出为 Parquet、CSV 或 JSON 文件写入 S3 等对象存储，也能从其中导入数据，便于与数据湖交换数据。

## pg_table_range

`–s-d–` | `0.1.2` | `18` `17` `16` | [`2🌟`](https://github.com/bitner/pg_table_range)

在查询规划阶段按分区的实际数据范围裁剪分区的扩展，依据每个分区各列的 min/max 或空间范围摘要工作，因此能处理原生分区裁剪无法消除的非分区键列条件，裁剪保守且结果与不启用时一致。

## pg_improv

`–s-d–` | `0.14.0` | `18` `17` `16` | [`–`](https://codeberg.org/gregburd/improv)

用 Rust 实现的多维电子表格引擎，采用 differential dataflow 与以 datom 为中心的存储模型，可以看作现代化版本的 Lotus Improv，项目包含 PLpgSQL 组件，可用于在数据库侧进行多维数据分析。

# FEAT

## age

`–sLd–` | `1.8.0` | `18` `17` | [`5.0k🌟`](https://github.com/apache/age)

让 PostgreSQL 同时具备图数据库能力的扩展，在同一份存储上支持标准 ANSI SQL 与 openCypher 图查询语言，可在关系数据之上做图建模、复杂关系查询与实时图分析。

## pg_liquid

`–s-d–` | `0.1.7` | `18` `17` `16` | [`3🌟`](https://github.com/michael-golfi/pg_liquid)

把 Liquid 风格的图查询语言映射到 PostgreSQL 存储与执行，提供 liquid.query 等函数，支持断言、命名 compound、递归规则与行规范化器，用于在数据库内运行图查询程序。

## onesparse

`–sLd–` | `0.1.0` | `18` | [`409🌟`](https://github.com/OneSparse/OneSparse)

借助 SuiteSparse:GraphBLAS 与 LAGraph 在 PostgreSQL 中实现加速的稀疏线性代数运算，适合处理大规模稀疏矩阵与图分析类负载。

## graph

`–s-d–` | `1.2.1` | `18` `17` `16` | [`1.1k🌟`](https://github.com/evokoa/pggraph)

为已有 PostgreSQL 数据提供图数据库能力，基于普通表构建派生图索引，并通过 graph schema 下的函数执行图搜索、遍历、最短路径和关系查询，原始表仍是事实来源。

## pgrdf

`–sLd–` | `0.6.40` | `18` `17` `16` | [`23🌟`](https://github.com/styk-tv/pgRDF)

用 Rust 编写的 PostgreSQL 扩展，可加载 RDF、以 SPARQL 1.1 查询更新、用 OWL 2 RL 或 RDFS 推理、以 SHACL 校验，并提供指纹与导出，操作均以 SQL 函数调用。

## pg_warren

`–s-dt-` | `0.8.0` | `18` `17` `16` | [`0🌟`](https://github.com/ExaDev/pg_warren)

从普通表的两条 SQL 查询构建内存驻留的 CSR 图结构，通过 warren.* 函数提供 BFS、可达性、最短路径、PageRank、标签传播等遍历与全图计算，结果可再与 SQL 关联。

## pgq

`–s-d–` | `3.5.2` | `18` `17` `16` | [`427🌟`](https://github.com/pgq/pgq)

提供基于 SQL 函数的通用高性能无锁队列。用于在 PostgreSQL 内部实现事件队列与异步任务分发。

## pgmq

`—-d–` | `1.13.1` | `18` `17` `16` | [`5.4k🌟`](https://github.com/pgmq/pgmq)

在 PostgreSQL 内部实现的轻量级消息队列，类似 AWS SQS 和 RSMQ，无需后台 worker 或外部依赖。提供可见性超时、FIFO 分组有序消费以及消息归档保留，适合应用间的异步消息传递。

## pgmb

`—-d–` | `1.0.0` | `18` `17` `16` | [`3🌟`](https://github.com/fraruiz/pgmb)

构建在 PostgreSQL 内部的轻量级消息代理，支持将 HTTP 端点注册为 worker 并按路由键分发消息。具备自动重试、指数退避、死信队列和延迟投递，依赖 pg_cron 与 http 扩展完成异步派发。

## ulak

`–sLd–` | `0.2.0` | `18` `17` `16` | [`17🌟`](https://github.com/zeybek/ulak)

实现事务性发件箱模式的扩展，让消息入队与业务数据在同一事务中原子提交，解决双写问题。由后台 worker 异步投递到 HTTP、Kafka、MQTT、Redis、AMQP 或 NATS，并内置重试、熔断与死信队列处理。

## fsm_core

`—-d–` | `1.1.0` | `18` `17` `16` | [`1🌟`](https://github.com/pgfsm/fsm/tree/main/packages/database-src-extension/fsm_core)

用于在 PostgreSQL 内运行带版本的有穷状态机，是 FSM 框架的核心部分。以数据库为唯一数据源，配合编译、脚手架生成、校验和集群运行等流程支撑状态机应用。

## pg_statecharts

`—-d–` | `0.1.0` | `18` `17` `16` | [`22🌟`](https://github.com/kronor-io/statecharts)

在 PostgreSQL 内部实现的状态图（statechart）解释器，用数据定义层级状态机、发送事件并由数据库执行状态迁移，支持复合状态、并行区域、on_entry/on_exit 回调与自动 done 事件。适合直接在库内驱动订单、审批等业务流程的状态流转。

## pg_statecharts_dev

`—-d–` | `0.1.0` | `18` `17` `16` | [`22🌟`](https://github.com/kronor-io/statecharts)

pg_statecharts 的开发版本，同样在 PostgreSQL 内部提供 statechart 解释器，可把层级状态机定义为数据并发送事件驱动迁移，支持复合状态、并行区域与入/出状态回调，便于在开发环境中试用和验证。

## hll

`–s-d–` | `2.21` | `18` `17` `16` | [`1.2k🌟`](https://github.com/citusdata/postgresql-hll)

引入 HyperLogLog 数据类型 hll，用固定大小的类集合结构做可调精度的去重计数，1280 字节即可估算数十亿个不同值且误差仅百分之几。常用于 UV、独立访客等大规模基数统计。

## rum

`–s-d-r` | `1.3.15` | `18` `17` `16` | [`849🌟`](https://github.com/postgrespro/rum)

基于 GIN 代码实现的 RUM 索引访问方法，在 posting tree 中额外保存位置等信息，解决 GIN 全文检索缺少位置数据的问题。可加速相关性排序、短语搜索和按时间戳排序，并支持深度优先检索以尽早返回首批结果。

## pg_lion

`–s-d-r` | `0.3.0` | `18` `17` `16` | [`6🌟`](https://github.com/cgkanchi/pg_lion)

受 roaring bitmap 启发的压缩位图倒排索引，为每个不同值记录持有它的行集合，使 count、过滤和 GROUP BY 等查询多数可直接由索引回答。也适用于数组、jsonb 和 tsvector 等文档类型，并可配合 BTree 索引完成排序。

## pg_lion_citext

`—-d-r` | `0.3.0` | `18` `17` `16` | [`6🌟`](https://github.com/cgkanchi/pg_lion)

面向 citext 大小写不敏感文本的 pg_lion 倒排索引版本，用 roaring bitmap 风格的压缩位图记录每个取值对应的行集合，让大量 count、过滤和 GROUP BY 查询直接由位图运算得出结果，无需逐行访问，在文档类型上也明显快于 GIN。

## pg_lion_vector

`–s-d-r` | `0.3.0` | `18` `17` `16` | [`6🌟`](https://github.com/cgkanchi/pg_lion)

pg_lion 倒排索引的向量版本，把每个不同取值映射到持有该值的行集合压缩位图，用位图组合代替扫描行来加速 count、IN、范围过滤、GROUP BY 和去重查询，也可与 BTree 索引配合分别负责过滤与排序。

## pg_ai_query

`–s-d-r` | `0.1.1` | `18` `17` `16` | [`250🌟`](https://github.com/benodiwal/pg_ai_query)

把自然语言转换成 SQL 的扩展，调用 OpenAI、Anthropic 或 Google Gemini 的模型生成 PostgreSQL 查询，可自动分析库表结构并补全 JOIN、WHERE 与 LIMIT，还能对查询执行 EXPLAIN ANALYZE 并给出性能优化建议，内置防止危险操作与系统表访问的保护。

## pg_ttl_index

`–sLd-r` | `3.0.0` | `18` `17` `16` | [`24🌟`](https://github.com/ibrahimkarimeddin/postgres-extensions-pg_ttl)

为 PostgreSQL 表提供自动 TTL 过期清理能力，后台工作进程按可配置间隔依据时间戳列批量删除过期数据，支持硬删除与软删除、自动建索引、按表设置不同过期时间以及用咨询锁避免任务重叠，适合会话表和临时数据等场景。

## pg_graphql

`–s-d–` | `1.6.3` | `18` `17` `16` | [`3.4k🌟`](https://github.com/supabase/pg_graphql)

根据现有 SQL schema 反射出 GraphQL schema，让任何能连接 PostgreSQL 的语言直接以 GraphQL 查询和变更数据，每张表都会获得可分页的查询入口以及基于外键的关系和批量增删改入口，无需额外服务器或进程。

## pg_jsonschema

`–s-d–` | `0.3.4` | `18` `17` `16` | [`1.2k🌟`](https://github.com/supabase/pg_jsonschema)

为 json 和 jsonb 数据类型提供 JSON Schema 校验，提供 json_matches_schema、jsonb_matches_schema、jsonschema_is_valid 等函数，可用于约束列中数据符合指定 schema。对同一 schema 反复校验时可转换为 jsonschema 类型，复用已编译的校验器。

## jsonschema

`–s-d-r` | `0.1.11` | `18` `17` `16` | [`27🌟`](https://github.com/theory/pg-jsonschema-boon)

在 PostgreSQL 中按 JSON Schema 校验 JSON 和 JSONB 数据。基于 Rust 的 boon 库实现，支持 draft 4、6、7、2019-09 和 2020-12 规范，可用于约束列数据和验证输入。

## is_jsonb_valid

`–s-d–` | `0.1.4` | `18` `17` `16` | [`173🌟`](https://github.com/furstenheim/is_jsonb_valid)

原生 PostgreSQL 扩展，用于校验 jsonb 数据是否符合 JSON Schema。提供 is_jsonb_valid 和 is_jsonb_valid_draft_v7 两个函数，分别按 Draft4 和 Draft7 返回布尔结果，$ref 仅支持根级引用且不支持 format。

## jsquery

`–s-d-r` | `1.2` | `18` `17` `16` | [`710🌟`](https://github.com/postgrespro/jsquery)

面向 jsonb 的查询语言，弥补 PostgreSQL 在嵌套对象和数组中搜索能力的不足，并提供更多支持索引的比较操作符。以类似 tsquery 的 jsquery 数据类型和 @@ 匹配操作符实现，支持 GIN 索引。

## pg_hint_plan

`–sLd–` | `1.8.1` | `18` `17` `16` | [`929🌟`](https://github.com/ossc-db/pg_hint_plan)

通过 SQL 注释中的提示（如 /*+ SeqScan(a) */）调整 PostgreSQL 的执行计划。由于代价优化器可能忽略列间相关性等数据特征，可用它干预计划选择，弥补优化器估算的不足。

## hypopg

`–s-d-r` | `1.4.5` | `18` `17` `16` | [`1.8k🌟`](https://github.com/HypoPG/hypopg)

创建不实际占用 CPU、磁盘等资源的虚拟索引（hypothetical index），用于在不真正建索引的前提下测试查询计划是否会使用某个索引，从而评估索引对问题查询的性能提升。

## index_advisor

`—-d-r` | `0.2.1` | `18` `17` `16` | [`1.7k🌟`](https://github.com/supabase/index_advisor)

针对给定查询推荐能提升执行性能的索引，直接给出 create index 语句，支持 $1 等通用参数、物化视图以及被视图遮蔽的表和列，运行时依赖 hypopg。

## plan_filter

`–sL—` | `1.0.0` | `18` `17` `16` | [`99🌟`](https://github.com/pgexperts/pg_plan_filter)

在语句执行前依据规划器的估算成本进行拦截，可拒绝成本超限的单条语句或限制单个事务的总成本，并支持只过滤 SELECT，帮助管理员阻止代价过高的查询在生产库上执行。

## pg_variables

`–s-d-r` | `1.2.5` | `18` `17` `16` | [`13🌟`](https://github.com/postgrespro/pg_variables)

提供多种类型的会话级变量，变量仅在当前用户会话内存在，可选择设为事务性以随提交或回滚变化，并支持归入 package 分组管理，便于在会话中临时保存数据。

## imgsmlr

`–s-d-r` | `1.0` | `18` `17` `16` | [`264🌟`](https://github.com/postgrespro/imgsmlr)

基于 Haar 小波变换为 PostgreSQL 实现相似图片搜索，让数据库具备图像相似度检索能力，作者将其定位为展示 PostgreSQL 可扩展性的示例扩展。

## pg_ivm

`-bsLd–` | `1.17` | `18` `17` `16` | [`1.5k🌟`](https://github.com/sraoss/pg_ivm)

为 PostgreSQL 提供增量视图维护（IVM）能力。基表被修改时通过 AFTER 触发器只计算并应用变化的增量，而不是像 REFRESH MATERIALIZED VIEW 那样全量重算，从而让物化视图低开销地保持最新。

## pg_incremental

`–s-d–` | `1.6` | `18` `17` `16` | [`232🌟`](https://github.com/CrunchyData/pg_incremental)

在 PostgreSQL 中做快速可靠的增量批处理。用带参数的查询定义 pipeline，创建时处理已有数据，之后周期性只处理新增数据，适合 IoT、时序数据的预聚合汇总表，以及从对象存储加载新文件并保证 exactly once 的场景。

## pg_trickle

`-bsLd–` | `0.108.3` | `18` | [`150🌟`](https://github.com/trickle-labs/pg-trickle)

为 PostgreSQL 18 及以上版本提供可声明、自动刷新的流表（stream table）。用 SQL 查询加调度周期定义流表，基于 Rust 实现的差分数据流做增量视图维护，基表增删改后只传播受影响行的变化，无需轮询或手动 refresh。

## pg_durable

`–sLd–` | `0.2.9` | `18` `17` `16` | [`2.9k🌟`](https://github.com/microsoft/pg_durable)

在 PostgreSQL 内部实现持久化执行（durable execution）。用 SQL 把工作流定义成步骤图，逐步 checkpoint，崩溃、重启或步骤失败后可恢复，让长时间运行的后台任务不必再依赖 cron、队列和状态表来保证可靠。

## pg_disorder

`–sL—` | `0.1.0` | `18` `17` `16` | [`13🌟`](https://github.com/viralpraxis/pg_disorder)

打乱没有 ORDER BY 的顶层 SELECT 返回的行顺序，可确定性地反转或按种子做伪随机排列。用于暴露测试中对“首行就是最先插入的那行”这类物理顺序的隐式假设，不适用于生产环境。

## pg_local_cache

`–sLd–` | `3.1.0` | `18` `17` `16` | [`2🌟`](https://github.com/profundium/pg_local_cache)

通过认证的 RESP2 MGET 协议按主键返回完整行数据，把 PostgreSQL 作为数据源，并在共享内存中保存有容量上限的行缓存，适合作为低延迟的本地读取缓存层。

## pg_kv

`–sLd–` | `0.1.0` | `18` `17` `16` | [`1🌟`](https://github.com/Murat7Ay/pg_kv)

在 PostgreSQL 共享内存中实现 Redis 风格的键值缓存，更新原地覆盖，不产生 WAL 和 MVCC 垃圾，并支持强制 TTL、计数器、限流与有序集合，可用于缓存、限流和排行榜场景。

## provsql

`–sLdt-` | `1.13.1` | `18` `17` `16` | [`77🌟`](https://github.com/PierreSenellart/provsql)

为 PostgreSQL 增加 m-semiring provenance 与不确定性管理能力，可在查询结果上计算概率、Shapley 值和多种 semiring 求值，适合需要追溯数据来源、量化不确定性的分析场景。

## orioledb

`–sLd-r` | `1.10` | `18` `17` `16` | [`4.3k🌟`](https://github.com/orioledb/orioledb)

基于表访问方法框架实现的 PostgreSQL 新存储引擎，面向云环境与现代硬件设计，采用 undo log 和页合并减少垃圾回收等维护开销，以提升高核数服务器和 SSD、NVRAM 上的容量与性能。

## pg_cardano

`–s-d–` | `1.2.0` | `18` `17` `16` | [`2🌟`](https://github.com/Fell-x27/pg_cardano)

提供一组 Cardano 区块链相关工具，包括 Base58、Bech32、CBOR 编解码、Blake2b 哈希、Ed25519 签名验证以及 Shelley 地址和资产名称处理，便于在 Cardano db-sync 中处理二进制数据。

## rdkit

`–s-d-r` | `202609.2` | `18` `17` `16` | [`3.7k🌟`](https://github.com/rdkit/rdkit)

RDKit 是开源化学信息学与机器学习工具库，其 PostgreSQL 扩展以 cartridge 形式提供分子数据库能力，支持子结构检索、相似性搜索以及多种分子描述符计算，常用于化合物数据管理与化学数据分析。

## omni

`–sLd–` | `0.2.14` | `18` `17` `16` | [`1.6k🌟`](https://github.com/omnigres/omnigres)

Omnigres 旨在把 PostgreSQL 变成面向开发者的应用平台，可在数据库内部或紧邻数据库运行应用逻辑，并让实例直接提供 HTTP、WebSocket 等协议服务，同时涵盖部署、缓存、认证、响应式查询与实时数据更新等能力。

## omni_auth

`—-d–` | `0.1.3` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_auth/basics/)

Omnigres 的认证扩展，为数据库内的应用提供认证能力，围绕 subject 与统一的高层接口组织认证流程，支持密码认证等认证方式，用于在 PostgreSQL 内部完成用户身份校验。

## omni_aws

`—-dt-` | `0.1.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_aws/s3/)

Omnigres 的 AWS 集成扩展，让 PostgreSQL 直接调用 S3 相关接口，例如创建 bucket、列举对象和上传对象，并支持生成预签名 URL 以及配置 DigitalOcean Spaces 等自定义 endpoint。

## omni_cloudevents

`—-dt-` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_cloudevents/cloud_events/)

Omnigres 的 CloudEvents 扩展，支持在 PostgreSQL 中准备、发布和消费 CloudEvents 事件，让数据库侧可以借助标准事件格式与其他系统交换事件数据。

## omni_containers

`–s-d–` | `0.2.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_containers/intro/)

在 PostgreSQL 中管理容器，可通过 SQL 创建和停止容器、查询日志、查看镜像与检查容器状态，还能把当前数据库实例附加到容器中执行命令。适合在数据库内部编排和调试容器化任务。

## omni_credentials

`—-d–` | `0.2.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_credentials/credentials/)

Omnigres 的凭据管理扩展，为其他扩展提供统一的凭据存储与访问方式，支持加密保护以及基于文件存储的凭据。用于避免把密码等敏感信息散落在配置文件和 SQL 语句中。

## omni_csv

`–s-d–` | `0.1.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_csv/)

提供 CSV 工具函数，可检查 CSV 文本的结构，把 CSV 解析成记录，并将记录聚合回 CSV 文本。适合在 SQL 中直接校验、导入和生成 CSV 数据。

## omni_datasets

`—-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_datasets/northwind/)

汇集 Northwind 等示例数据集，方便在 PostgreSQL 中快速准备演示用数据。主要用于测试、教学和示例应用的搭建。

## omni_email

`—-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_email/reference/)

Omnigres 套件中的邮件处理扩展，用于在 PostgreSQL 内部完成邮件相关操作。官方文档目前仅提供参考页，具体接口需结合项目源码使用。

## omni_http

`—-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_httpc/reference/)

Omnigres 平台中的 HTTP 基础组件，提供在 PostgreSQL 内部处理 HTTP 请求与响应所需的类型，供 omni_httpc 客户端与 omni_httpd 服务端扩展共用。

## omni_httpc

`–s-d–` | `0.1.11` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_httpc/reference/)

在 PostgreSQL 内部发起 HTTP 请求的客户端扩展，支持构造并执行请求、读取响应列，还可以配置连接池以及在后台模式下运行请求。

## omni_httpd

`–s-d–` | `0.4.11` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_httpd/intro/)

让 PostgreSQL 直接对外提供 HTTP 服务的扩展，支持路由、请求头处理、静态文件服务、反向代理与安全控制，可用于在数据库内部搭建 Web 服务。

## omni_id

`–s-d-r` | `0.4.3` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_id/identity_type/)

为 PostgreSQL 引入 identity 身份标识类型，用于生成和存储唯一标识符，便于在表设计中统一管理记录 ID。

## omni_json

`—-dt-` | `0.1.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_json/table_mapping/)

在 JSON 文档与数据库表之间建立映射，可以配置参与映射的列以及字段重命名，便于按表结构读写 JSON 数据。

## omni_kube

`–s-d–` | `0.4.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_kube/api/)

Omnigres 的 Kubernetes 集成扩展，让 PostgreSQL 通过 Kubernetes API 管理集群资源。文档涵盖凭据配置、资源管理与可组合路径，便于用 SQL 操作 Kubernetes 对象。

## omni_ledger

`–s-d–` | `0.1.3` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_ledger/basics/)

Omnigres 的账本扩展，用于在 PostgreSQL 中记录和查询账务条目。文档以账本基础（Ledger Basics）为主线介绍其用法，适合在数据库内直接维护记账数据。

## omni_manifest

`—-d–` | `0.1.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_manifest/usage/)

Omnigres 的清单（manifest）扩展，用于以声明式清单描述一组数据库定义并应用到数据库。适合把数据库对象的期望状态写成清单统一管理。

## omni_mimetypes

`—-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_mimetypes/reference/)

内置来自 IANA、Apache、Nginx 等来源的 MIME 类型及其属性数据，提供纯 SQL 表，可用文件扩展名反查对应类型。适合在数据库内识别或校验文件的媒体类型。

## omni_os

`–s-d–` | `0.1.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_os/intro/)

把部分操作系统信息暴露给 SQL，例如 omni_os.env 视图列出环境变量。仅限超级用户使用，适合在数据库内查看宿主环境配置。

## omni_polyfill

`–s-d–` | `0.2.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_polyfill/polyfills/)

为旧版 PostgreSQL 提供新版本特性的 polyfill 实现，让依赖较新功能的扩展和代码在低版本上也能正常运行。适合需要跨多个 PostgreSQL 版本保持一致行为的场景。

## omni_python

`–s-d–` | `0.1.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_python/intro/)

为 PostgreSQL 提供 Python 支持，可以在数据库内直接编写和运行 Python 代码。适合把已有的 Python 逻辑放到数据库端执行。

## omni_regex

`–s-d-r` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_regex/regex/)

为 PostgreSQL 补充正则表达式能力，可在 SQL 中完成更灵活的模式匹配与文本处理。适合需要在查询里做复杂字符串匹配的场景。

## omni_rest

`—-d–` | `0.1.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_rest/protocols/)

配合 omni_httpd 提供 REST 协议支持，把 HTTP 请求解析为结构化参数，方便直接用 SQL 构建 REST 风格接口。

## omni_schema

`—-d–` | `0.3.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_schema/reference/)

用于定义和管理数据库 schema，并对 schema 的变更做版本化跟踪，使结构演进更可控。适合需要管理多版本表结构的项目。

## omni_seq

`–s-d–` | `0.1.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_seq/id/)

提供带节点前缀的分布式 ID 类型，由节点标识与序号组成，用于绕开逻辑复制不复制 sequence 数据的问题，使主备切换后仍能生成不冲突的主键值。

## omni_service

`—-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_service/management/)

为 omni_httpd 等数据库内服务提供统一的管理方式，可查看服务列表与运行状态，并通过统一函数启动或停止服务，每次操作都会记录到日志表中。

## omni_session

`—-d–` | `0.2.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_session/session_management/)

为 Omnigres 提供标准化的会话管理，使用 unlogged 表保存会话，并通过 session_handler 处理会话 ID 以及 HTTP 请求和响应中的 _session cookie，适合在数据库侧实现登录会话。

## omni_shmem

`–s-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_shmem/)

Omnigres 套件中的共享内存管理扩展，文档将其定位为共享内存管理，用于在 PostgreSQL 内部统一管理共享内存资源。

## omni_sql

`–s-d–` | `0.5.3` | `18` `17` `16` | [`1.6k🌟`](https://github.com/omnigres/omnigres)

用于处理 SQL 语句的扩展，可解析原始语句、校验语句是否合法、执行动态 SQL，并判断语句类型（如是否带 RETURNING 或 OR REPLACE），还能将语句反解析为文本。

## omni_sqlite

`–s-d–` | `0.2.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_sqlite/sqlite/)

Omnigres 的原生 SQLite 扩展，让 PostgreSQL 环境中可以直接使用 SQLite 的能力，便于在数据库侧处理原本面向 SQLite 的数据与场景。

## omni_test

`—-d–` | `0.4.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_test/guide/)

在数据库内部运行测试的模板化扩展：先在模板库中准备测试函数与依赖，再实例化到目标 schema 执行。适合为 SQL 逻辑和数据库应用编写自动化测试。

## omni_txn

`–s-d–` | `0.5.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_txn/linearize/)

提供事务线性化能力，把并发执行的多个事务整理成一个确定的先后顺序，用于简化并发场景下的事务排序与可见性问题。

## omni_types

`–s-d–` | `0.3.6` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_types/function_signature_types/)

引入用于表示函数签名的类型，可以描述并比较函数的参数与返回类型，便于在 SQL 中记录、查询和维护函数接口信息。

## omni_var

`–s-d–` | `0.3.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_var/variables/)

在数据库中引入变量机制，可以定义、读取和更新变量值，用于在 SQL 与数据库内应用之间共享配置和运行时状态。

## omni_vfs

`–s-d–` | `0.2.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_vfs/reference/)

为 Postgres 提供统一的虚拟文件系统（VFS）API，可用同一套接口访问不同后端，便于在本地文件、Git 仓库或 S3 等存储之间切换。当前 API 较为精简，尚不支持写入与流式读取。

## omni_vfs_types_v1

`—-d–` | `0.1.0` | `18` `17` `16` | [`1.6k🌟`](https://github.com/omnigres/omnigres)

属于 Omnigres 这一“数据库即应用平台”项目，为 omni_vfs 虚拟文件系统接口的 v1 版本提供共享类型定义，供相关扩展与 SQL 层复用同一套类型约定。

## omni_web

`–s-d–` | `0.3.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_web/intro/)

提供一组处理 Web 栈相关任务的函数库，常与同项目的 omni_httpd 配合使用，让 Web 请求处理逻辑可以直接在 Postgres 内完成。

## omni_worker

`–s-d–` | `0.2.1` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_worker/intro/)

提供一个通用的 Postgres 工作进程池，可在各自的后端上下文中执行任意负载，并允许其他扩展注册原生编译的消息处理器；最简单的例子是接收 SQL 语句并调度执行。

## omni_xml

`–s-d–` | `0.1.2` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_xml/overview/)

提供基础的 XML 工具箱，在 Postgres 编译时未启用 XML 支持或缺少 xml2 扩展的场景下补齐相关能力。底层库并非完全符合 W3C 规范，例如不支持 namespace 轴。

## omni_yaml

`–s-d–` | `0.1.0` | `18` `17` `16` | [`–`](https://docs.omnigres.org/omni_yaml/yaml/)

Omnigres 提供的 YAML 基础支持扩展，仅含 omni_yaml.to_json 与 omni_yaml.to_yaml 两个函数，用于 YAML 文本与 JSON 之间互转，需要 JSONB 时可先转成 json 再强制转换。

## pg_mentat

`–s-dt-` | `1.20.0` | `18` `17` `16` | [`–`](https://codeberg.org/gregburd/mentat)

源自 Mozilla 的 Datomic/DataScript 实现分支（原项目已停止维护），以 PostgreSQL 扩展形式提供 EDN 数据存储，并内置 Clojure REPL，可在数据库内直接执行 Clojure 代码与查询。

# LANG

## pg_tle

`–sLd–` | `1.5.3` | `18` `17` `16` | [`414🌟`](https://github.com/aws/pg_tle)

Trusted Language Extensions 框架，让开发者用受信任语言把新功能打包成扩展，并通过 SQL API 安装到文件系统受限的环境（如托管数据库），从而无需访问数据库服务器的底层文件。

## plv8

`–s-d–` | `3.2.5` | `18` `17` `16` | [`2.1k🌟`](https://github.com/plv8/plv8)

由 V8 JavaScript 引擎驱动的 PostgreSQL 过程语言，可用 JavaScript 编写能直接从 SQL 调用的函数，适合在数据库内完成数据处理、校验与业务逻辑计算。

## pljs

`–s-d–` | `1.0.5` | `18` `17` `16` | [`227🌟`](https://github.com/plv8/pljs)

轻量、快速的受信任 JavaScript 过程语言扩展，基于 QuickJS 引擎实现并支持 PostgreSQL 14 及以上版本，可在无法访问底层文件系统的托管环境中用 JavaScript 编写 SQL 可调用的函数。

## pllua

`–s-d–` | `2.0` | `18` `17` `16` | [`161🌟`](https://github.com/pllua/pllua)

将 Lua 嵌入 PostgreSQL 的过程语言扩展，可以直接用 Lua 编写函数和存储过程。支持 Lua 5.4、5.3 与 LuaJIT 2.1，适合在数据库内完成复杂的计算和数据处理逻辑。

## hstore_pllua

`–s-d-r` | `1.0` | `18` `17` `16` | [`161🌟`](https://github.com/pllua/pllua)

pllua 附带的 hstore 转换扩展，为 Lua 过程语言提供 hstore 类型的支持。安装后可直接在 Lua 函数中读写 hstore 数据，无需手工解析其文本表示。

## plluau

`–s-d–` | `2.0` | `18` `17` `16` | [`161🌟`](https://github.com/pllua/pllua)

pllua 的 untrusted 版本，同样把 Lua 嵌入 PostgreSQL 作为过程语言。区别在于以不受信任方式安装，提供完整的 Lua 运行环境，供需要外部模块等能力的场景使用。

## hstore_plluau

`–s-d-r` | `1.0` | `18` `17` `16` | [`161🌟`](https://github.com/pllua/pllua)

plluau 附带的 hstore 转换扩展，为不受信任版本的 Lua 过程语言提供 hstore 类型支持。便于在 Lua 函数中直接读写 hstore 列，而不必自行处理其文本格式。

## plprql

`–s-d–` | `18.0.2` | `18` `17` `16` | [`476🌟`](https://github.com/kaspermarstal/plprql)

用 PRQL 编写 PostgreSQL 存储过程的扩展。PRQL 是以管道方式组合、可编译为 SQL 的查询语言，借此可把冗长嵌套的 SQL 改写成易读的 PRQL 函数，也支持编译和执行 PRQL 查询，便于调试与在 ORM 中做原型验证。

## pldbgapi

`–sLd-r` | `1.10` | `18` `17` `16` | [`95🌟`](https://github.com/EnterpriseDB/pldebugger)

为 PostgreSQL 的 PL/pgSQL 函数提供调试 API 的共享库。pgAdmin 基于它提供图形界面，可对函数单步调试、设置断点，并让调试器等待其他会话执行该函数时触发。

## plpgsql_check

`–s-d–` | `2.10` | `18` `17` `16` | [`787🌟`](https://github.com/okbob/plpgsql_check)

对 plpgsql 存储过程和函数做静态分析的 linter 工具。它复用 PostgreSQL 自带的解析器和求值器，能发现运行时才暴露的错误以及函数体内 SQL 的问题，并支持调节警告级别。

## plprofiler

`–sLd-r` | `4.2.5` | `18` `17` `16` | [`104🌟`](https://github.com/bigsql/plprofiler)

为 PL/pgSQL 函数和存储过程生成性能剖析数据的扩展。配套的 Python 类与命令行工具可控制采样、保存和管理剖析数据集，并输出 HTML 报告，用于定位嵌套代码中的性能瓶颈。

## plsh

`–s-d-r` | `1.20220917` | `18` `17` `16` | [`177🌟`](https://github.com/petere/plsh)

让 PostgreSQL 用任意 shell 编写存储过程的过程语言处理器。函数体中首行以 #! 指定解释器，脚本在独立进程中执行，标准输出作为返回值，标准错误或非零退出码则报错。

## pljava

`–s-d–` | `1.6.10` | `18` `17` `16` | [`270🌟`](https://github.com/tada/pljava)

在 PostgreSQL 后端中运行 Java 的模块。它让 Java 编写的存储过程、触发器、函数、聚合、运算符和类型可直接在数据库内使用，从而复用现有 Java 代码与类库。

## plr

`–s-d-r` | `8.4.8.10` | `18` `17` `16` | [`129🌟`](https://github.com/postgres-plr/plr)

让 PostgreSQL 支持用 R 语言编写存储函数，从而在数据库内直接完成统计分析与数据处理。使用前需安装以 --enable-R-shlib 构建的 R，并在启动 postmaster 前设置 R_HOME。

## plxslt

`–s-d-r` | `0.20140221` | `18` `17` `16` | [`20🌟`](https://github.com/petere/plxslt)

提供 XSLT 过程语言处理器，可用 XSLT 样式表编写存储过程，函数的第一个参数接收 XML 输入文档，返回值类型需与样式表指定的输出方法一致。不支持触发器。

## pg_mockable

`—-d–` | `1.1.0` | `18` `17` `16` | [`8🌟`](https://github.com/bigsmoke/pg_mockable)

用于为其他 schema 中的函数创建可 mock 的薄包装，如用 mockable.wrap_function() 生成 mockable.now()，未启用 mock 时转调原函数。主要服务于测试场景。

## pgsqlmock

`—-d-r` | `1.0.1` | `18` `17` `16` | [`2🌟`](https://github.com/v-maliutin/pgSQLMock)

在 pgTap 单元测试框架之上增加伪造与 mock 能力，用法类似现代高级语言中的测试替身，方便为 PostgreSQL 数据库编写单元测试。需要 pgTap 1.3.4 或更高版本。

## plx

`–s-d-r` | `2.0.1` | `18` `17` `16` | [`34🌟`](https://github.com/commandprompt/plx)

让你用 Ruby、PHP、JavaScript、TypeScript、Python、Go、COBOL、Oracle PL/SQL 或 T-SQL 等熟悉的方言编写存储函数和触发器，在 CREATE FUNCTION 时转译为 plpgsql 并交由 PostgreSQL 内置解释器执行，无需额外语言运行时。

## pgwasm

`–s-d–` | `0.1.0` | `18` `17` `16` | [`2🌟`](https://github.com/jnicholls/pgwasm)

在 PostgreSQL 内部运行 WebAssembly 组件，并把组件导出的函数自动映射为带类型参数的 SQL 函数。组件的 WIT 接口会转换成记录、枚举、列表等 PostgreSQL 类型，模块在加载时编译缓存，每次调用都在 Wasmtime 沙箱中执行，权限由数据库管理员配置。

## plruby

`–s-d–` | `2.5` | `18` `17` `16` | [`36🌟`](https://github.com/commandprompt/plruby)

让 PostgreSQL 支持用 Ruby 编写存储过程语言。扩展在后端嵌入 MRI Ruby 解释器，可用 Ruby 及其标准库编写普通函数、集合返回函数、触发器、事件触发器和可控制事务的过程，并通过 SPI 查询数据库。

## jsonb_plruby

`–s-d-r` | `1.0` | `18` `17` `16` | [`36🌟`](https://github.com/commandprompt/plruby)

为 PL/Ruby 提供 jsonb 类型的转换支持，使 Ruby 函数在接收和返回 jsonb 值时能在 Ruby 数据结构与 PostgreSQL 的 jsonb 之间自动转换，省去手工序列化。

## hstore_plruby

`–s-d-r` | `1.0` | `18` `17` `16` | [`36🌟`](https://github.com/commandprompt/plruby)

为 PL/Ruby 提供 hstore 类型的转换支持，让以 Ruby 编写的函数在参数和返回值中使用 hstore 键值对时能够自动与 Ruby 的哈希结构互相转换。

## ltree_plruby

`–s-d-r` | `1.0` | `18` `17` `16` | [`36🌟`](https://github.com/commandprompt/plruby)

为 PL/Ruby 提供 ltree 类型的转换支持，使 Ruby 函数在读写 ltree 标签路径数据时能在这类 PostgreSQL 类型与 Ruby 的表示之间自动转换。

## plphp

`–s-d–` | `2.6` | `18` `17` `16` | [`56🌟`](https://github.com/commandprompt/plPHP)

使用 PHP 编写存储在 PostgreSQL 内的数据库函数、触发器和存储过程的过程语言处理器。可直接调用 PHP 标准库，支持普通函数、集合返回函数、触发器、事件触发器以及带事务控制的过程。

## pgtap

`-b–d-r` | `1.3.4` | `18` `17` `16` | [`1.2k🌟`](https://github.com/theory/pgtap)

用 PL/pgSQL 编写的 PostgreSQL 单元测试框架，提供大量输出 TAP 格式的断言函数，可与其他 TAP 测试框架集成，也支持 xUnit 风格，用于对数据库逻辑做自动化测试。

## faker

`–s-d–` | `0.5.3` | `18` `17` `16` | [`–`](https://gitlab.com/dalibo/postgresql_faker)

基于 Python Faker 库的 PostgreSQL 扩展，用于生成伪造的测试数据，并可用于数据脱敏与匿名化。

## dbt2

`–s-d-r` | `0.62.0` | `18` `17` `16` | [`8🌟`](https://github.com/osdldbt/dbt2)

遵循公平使用条款的 TPC-C 数据库基准测试工具包，用于对数据库进行 OLTP 性能压测，测试数据的后续处理需要配合 dbttools 使用。

## pg_regresql

`–sLd-r` | `2.1.0` | `18` `17` `16` | [`395🌟`](https://github.com/boringsql/regresql)

面向 PostgreSQL 的语言无关 SQL 回归测试工具。它收集 *.sql 文件并在数据库中执行，把输出与已知正确的基线比对，同时跟踪 EXPLAIN 执行计划的变化，以便在生产前发现失效查询和性能回归。

# TYPE

## prefix

`–s-d-r` | `1.2.11` | `18` `17` `16` | [`106🌟`](https://github.com/dimitri/prefix)

提供用于前缀匹配的 GiST opclass 和 prefix range 类型，可按最长前缀把电话号码等字符串匹配到对应前缀。常见于电话路由等按前缀查找运营商的场景。

## semver

`–s-d-r` | `0.42.0` | `18` `17` `16` | [`171🌟`](https://github.com/theory/pg-semver)

提供 semver 数据类型，按 Semantic Versioning 2.0.0 规范存储和比较语义化版本号，可直接在表中保存版本并做排序与比较。适合管理软件版本、依赖版本等需要规范版本号的场景。

## pg_text_semver

`—-d-r` | `1.2.1` | `18` `17` `16` | [`7🌟`](https://github.com/bigsmoke/pg_text_semver)

基于内置 text 类型实现 semver 域类型，用正则约束校验语义化版本，并提供比较函数与运算符，还可转换为可排序、可索引的解析类型。适合在数据库中校验和排序版本号。

## pg_lexo

`–s-d–` | `0.6.0` | `18` `17` `16` | [`1🌟`](https://github.com/Blad3Mak3r/pg_lexo)

用 Rust 和 pgrx 编写的扩展，生成 Base62 编码、可按字典序排序的位置键，在任意两个已有位置之间插入或重排时无需更新其他行。适合播放列表、队列等需要稳定顺序的列表排序场景。

## codesystem

`–s-d-r` | `0.2.0` | `18` `17` `16` | [`1🌟`](https://github.com/John-Cameron-Burns/pg-codesystem)

提供统一的 code 列类型，紧凑存储并校验、规范化各类行业分类代码，同时理解代码在层级中的位置。内置 SIC、NACE、ISIC、SOC、ISCO 及公司编号等代码体系，避免录入错误代码。

## unit

`–s-d–` | `7.10` | `18` `17` `16` | [`281🌟`](https://github.com/df7cb/postgresql-unit)

为 PostgreSQL 提供 SI 单位数据类型（外加 byte），八个基本单位可通过类型运算符组合成任意派生单位。支持 SI 与 IEC 二进制前缀和任意量纲换算，单位与前缀定义存于数据库表并可在运行时扩展。

## pgpdf

`–s-d-r` | `0.1.0` | `18` `17` `16` | [`228🌟`](https://github.com/Florents-Tselai/pgpdf)

提供 pdf 数据类型，可将 text 文件路径或 bytea 列转换为 pdf，由 poppler 完成解析和校验。用于在数据库内以 ACID 方式存取 PDF，避免依赖外部脚本导致数据管道脆弱、原始数据不同步，也便于对 PDF 做全文检索。

## pglite_fusion

`–sLd–` | `0.0.7` | `18` `17` `16` | [`833🌟`](https://github.com/frectonz/pglite-fusion)

把 SQLite 数据库作为二进制对象嵌入 PostgreSQL 表的列中，通过 empty_sqlite、query_sqlite、execute_sqlite 等函数创建数据库并执行 SQL 查询。主要用于多租户场景，让每个租户持有独立的 SQLite 数据库而仍由 PostgreSQL 统一管理。

## md5hash

`–s-d-r` | `1.0.1` | `18` `17` `16` | [`9🌟`](https://github.com/tvondra/md5hash)

提供固定长度的 md5hash 数据类型，在列内联存储 128 位 MD5 哈希，比原生 TEXT 变长类型更节省空间。扩展附带类型转换、运算符和 btree 索引操作符类，可像普通数据类型一样建表、建索引和查询。

## asn1oid

`–s-d-r` | `1.6` | `18` `17` `16` | [`2🌟`](https://github.com/df7cb/pgsql-asn1oid)

为 PostgreSQL 提供 ASN.1 OID（对象标识符）数据类型，使这类按层级编号的对象标识符可以像其他类型一样存入表中并参与查询。

## roaringbitmap

`–s-d-r` | `1.3.0` | `18` `17` `16` | [`293🌟`](https://github.com/ChenHuajun/pg_roaringbitmap)

在 PostgreSQL 中提供 RoaringBitmap 压缩位图数据类型。相比 WAH、EWAH、Concise 等传统压缩位图，它的压缩率和运算速度更好，适合存储大量整数集合、做交集与基数统计，例如标签、用户分群等场景。

## pgfaceting

`—-d–` | `0.2.0` | `18` `17` `16` | [`184🌟`](https://github.com/cybertec-postgresql/pgfaceting)

用 roaring bitmap 构建倒排索引，快速计算分面（facet）计数。分面计数即统计结果集中某属性各取值出现的次数，典型用途是电商网站按颜色、尺码等条件筛选后显示剩余商品数量，依赖 pg_roaringbitmap。

## pg_sphere

`–s-d-r` | `1.5.2` | `18` `17` `16` | [`26🌟`](https://github.com/postgrespro/pgsphere)

为 PostgreSQL 提供球面几何数据类型与运算。包含球面点、多边形、路径、圆、椭圆和坐标范围等类型，支持包含与重叠判断、周长与面积计算、按欧拉角旋转对象，并用 GiST（R-tree）和 BRIN 建立索引，适合天文等球面坐标数据场景。

## country

`–s-d-r` | `0.0.4` | `18` `17` `16` | [`9🌟`](https://github.com/adjust/pg-country)

为 PostgreSQL 增加 country 枚举数据类型，取值遵循 ISO 3166-1 alpha-2 国家代码标准。扩展同时提供比较运算符，以及 btree 和 hash 索引的操作符类，适合需要严格约束国家代码取值的表结构。

## pg_xenophile

`—-d–` | `0.8.3` | `18` `17` `16` | [`11🌟`](https://github.com/bigsmoke/pg_xenophile)

为国际化和本地化项目提供常用数据与工具。内含国家、地区、语言、货币等基础表，以及存取翻译字符串的函数，还提供触发器函数来搭建一对多翻译表并在其上创建易用视图。

## l10n_table_dependent_extension

`—-d-r` | `0.8.3` | `18` `17` `16` | [`11🌟`](https://github.com/bigsmoke/pg_xenophile)

为国际化项目打包常用数据与工具：内置国家、地区、语言和货币数据表，并提供存取翻译字符串的函数以及搭建一对多翻译表的触发器函数，可用于多语言应用的本地化数据管理。

## currency

`–s-d-r` | `0.0.6` | `18` `17` `16` | [`20🌟`](https://github.com/adjust/pg-currency)

提供仅占 1 字节的 ISO 4217 货币代码数据类型 currency，附带比较运算符以支持排序和 btree 索引，并可用集合返回函数列出所支持的货币，适合在建表时紧凑地存储货币代码。

## pg_money

`–s-d-r` | `0.3.0` | `18` `17` `16` | [`2🌟`](https://github.com/RustedBytes/pg-money)

基于 rusty-money 实现精确且带币种信息的金额类型，提供 money_with_currency 和以整数最小单位存储的 money_minor，支持安全算术、B-tree/hash 索引、聚合、格式化以及按时间查询历史汇率。

## collection

`–s-d-r` | `2.1.3` | `18` `17` `16` | [`24🌟`](https://github.com/aws/pgcollection)

为 PL/pgSQL 提供仿 Oracle PL/SQL 关联数组的集合类型，collection 以文本为键、icollection 以 64 位整数为键，支持下标访问、正反向与排序遍历、存在性检查和集合返回函数，便于从 Oracle 迁移。

## istore

`–s-d-r` | `0.1.12` | `18` `17` `16` | [`35🌟`](https://github.com/adjust/istore)

用整数键值对替代 hstore 的扩展，提供 istore 与 bigistore 两种类型，键均为整数、值分别为 int 和 bigint，支持加法等运算符与 SUM 聚合，适合按 id 统计计数或金额的分析型负载。

## pgmp

`–s-d-r` | `1.0.6` | `18` `17` `16` | [`31🌟`](https://github.com/dvarrazzo/pgmp/)

把 GMP 库的任意精度数值类型引入 PostgreSQL，提供 mpz_（任意大小整数）和 mpq_（任意精度有理数）。整数运算比 decimal 更快，支持素数、随机数和因式分解函数，并可参与混合算术与 btree、hash 索引。

## numeral

`–s-d-r` | `1.3` | `18` `17` `16` | [`11🌟`](https://github.com/df7cb/postgresql-numeral)

提供以文字而非数字输入输出的数值类型，包括英文数词 numeral、德文数词 zahl 和罗马数字 roman。这些类型内部与 bigint 二进制兼容并复用 bigint 运算符，可用于需要文字形式数字的场景。

## pg_rational

`–s-d–` | `0.0.3` | `18` `17` `16` | [`257🌟`](https://github.com/begriffs/pg_rational)

提供精确分数类型，用固定 64 位存储分子分母，适用于精确算术或用自定义顺序排列表行。支持溢出检测、btree 与 hash 索引，并用 Stern-Brocot 树寻找两个分数之间的中间值。

## uint

`–s-d-r` | `1.20260630` | `18` `17` `16` | [`343🌟`](https://github.com/petere/pguint)

为 PostgreSQL 补充缺失的整数类型，包括有符号 8 位 int1 以及无符号的 uint1、uint2、uint4、uint8。这些类型可像标准整数一样使用，并提供较完整的运算符、函数和索引支持。

## uint128

`–s-d-r` | `1.2.0` | `18` `17` `16` | [`29🌟`](https://github.com/pg-uint/pg-uint128)

为 PostgreSQL 增加无符号整数和 128 位整数类型，如 uint16、int16 以及 8 位到 64 位的无符号类型。同时提供对应的 range 与 multirange 类型、GiST 索引、类型转换、混合符号算术以及 BTREE、HASH 索引支持。

## hashtypes

`–s-d–` | `0.1.5` | `18` `17` `16` | [`7🌟`](https://github.com/adjust/hashtypes/)

为 PostgreSQL 提供 sha1、md5、crc32 等哈希值数据类型，便于在列中直接存储和比较校验值。它源自 shatypes 项目，并修复了原有实现中的一些问题。

## postbis

`–s-d-r` | `1.0` | `18` `17` `16` | [`7🌟`](https://github.com/no0p/postbis)

PostgreSQL 扩展，编译安装后需在数据库中执行 CREATE EXTENSION postbis 启用。代码源自 Max Planck 海洋微生物研究所的 PostBIS 项目，按 PostgreSQL License 发布。

## ip4r

`–s-d-r` | `2.4.3` | `18` `17` `16` | [`165🌟`](https://github.com/RhodiumToad/ip4r)

提供 IPv4/IPv6 地址及地址段的数据类型和索引支持，可高效存储与查询 IP 范围。还带有 cidr_split 函数把任意范围拆成一组 CIDR 块，并支持与 bit、bytea 互转。

## uri

`–s-d-r` | `1.20251029` | `18` `17` `16` | [`323🌟`](https://github.com/petere/pguri)

提供 uri 数据类型，相比直接用 text 存储，可校验 URI 语法、提取 URI 各组成部分并按人类习惯排序。底层借助 uriparser 库按 RFC 3986 解析。

## emailaddr

`–s-d-r` | `0` | `18` `17` `16` | [`46🌟`](https://github.com/petere/pgemailaddr)

提供 emailaddr 数据类型，用于在数据库中存储和校验电子邮件地址。接受的地址大致对应 RFC 5322 的 addr-spec 形式，即 foo@bar.com 这类写法，而非带显示名的完整格式。

## acl

`–s-d-r` | `1.0.4` | `18` `17` `16` | [`90🌟`](https://github.com/arkhipov/acl)

提供表示 ACL 条目的专用类型，以及用于校验用户是否匹配某条 ACL 的函数，可按已认证用户限制表中行的访问，从而不必在应用层实现复杂的权限模型。

## debversion

`–s-d-r` | `1.2.0` | `18` `17` `16` | [`–`](https://salsa.debian.org/postgresql/postgresql-debversion)

为 PostgreSQL 提供 Debian 软件包版本号数据类型，用于在库中存储并按 Debian 版本排序规则比较 debversion 版本的扩展。

## pg_duration

`–s-d-r` | `1.0.2` | `18` `17` | [`3🌟`](https://github.com/jkosh44/pg_duration)

新增 duration 数据类型，用于在数据库中存储某件事的总耗时。它与内置 interval 类似，但只保留微秒部分、不含月和日，仅占 8 字节，并支持 BTREE 与 HASH 索引。

## pg_bikram_sambat

`–s-d-r` | `0.1.0` | `18` `17` `16` | [`–`](https://pgxn.org/dist/pg_bikram_sambat/0.1.0/)

提供自定义 bs_date 类型，支持公历（AD）与尼泊尔 Bikram Sambat（BS）历法之间的相互转换，并包含 Devanagari 数字支持与格式化输出。

## pg_nanotime

`–s-d-r` | `0.3.0` | `18` `17` | [`0🌟`](https://github.com/bunko666-cloud/pg_nanotime)

提供纳秒精度的 nanotimestamptz 时间类型及自动填入当前时间的函数，可保证时间严格递增且不重复。适合交易报价、延迟测量、网络封包与传感器数据等微秒精度不足的场景，灵感来自 timestamp9。

## pg_rrule

`–s-d-r` | `0.3.0` | `18` `17` `16` | [`177🌟`](https://github.com/petropavel13/pg_rrule)

提供 RRULE 数据类型，用于在数据库中存储 iCalendar 风格的重复规则，可读取 freq、byday 等参数，并按指定时区或不带时区地把规则展开成具体时间点。

## pgcalendar

`—-d–` | `1.1.0` | `18` `17` `16` | [`142🌟`](https://github.com/h4kbas/pgcalendar)

为 PostgreSQL 提供无限日历能力，把事件、日程、例外和投影分层管理，支持按日、周、月、年等配置生成重复计划，并对单个实例做取消或修改，同时检查日程区间是否重叠。

## timestamp9

`–s-d-r` | `1.4.0` | `18` `17` `16` | [`126🌟`](https://github.com/optiver/timestamp9)

提供纳秒精度的时间戳类型，内部以 64 位整数保存自 UNIX 纪元起的纳秒数，可与 timestamp、timestamptz、date 相互转换，支持比较运算、btree/hash 索引以及 interval 的加减。

## pgbson

`–s-d-r` | `2.2.0` | `18` `17` `16` | [`103🌟`](https://github.com/buzzm/postgresbson)

在 PostgreSQL 中实现 BSON 数据类型及创建、检查 BSON 对象的函数，便于高效查询；相比 JSON，它把日期时间作为一等类型，并用 int32、int64、float、decimal 及 byte[] 明确承载数值和二进制数据，避免精度损失。

## chkpass

`–s-d-r` | `1.0` | `18` `17` `16` | [`2🌟`](https://github.com/lacanoid/chkpass)

PostgreSQL 11 之前内置的 chkpass 扩展的独立版本，专门用于存储加密密码，供已经从发行版中移除该扩展的新版本数据库继续使用。

# UTIL

## gzip

`–s-d-r` | `1.1.1` | `18` `17` `16` | [`88🌟`](https://github.com/pramsey/pgsql-gzip)

对 bytea 数据做 gzip 压缩与解压的函数。用于把数据返回客户端前压缩，或处理客户端传来的已压缩数据，不用于数据库存储压缩。

## bzip

`–s-d–` | `1.0.0` | `18` `17` `16` | [`4🌟`](https://github.com/steve-chavez/pg_bzip)

提供 bzcat 与 bzip2 两个函数，在 SQL 中解压或压缩 bzip2 格式的 bytea 数据。适合直接处理从 HTTP 或文件得到的 bzip2 压缩内容。

## zstd

`–s-d-r` | `1.1.2` | `18` `17` `16` | [`43🌟`](https://github.com/grahamedgecombe/pgzstd)

压缩和解压 Zstandard 帧的函数，并支持指定预设字典。用于在 SQL 中直接处理 zstd 压缩的 bytea 数据。

## http

`–s-d–` | `1.7.2` | `18` `17` `16` | [`1.6k🌟`](https://github.com/pramsey/pgsql-http)

在数据库内发起 HTTP 请求的客户端，支持 GET、POST、PUT、PATCH、DELETE 等方法并可携带请求头。常用于在触发器中调用外部 Web 服务，或读取网页内容。

## pg_net

`–sLd–` | `0.20.5` | `18` `17` `16` | [`378🌟`](https://github.com/supabase/pg_net)

支持在 SQL 中发起异步非阻塞的 HTTP/HTTPS 请求。可与触发器、pg_cron 结合使用，用于调用外部 API 或把数据库变更同步给外部资源，Supabase 的 Webhook 功能即由其驱动。

## pg_curl

`–s-d-r` | `2.5.0` | `18` `17` `16` | [`72🌟`](https://github.com/RekGRpth/pg_curl)

基于 libcurl 在 PostgreSQL 内按 URL 语法传输数据，支持 HTTP、FTP、SFTP、SMTP 等数十种协议，可用白名单 GUC 限制角色能访问的 file:// 与 http(s):// 前缀。

## pg_retry

`–s-d-r` | `1.0.0` | `18` `17` | [`3🌟`](https://github.com/Agent-Hellboy/pg_retry)

自动重试因序列化失败、死锁、锁超时或查询取消等瞬时错误而失败的 SQL 语句，采用带抖动的指数退避避免惊群，重试次数与延迟均可配置。

## pg_fsql

`–s-d–` | `1.1.0` | `18` `17` `16` | [`2🌟`](https://github.com/yurc/pg_fsql)

递归 SQL 模板引擎，用点分路径组织父子模板并复用参数化查询执行，支持 exec、ref、if 等命令类型，纯 C 与 PL/pgSQL 实现且无需超级用户权限。

## pg_protobuf

`–s-d-r` | `1.0` | `18` `17` `16` | [`64🌟`](https://github.com/afiskon/pg_protobuf)

为 PostgreSQL 提供 Protobuf 支持，可读取以二进制形式存储的 Protobuf 数据并按字段提取，但不支持修改数据，枚举和 packed 重复字段需借助其他函数变通读取。

## pgproto

`–s-d-r` | `0.5.0` | `18` `17` `16` | [`34🌟`](https://github.com/Apaezmx/pgproto)

原生支持 proto3 的 Protobuf 扩展，可直接存储二进制消息并通过自定义操作符和 GIN 索引按字段查询，相比 JSONB 更节省空间且写入时自动清理失效 tag。

## pglock

`—-d–` | `1.0.0` | `18` `17` `16` | [`3🌟`](https://github.com/fraruiz/pglock)

基于 PostgreSQL 表实现的轻量级分布式锁服务。多实例应用可通过它协调对共享资源的访问，锁带可配置 TTL，过期后自动释放，避免陈旧锁长期占用。

## pg_lease

`—-dt-` | `0.1.0` | `18` `17` `16` | [`–`](https://pgxn.org/dist/pg_lease/0.1.0/)

在 PostgreSQL 内实现租约与所有权原语，提供带 TTL 过期和 fencing epoch 的 acquire、renew、release 与 inspect 接口。用于分布式系统中的协调、加锁与故障切换场景。

## pgjq

`–s-d-r` | `0.1.0` | `18` `17` `16` | [`204🌟`](https://github.com/Florents-Tselai/pgJQ)

把 jq 语言嵌入 PostgreSQL，新增 jqprog 数据类型保存 jq 程序，并提供 jq(jsonb, jqprog) 函数在 jsonb 上执行。可与 jsonb 函数、操作符和 jsonpath 配合使用，方便在库内完成复杂的 JSON 查询与变换。

## pg_json_diff

`–s-d-r` | `1.0` | `18` `17` `16` | [`1🌟`](https://github.com/KhaledSMQ/pg-jsondiff)

提供 JSON 比较、打补丁与合并能力，实现 RFC 6902 JSON Patch 和 RFC 7386 JSON Merge Patch 标准。可生成两个 jsonb 文档的差异、套用补丁并合并文档，适合配置与数据同步场景。

## pgjwt

`—-d–` | `0.2.0` | `18` `17` `16` | [`441🌟`](https://github.com/michelp/pgjwt)

在 PostgreSQL 内实现 JSON Web Token 的签发与校验，依赖 pgcrypto 完成签名。可用 SQL 直接生成带 payload 的 token 并验证其签名，常用于数据库侧的认证与授权流程。

## pg_smtp_client

`–s-d–` | `0.2.1` | `18` `17` `16` | [`10🌟`](https://github.com/brianpursley/pg_smtp_client)

在 PostgreSQL 中通过 SMTP 直接发送电子邮件。提供 smtp_client.send_email() 函数，并支持为常用参数配置系统级默认值，也可使用命名参数调用。

## pg_html5_email_address

`—-d-r` | `1.2.3` | `18` `17` `16` | [`6🌟`](https://github.com/bigsmoke/pg_html5_email_address)

提供与 HTML5 规范一致的电子邮箱地址校验功能。相比复杂而宽松的 RFC 5322 语法更贴近实际使用，适合在数据库中校验和存储邮箱地址。

## url_encode

`–s-d-r` | `1.2.5` | `18` `17` `16` | [`52🌟`](https://github.com/okbob/url_encode)

为 PostgreSQL 提供 URL 编码与解码函数。url_encode、url_decode 处理查询参数形式的字符串，uri_encode、uri_decode 则用于编码或还原完整 URI，支持含非 ASCII 字符的文本。

## pgsql_tweaks

`—-d-r` | `1.1.0` | `18` `17` `16` | [`–`](https://codeberg.org/pgsql_tweaks/pgsql_tweaks)

面向 PostgreSQL 的实用辅助扩展，托管在 Codeberg 上。README 信息有限，具体函数与用法请以项目仓库中的文档和源码为准。

## pg_relation_sql

`——-` | `0.2.2` | `18` `17` `16` | [`4🌟`](https://github.com/asmgit/pg_relation_sql)

按外键关系用纯 SQL 连接数据表。为每个外键生成一对查找与列表函数，规划器会将其完全内联为手写 JOIN 的等价执行计划，从而避免在每条查询中重复书写 ON 条件。

## pg_extra_time

`—-d-r` | `2.1.0` | `18` `17` `16` | [`8🌟`](https://github.com/bigsmoke/pg_extra_time)

提供作者认为应当并入 PostgreSQL 标准发行版的日期时间函数和操作符。它可将 tstzrange/tsrange、interval 以及 timestamp/timestamptz 转换为秒数或天数，也可通过 float 强制转换取值，适合简化时间区间与时间间隔的数值化计算。

## pgpcre

`–s-d-r` | `0.20190509` | `18` `17` `16` | [`30🌟`](https://github.com/petere/pgpcre)

为 PostgreSQL 引入 Perl 兼容正则表达式（PCRE）的函数与操作符，底层基于 PCRE 库。它把正则模式作为独立的 pcre 数据类型，而不是普通 text，并提供 ~ 和 !~ 操作符判断字符串是否匹配或不符合模式。

## re2

`–s-dtr` | `0.4.1` | `18` `17` `16` | [`21🌟`](https://github.com/ClickHouse/pg_re2)

基于 re2 库为 PostgreSQL 提供与 ClickHouse 兼容的正则表达式函数。需要在系统中安装 re2，编译时还要有与 PostgreSQL 版本匹配的 ICU 开发头文件，适合在数据库中复用 ClickHouse 风格的正则匹配写法。

## icu_ext

`–s-d-r` | `1.11.0` | `18` `17` `16` | [`35🌟`](https://github.com/dverite/icu_ext)

用 C 语言封装 ICU 库能力并暴露给 PostgreSQL 应用，要求 PostgreSQL 编译时启用 ICU。提供排序规则比较与 sort key、Unicode 规范化、字符/词/句/行边界切分、音译 transform、易混淆与欺骗性字符串检查、Unicode 区块信息以及日期时间格式化与解析等函数。

## pgqr

`–s-d-r` | `1.0` | `18` `17` `16` | [`17🌟`](https://github.com/AbdulYadi/pgqr)

在 PostgreSQL 中生成二维码的扩展，基于 QR-Image-embedded 实现，改为在内存中构造每像素 1 位的单色位图并将整个包封装为扩展。函数 pgqr 接收待编码文本、纠错级别、模型编号和点阵缩放倍数，直接返回可用于显示的单色位图。

## envvar

`–s-d-r` | `1.0.1` | `18` `17` `16` | [`6🌟`](https://github.com/theory/pg-envvar)

提供 get_env(TEXT) 函数，用于读取数据库服务器进程上设置的环境变量值。适合在 SQL 中直接获取部署环境配置，而无需额外查询系统表。

## byteamagic

`–s-d-r` | `0.2.4` | `18` `17` `16` | [`9🌟`](https://github.com/nmandery/pg_byteamagic)

用于判定 bytea 类型 BLOB 数据的文件类型。可识别数据库中存储的二进制内容的格式，便于对上传文件或附件做分类与校验。

## floatfile

`–s-d-r` | `1.3.1` | `18` `17` `16` | [`8🌟`](https://github.com/pjungwir/floatfile)

把 float 数组保存到独立文件中，从而实现极快的查询与追加写入，避免数组更新带来的 MVCC 开销。适合存储百万级浮点数据，并可与 aggs_for_arrays、floatvec 等扩展配合做聚合分析。

## external_file

`—-d–` | `1.2` | `18` `17` `16` | [`52🌟`](https://github.com/darold/external_file)

提供 EFILE 数据类型，用于访问 PostgreSQL 服务器文件系统中的外部文件，功能类似 Oracle 的 BFILE。通过 DIRECTORY 与 FILENAME 定位文件并借助服务端 lo_* 函数安全读写，适合在库外存放非结构化二进制数据。

## pg_render

`–s-d–` | `0.1.3` | `18` `17` `16` | [`66🌟`](https://github.com/mkaski/pg_render)

在 SQL 中渲染 HTML 的模板引擎扩展，基于 Liquid 模板语言实现。提供 render 和 render_agg 函数，可将查询结果或 JSON 套用模板生成页面，常与 PostgREST 搭配使用。

## pg_readme

`—-d-r` | `0.7.1` | `18` `17` `16` | [`13🌟`](https://github.com/bigsmoke/pg_readme)

依据 pg_description 系统目录中的 COMMENT 对象，为数据库扩展或 schema 自动生成 README.md 文档，帮助开发者用注释维护与同步项目说明。

## pg_readme_test_extension

`—-d-r` | `0.7.1` | `18` `17` `16` | [`13🌟`](https://github.com/bigsmoke/pg_readme/tree/master/pg_readme_test_extension)

pg_readme 仓库自带的测试用扩展，用于验证基于 COMMENT 生成 README.md 文档的功能是否正常，不面向实际业务场景使用。

## ddl_historization

`—-d–` | `1.0.0` | `18` `17` `16` | [`4🌟`](https://github.com/rodo/pg_ddl_historization)

把数据库上发生的所有 DDL 变更记录到一张表中，形成可查询的结构变更历史，适用于审计与排查表结构演进；也可通过 pg_tle 在 AWS RDS 上部署。

## data_historization

`—-dt-` | `1.1.0` | `18` `17` `16` | [`1🌟`](https://github.com/rodo/postgresql-data-historization)

用 PLPGSQL 脚本为表建立数据历史化机制，依次完成初始化对象、挂载触发器开始采集、停止与重置等步骤，变更数据写入以 _log 为后缀的分区表，便于按需清理旧数据。

## schedoc

`—-d–` | `0.0.2` | `18` `17` `16` | [`0🌟`](https://github.com/ZeroGachis/pg_schedoc)

基于 PostgreSQL 对象上的 COMMENT 构建自动化的 schema 文档，把 JSON 格式的列注释解析后存入表内，便于与 Django、DBT 等系统中的字段信息交叉对照，依赖 ddl_historization 扩展。

## pg_isok

`—-d–` | `1.4.1` | `18` `17` `16` | [`–`](https://codeberg.org/kop/pg_isok)

以查询为中心的 PostgreSQL 数据库内容监控工具，用自定义查询检查库内数据的实际内容与状态，适合做业务数据的持续巡检和告警。

## pg_describe

`–s-d-r` | `1.0.0` | `18` `17` | [`1🌟`](https://github.com/sajonaro/pg_describe)

在不执行 SQL 的前提下报告查询会返回什么，只做语法解析和分析，因此描述 DELETE 之类的语句也安全。它可推断参数类型，给出结果列名、类型 OID 与 SQL 类型名、考虑外连接的可空性以及列来源，并附带从 .sql 文件生成 TypeScript 代码的功能。

## colnames

`–s-d-r` | `1.7.0` | `18` `17` `16` | [`9🌟`](https://github.com/theory/colnames)

提供单个 SQL 函数 colnames()，接收一个 RECORD 值并返回该记录中各列名称组成的数组。常用于触发器函数中需要取得列名来拼接查询字符串的场景。

## hashlib

`–s-d-r` | `1.1` | `18` `17` `16` | [`58🌟`](https://github.com/markokr/pghashlib)

为 PostgreSQL 提供实现稳定的哈希函数，其算法不随数据库版本变化，适合在跨版本环境中生成可复现的哈希值。可按算法名调用 hash_string、hash64_string 等函数，分别返回 32 位或 64 位结果。

## xxhash

`–s-d-r` | `0.0.1` | `18` `17` `16` | [`11🌟`](https://github.com/hatarist/pg_xxhash)

把 xxhash 算法引入 PostgreSQL，提供 xxh32、xxh64、xxh3_64 和 xxh128 等函数及其返回 bytea 的变体，用于在 SQL 中快速计算文本的哈希值。作者明确提示不适合用于严肃的生产环境。

## shacrypt

`–s-d-r` | `1.1` | `18` `17` `16` | [`9🌟`](https://github.com/dverite/postgres-shacrypt)

提供 sha256_crypt 和 sha512_crypt 函数，按 SHA-crypt 规范用给定 salt 生成 SHA256-CRYPT、SHA512-CRYPT 密码哈希。适合在数据库中生成与 Linux shadow 兼容的密码散列，并支持指定 rounds 迭代次数。

## cryptint

`–s-d-r` | `1.0.0` | `18` `17` `16` | [`9🌟`](https://github.com/dverite/cryptint)

对整数做可逆加密：32 位 int 使用 SKIP32（10 字节密钥），64 位 bigint 使用 XTEA（16 字节密钥），对应 skip32_encrypt/decrypt 和 xtea_encrypt/decrypt 函数。可用于对 ID 等整数值进行混淆，但 README 提示 SKIP32 算法年代久远、强度极弱。

## pguecc

`–s-d-r` | `1.0` | `18` `17` `16` | [`15🌟`](https://github.com/ameensol/pg-ecdsa)

把 micro-ecc 椭圆曲线密码库的原语暴露给 PostgreSQL，目前仅支持密钥生成和签名。ecdsa_sign 可按指定哈希函数和曲线（如 sha256、secp160r1）对输入数据签名，依赖 pgcrypto 扩展。

## sparql

`—-d–` | `1.0` | `18` `17` `16` | [`23🌟`](https://github.com/lacanoid/pgsparql)

用于在 PostgreSQL 中查询 SPARQL 数据源，会把 SPARQL 查询编译成视图和配套函数，从而直接在 SQL 里使用远程 RDF 数据。目前主要配合 Virtuoso 使用，例如 dbpedia，其他 RDF 后端不一定可用。

## opencc

`–s-dt-` | `0.1.0` | `18` `17` `16` | [`1🌟`](https://github.com/pgsty/pg_opencc)

基于 OpenCC 做中文转换，支持简体、繁体、台湾、香港用字及日本新字体，并能按词组上下文区分歧义。OpenCC 1.4.2 与全部词典已编译进扩展，无运行时依赖且各平台结果一致，可安全用于表达式索引和生成列。

# FUNC

## pg_idkit

`–s-d–` | `0.4.0` | `18` `17` `16` | [`424🌟`](https://github.com/VADOSWARE/pg_idkit)

基于 pgrx 用 Rust 编写的 PostgreSQL 扩展，可在数据库内生成 UUIDv6、UUIDv7、ULID、KSUID、NanoID、xid、cuid、cuid2 等多种流行标识符，省去在应用层生成 ID 的麻烦。

## pgx_ulid

`–sLd–` | `0.2.3` | `18` `17` `16` | [`503🌟`](https://github.com/pksunkara/pgx_ulid)

为 PostgreSQL 提供 ulid 类型和生成函数，以二进制而非文本存储，支持 ULID 与 uuid、timestamp 之间的转换，并保证单调性，让带时间戳的 ULID 索引比随机 UUID 更少碎片化。

## pg_uuidv7

`–s-d-r` | `1.7.0` | `18` `17` `16` | [`429🌟`](https://github.com/fboulnois/pg_uuidv7)

在 PostgreSQL 中生成符合规范的 version 7 UUID，可提取其中的毫秒级时间戳，也可将时间戳转回 v7 UUID。这些是普通 UUID，能用作主键和索引，且因全局可排序而适合分布式系统。

## pg_uuid_v8

`–s-d–` | `1.1.0` | `18` `17` `16` | [`3🌟`](https://github.com/ineron/pg_uuid_v8)

生成与 UUID v4 格式兼容的隐写式 UUID，把微秒级时间戳隐藏在 UUID 内，可用 XOR、AES-128 或 AES-256 混淆，兼顾随机主键的隐私与按时间范围查询、函数索引的性能。

## permuteseq

`–s-d-r` | `1.2.2` | `18` `17` `16` | [`39🌟`](https://github.com/dverite/permuteseq)

用 Feistel 密码和 cycle-walking 对序列做可扩展的伪随机置换，无需查询已用值即可生成唯一、非连续、看似随机的数字，结果由密钥决定且可复现，也能反向还原出原始序号。

## pg_hashids

`–s-d-r` | `1.3` | `18` `17` `16` | [`324🌟`](https://github.com/iCyberon/pg_hashids)

基于 hashids 算法把整数编码成短小、唯一且无顺序规律的字符串，也能反向解码。常用于隐藏数据库主键，或把多个参数打包成一个短 ID。

## pg_slug_gen

`–s-d-r` | `1.0.0` | `18` `17` `16` | [`–`](https://github.com/nandoolle/pg_slug_gen)

把文本转换为 URL 友好 slug 的 PostgreSQL 扩展，适合为文章标题、页面路径等生成稳定、可读的短标识。仓库未提供 README，具体函数以源码为准。

## sequential_uuids

`–s-d-r` | `1.0.3` | `18` `17` `16` | [`311🌟`](https://github.com/tvondra/sequential-uuids)

提供两种顺序化 UUID 生成器，让新值更集中地落在索引右侧，缓解全随机 UUID 造成的随机 I/O 和缓存命中率下降，同时保留足够随机性以降低碰撞概率。

## typeid

`–s-d–` | `0.4.1` | `18` `17` `16` | [`29🌟`](https://github.com/blitss/typeid-postgres)

让 PostgreSQL 原生支持 TypeID，即一种可排序、可转换为 UUID 的现代标识类型。以带前缀的字符串形式输出，内部存储二进制 UUID，可作为主键并支持相互比较。

## snowflake

`–s-d–` | `2.6.0` | `18` `17` `16` | [`103🌟`](https://github.com/pgEdge/snowflake)

基于 int8 与 sequence 的唯一 ID 方案，可选择替代内置的 bigserial。通过 snowflake.node 配置节点编号，在多节点部署中生成互不重复的 Snowflake ID。

## topn

`–s-d–` | `2.7.1` | `18` `17` `16` | [`249🌟`](https://github.com/citusdata/postgresql-topn)

用近似算法快速返回数据集中的 top 值，按指定规则排序取值，计算和内存开销都很小。适合物化 top 值并增量更新或按时间区间合并，常用于实时分析看板和亚秒级响应的排行榜查询。

## quantile

`–s-d-r` | `1.1.8` | `18` `17` `16` | [`39🌟`](https://github.com/tvondra/quantile)

提供计算分位数的聚合函数，既可返回单个分位数，也可一次返回任意多个分位数组成的数组。它早于 PostgreSQL 内置的 percentile_cont 和 percentile_disc，在某些场景下更快，但建议先评估内置函数再决定是否使用。

## lower_quantile

`–s-d-r` | `1.0.3` | `18` `17` `16` | [`0🌟`](https://github.com/tvondra/lower_quantile)

实现 lower quantile 聚合函数，按排名 floor(1 + q(n−1)) 取出排序后多重集中的对应元素。它的定义与 percentile_disc 略有差别，后者返回首个超过阈值的值，而某些论文（如 ddsketch）给出的保证正是基于这种定义。

## count_distinct

`–s-d-r` | `3.0.2` | `18` `17` `16` | [`80🌟`](https://github.com/tvondra/count_distinct)

提供 COUNT(DISTINCT ...) 的替代聚合，避免大数据量下因排序带来的性能问题。包含 count_distinct 和 array_agg_distinct 等函数，可处理定长按值传递类型及数组元素，所有数据保存在内存中，需注意内存消耗。

## omnisketch

`–s-d-r` | `1.0.2` | `18` `17` `16` | [`0🌟`](https://github.com/tvondra/omnisketch)

实现 OmniSketch 数据结构，把数据在线聚合成近似 sketch 后回答查询，可估计带任意谓词的计数，且对并行计算友好。通过 epsilon 和 delta 参数控制估计精度，数值越小结果越准但 sketch 越大，适用于高吞吐多维流式分析。

## ddsketch

`–s-d-r` | `1.0.1` | `18` `17` `16` | [`3🌟`](https://github.com/tvondra/ddsketch)

实现 DDSketch 分位数草图，用于在线累积数据流的分布信息，并提供相对误差保证。草图完全可合并，适合并行计算与分布式场景下的分位数估计。

## vasco

`–s-d–` | `0.1.0` | `18` `17` `16` | [`35🌟`](https://github.com/Florents-Tselai/vasco)

基于最大信息系数 MIC 与 MINE 系列统计量，发现数据中隐藏的相关性。可用 mic(x,y) 聚合函数计算任意两列的相关强度，并生成列间的相关性矩阵。

## xicor

`–s-d–` | `0.1.1` | `18` `17` `16` | [`5🌟`](https://github.com/Florents-Tselai/pgxicor)

提供 xicor(X, Y) 聚合函数，计算 Chatterjee 提出的 XI 相关系数。它能检测一般的函数型关系，比只适用于线性关系的 corr() 更适合识别抛物线等非线性模式。

## weighted_statistics

`–s-d-r` | `1.0.0` | `18` `17` `16` | [`3🌟`](https://github.com/schmidni/pg_weighted_statistics)

提供用 C 实现的高性能加权统计函数，包括加权均值、方差、标准差、各类加权分位数与加权中位数。针对稀疏数据自动处理权重和小于 1 的情况，比 PL/pgSQL 实现快很多。

## pg_statkit

`–s-d–` | `1.1.0` | `17` `16` | [`1🌟`](https://github.com/kirdmi/pg_statkit)

面向临床、公共卫生与生物医学数据分析的统计工具包，用 Rust 与 pgrx 编写。在库内直接提供描述性统计与效应量，如 Cohen's d、odds ratio、risk ratio，免去导出到 R 或 Python。

## datasketches

`–s-d-r` | `1.7.0` | `18` `17` `16` | [`95🌟`](https://github.com/apache/datasketches-postgresql)

基于 Apache DataSketches 提供近似算法，目前在 PostgreSQL 中支持 CPC 压缩概率计数 sketch，可在占用空间很小的情况下估算去重计数，适合大数据量下的近似统计。

## fbsql

`—-d–` | `0.1.0` | `18` `17` `16` | [`0🌟`](https://github.com/dsc-chiba-u/FbSQL)

用 R 公式语法在 SQL 中做统计建模的扩展，模型拟合与预测都以关系为输入输出，不暴露模型对象。首个实现是 glm，提供 fbsql.fit_glm() 与 fbsql.predict_glm() 两个函数。

## tdigest

`–s-d-r` | `1.4.7` | `18` `17` `16` | [`98🌟`](https://github.com/tvondra/tdigest)

实现 t-digest 数据结构，用于在线累积分位数、截尾均值等基于排名的统计量，对并行计算友好，存储紧凑且估算精度高于传统摘要算法。

## hdr_histogram

`–s-dtr` | `1.0` | `18` `17` `16` | [`7🌟`](https://github.com/vovcke/pg_hdr_histogram)

把序列化后的 HDR histogram 作为 PostgreSQL 原生类型存储，用于计算 p50、p99、p99.9 等有界误差的延迟百分位，并可通过 hdr_merge 无损合并多个直方图。

## first_last_agg

`–s-d-r` | `0.1.4` | `18` `17` `16` | [`34🌟`](https://github.com/wulczer/first_last_agg)

提供 first 和 last 两个聚合函数，可作用于任意元素类型，返回分组内第一个或最后一个值。分组内顺序默认不确定，建议在聚合表达式中配合 ORDER BY 使用。

## extra_window_functions

`–s-d-r` | `2.0` | `18` `17` `16` | [`31🌟`](https://github.com/xocolatl/extra_window_functions)

为 PostgreSQL 补充额外的窗口函数。部分函数以函数形式实现 SQL 标准功能（如让 LEAD、LAG、FIRST_VALUE、LAST_VALUE、NTH_VALUE 跳过 NULL，或让 NTH_VALUE 从窗口帧起点或终点计数），另一些则扩展标准或提供新的窗口计算。

## floatvec

`–s-d-r` | `1.1.1` | `18` `17` `16` | [`16🌟`](https://github.com/pjungwir/floatvec)

为 PostgreSQL 的数值数组提供基础算术运算，把数组当作向量。支持加、减、乘、除和幂运算，全部为逐元素计算，参数可以是两个等长数组、数组与标量或标量与数组，适用于 SMALLINT、INTEGER、BIGINT、REAL、DOUBLE PRECISION 等数值类型。

## aggs_for_vecs

`–s-d-r` | `1.4.1` | `18` `17` `16` | [`38🌟`](https://github.com/pjungwir/aggs_for_vecs)

用 C 实现的 PostgreSQL 聚合扩展，提供 min、max、avg、var_samp 等聚合函数，但作用于数组而非标量。它把每行数组视为向量，按元素位置独立聚合，例如 vec_to_min 会取各数组同一下标位置的最小值，适合按行存储向量的统计场景。

## aggs_for_arrays

`–s-d-r` | `1.3.3` | `18` `17` `16` | [`50🌟`](https://github.com/pjungwir/aggs_for_arrays)

用 C 编写的 PostgreSQL 扩展，提供针对单个数值数组的统计函数，例如用 array_to_hist 生成直方图。把大量数值存进一行的数组再整体计算，比逐行聚合快得多，相当于简易列式存储，适合数据基本不变、读取频繁的分析场景。

## argm

`–s-d-r` | `1.1.1` | `18` `17` `16` | [`27🌟`](https://github.com/bashtanov/argm)

提供 argmax、argmin 等聚合函数，在每个分组内按 key 的字典序选出最大或最小的行并返回其对应值，可简化并加速 SQL 查询。配合 GROUP BY 使用通常比 DISTINCT ON 更快，还能与同一分组下的其他聚合函数并用。

## pg_csv

`–s-d-r` | `1.0.2` | `18` `17` `16` | [`30🌟`](https://github.com/PostgREST/pg_csv)

提供可组合的 CSV 导出与导入函数，弥补 COPY 无法用于预备语句、CTE 和视图定义的不足。其中的 csv_agg 聚合按 RFC 4180 规则生成 CSV 并自动加引号，还支持自定义分隔符以输出管道符或制表符分隔的文本。

## arraymath

`–s-d-r` | `1.1` | `18` `17` `16` | [`17🌟`](https://github.com/pramsey/pgsql-arraymath)

为 integer、float 和 numeric 数组提供逐元素运算与比较，运算符以 @ 前缀区分，例如 @+ 与 @= 会返回逐元素结果或布尔数组。另提供 array_sum、array_avg、array_median、array_sort 等聚合与排序函数，简化数组统计。

## pg_math

`–s-d-r` | `1.1.0` | `18` `17` `16` | [`19🌟`](https://github.com/chanukyasds/pg_math)

基于 GNU Scientific Library 的 C 扩展，在 PostgreSQL 内计算各类统计分布函数。覆盖高斯、指数、伽马、卡方、T、Beta、泊松、二项、超几何等三十余种分布，并提供带 cdf 前缀的累积分布函数。

## random

`–s-d-r` | `2.0.0` | `18` `17` `16` | [`1🌟`](https://github.com/tvondra/random)

为多种数据类型生成随机值的扩展，常用于构造测试数据。所有函数都接受 seed 和 nvalues 参数，用同一 seed 可重复生成相同取值集合，但值的顺序和跨列组合可能不同，且实际去重数量可能因随机碰撞而少于 nvalues。

## base36

`–s-d-r` | `1.1.1` | `18` `17` `16` | [`17🌟`](https://github.com/adjust/pg-base36)

提供 base36 编码与解码能力，并定义专用数据类型来存储编码后的值。支持 base36 与 int、bigint 之间的互转，也可将 bytea 转换为 hugebase36 类型。

## base62

`–s-d-r` | `0.0.1` | `18` `17` `16` | [`3🌟`](https://github.com/adjust/pg-base62)

提供 base62、bigbase62、hugebase62 三种数据类型，用 0-9、A-Z、a-z 共 62 个字符对数值进行编码和解码，支持 btree 与 hash 索引，其中 hugebase62 还可与 bytea 互转，便于紧凑存储短标识。

## pg_base58

`–s-d–` | `0.0.1` | `18` `17` `16` | [`2🌟`](https://github.com/Fell-x27/pg_base58)

用 Rust 实现的 Base58 编解码扩展，提供 base58_encode 与 base58_decode 两个函数，可以直接在 SQL 中把字符串编码为 Base58 形式或还原，便于在数据库内生成和解析 Base58 表示的数据。

## financial

`–s-d-r` | `1.0.1` | `18` `17` `16` | [`29🌟`](https://github.com/intgr/pg_financial)

提供 xirr(amounts, dates [, guess]) 聚合函数，用于计算不定期现金流的内部收益率，行为类似 Excel、LibreOffice 等表格软件中的 XIRR，可根据交易金额与时间直接得到年化收益率结果。

## pg_accumulator

`–s-d–` | `1.2.0` | `18` `17` `16` | [`5🌟`](https://github.com/Treedo/pg_accumulator)

提供声明式的累积寄存器，可跨任意维度即时读取余额与周转额，并具备事务一致性、追溯更正等能力，让记账类系统不必在应用层手写流水表、汇总表、触发器与重算逻辑。

## convert

`–s-d–` | `0.1.0` | `18` `17` `16` | [`3🌟`](https://github.com/rustprooflabs/convert)

提供常见单位换算函数，例如米与英尺、英里与公里之间的转换，基于 Rust 的 pgrx 框架构建，方便在处理空间数据时直接在 SQL 中完成度量单位换算。

## pg_try_cast

`–s-dtr` | `1.0` | `18` `17` `16` | [`0🌟`](https://github.com/Mazuco/pg_try_cast)

为 PostgreSQL 提供 TRY_CAST 和 TRY_CONVERT 函数，把文本转换为任意类型，转换失败时返回 NULL 或指定的回退值，而不是让整条查询报错中断。适用于清洗含脏数据的导入表，比前置正则或 PL/pgSQL 异常块方案更快。

## parray_gin

`–s-d-r` | `1.5.0` | `18` `17` `16` | [`24🌟`](https://github.com/theirix/parray_gin)

为数组类型提供 GIN 索引和操作符支持，用于数组元素的部分匹配查询，例如判断数组中是否包含指定元素。适合在标签、分类等多值字段上加速包含与交集类检索。

# ADMIN

## pg_repack

`-bs-d–` | `1.5.3` | `18` `17` `16` | [`2.3k🌟`](https://github.com/reorg/pg_repack)

在线清理表和索引膨胀，并可选择恢复聚簇索引的物理顺序。与 CLUSTER 和 VACUUM FULL 不同，它在处理过程中不需要对目标表加排他锁，因此能在业务持续读写的情况下完成整理，性能接近直接使用 CLUSTER。

## pg_rewrite

`–sLd-r` | `2.2` | `18` `17` `16` | [`46🌟`](https://github.com/cybertec-postgresql/pg_rewrite)

重写表数据的工具，把表数据复制到新的存储文件中，并在重写期间同时允许对该表的读写访问。常用于修改列的数据类型（如 integer 改 bigint）、把已有表转换为分区表，或调整列顺序以节省存储空间。

## pg_query_rewrite

`–sLd–` | `0.0.5` | `18` `17` `16` | [`24🌟`](https://github.com/pierreforstmann/pg_query_rewrite)

把一条给定的源 SQL 语句翻译成另一条预先定义好的 SQL 语句，通过 pgqr_add_rule 添加转换规则，规则数量上限由 pg_query_rewrite.max_rules 参数控制。需要配置在 shared_preload_libraries 中加载，适合在不改客户端代码的前提下统一改写语句。

## pg_squeeze

`–sLd–` | `1.9.4` | `18` `17` `16` | [`705🌟`](https://github.com/cybertec-postgresql/pg_squeeze)

在不阻塞读写的情况下清除表内未使用的空间以消除膨胀，还可按指定索引重排元组，效果类似并发执行 CLUSTER。它完全在服务端实现，用后台工作进程和逻辑解码捕获并发变更，可作为 pg_repack 的替代方案。

## pg_dirtyread

`–s-d-r` | `2.8` | `18` `17` `16` | [`170🌟`](https://github.com/df7cb/pg_dirtyread)

提供读取关系中已删除但尚未被 vacuum 清理的行的能力。pg_dirtyread() 返回 RECORD，需用表别名声明列结构，还能取出已删除列的内容，常用于数据恢复和问题排查。

## pgfincore

`–s-d-r` | `1.4.0` | `18` `17` `16` | [`111🌟`](https://github.com/klando/pgfincore)

借助 mincore 管理 PostgreSQL 关系在操作系统页缓存中的页面。可查询某个表或索引有多少磁盘块已被缓存，并用 POSIX_FADVISE 的 WILLNEED、DONTNEED 把块推入或逐出页缓存，便于预热或恢复缓存状态。

## pg_cooldown

`–s-d-r` | `0.1` | `18` `17` `16` | [`2🌟`](https://github.com/rbergm/pg_cooldown)

把指定关系（表或索引）的所有数据页从 shared buffer 中移除，作用与 pg_prewarm 正好相反。主要用于在研究中方便地模拟数据库冷启动场景。

## ddlx

`—-d–` | `0.31` | `18` `17` `16` | [`156🌟`](https://github.com/lacanoid/pgddl)

用纯 SQL 从系统目录生成对象的 DDL 脚本，例如 CREATE TABLE，功能类似其他数据库的 SHOW CREATE TABLE。无需 pg_dump 或 shell 访问，任何能执行 SQL 的客户端都能提取数据库对象的定义。

## pglinter

`–s-dt-` | `2.0.0` | `18` `17` `16` | [`171🌟`](https://github.com/pmpetit/pglinter)

用 Rust 编写的 PostgreSQL 数据库 linter，直接在内核中分析数据库设计与对象，检测潜在问题、性能隐患和不符合最佳实践的做法，例如跨 schema 的外键，并支持 SARIF 格式输出。

## prioritize

`–s-d-r` | `1.0.4` | `18` `17` `16` | [`22🌟`](https://github.com/schmiddy/pg_prioritize)

通过 SQL 函数查询和设置 PostgreSQL 后端进程的优先级，相当于在数据库内对后端执行 renice，可用来降低批处理或分析类查询对系统的影响。

## pg_checksums

`-b—–` | `1.4` | `18` `17` `16` | [`31🌟`](https://github.com/credativ/pg_checksums)

在 PostgreSQL 集群上校验、启用或停用数据页校验和，源自官方 pg_checksums 工具，支持在线校验、通过 SIGUSR1 切换进度显示以及限制 I/O 速率。

## pg_integrity_checksums

`–s-d-r` | `2.2.0` | `18` `17` `16` | [`2🌟`](https://github.com/VictorNagibator/pg_integrity_checksums)

为表、索引和数据库提供逻辑与物理校验和，用于在迁移、升级或复制后核对数据是否一致，可定位副本之间差异的行并发现页面损坏。

## pg_readonly

`–sLd–` | `1.0.6` | `18` `17` `16` | [`19🌟`](https://github.com/pierreforstmann/pg_readonly)

通过 shared_preload_libraries 加载，可将集群内所有数据库设为只读，常用于维护窗口、迁移或故障时阻止写入。

## pgdd

`–s-d–` | `0.6.1` | `18` `17` `16` | [`56🌟`](https://github.com/rustprooflabs/pgdd)

在数据库内提供数据字典，通过标准 SQL 查询语法实现元数据自省，让数据库的所有用户都能方便地查看和使用可读的数据字典。

## pg_permissions

`—-d–` | `1.4.1` | `18` `17` `16` | [`169🌟`](https://github.com/cybertec-postgresql/pg_permissions)

用于审查 PostgreSQL 数据库中的对象权限。先在 permission_target 表中登记角色期望拥有的权限，再与表和视图等对象的实际授权比对，检查权限配置是否符合预期。

## pgautofailover

`-bsLd–` | `2.2` | `18` `17` `16` | [`1.4k🌟`](https://github.com/hapostgres/pg_auto_failover)

为 PostgreSQL 集群提供自动故障转移和高可用能力，由 pgautofailover 扩展、monitor 服务与 keeper 进程组成，监控节点健康状态并管理主备切换，在备节点异常时避免数据丢失。

## pg_catcheck

`-b—–` | `1.6.0` | `18` `17` `16` | [`87🌟`](https://github.com/EnterpriseDB/pg_catcheck)

用于诊断 PostgreSQL 系统目录损坏的检查工具，能报告系统目录表存在哪些问题以及严重程度，也可定期运行以发现可能未被察觉的损坏。

## pre_prepare

`–s-d-r` | `0.9` | `18` `17` `16` | [`46🌟`](https://github.com/dimitri/preprepare)

让 PostgreSQL 的预备语句对连接池更友好，通过配置一张语句表，在连接建立时尽早把所有语句 PREPARE 好，客户端只需调用 EXECUTE，适合配合 pgbouncer 使用。

## pg_upless

`—-dt-` | `0.0.3` | `18` `17` `16` | [`2🌟`](https://github.com/rodo/pg_upless)

通过在你关注的数据表上创建触发器，统计那些没有实际修改任何字段的 UPDATE 语句，帮助发现 ORM 产生的无意义更新。属于短期启用的诊断工具，长期开启会略微降低查询性能。

## pgcozy

`—-d–` | `1.0` | `18` `17` `16` | [`2🌟`](https://github.com/vventirozos/pgcozy)

为共享缓冲区缓存拍摄快照，之后按照快照预热缓冲池。快照以 jsonb 形式存放在专用 schema 和数据表中，便于查看、备份和迁移，依赖 pg_prewarm 与 pg_buffercache。

## pg_orphaned

`–s-d-r` | `1.0` | `18` `17` `16` | [`24🌟`](https://github.com/bdrouvot/pg_orphaned)

提供一组函数来列出、移动、移回和清理数据目录中的孤儿文件，并规避进行中事务带来的误判。可先把可疑文件移到 orphaned_backup 目录观察，确认后再删除。

## pg_crash

`–sLd-r` | `0.3` | `18` `17` `16` | [`34🌟`](https://github.com/cybertec-postgresql/pg_crash)

按周期或随机向数据库进程发送 kill 等信号，使实例崩溃，用于高可用与故障切换测试。需要在 shared_preload_libraries 中预加载，并配置信号类型和超时时间。

## macavity

`–s-d-r` | `0.2.0` | `18` `17` `16` | [`2🌟`](https://github.com/CrystallineCore/Macavity)

在指定执行点按会话注入确定性的故障，可制造报错、延迟或后端进程崩溃，用于测试 PostgreSQL 及其扩展的错误处理路径。该工具会故意破坏实例，只应在测试集群中使用。

## pg_cheat_funcs

`–s-d-r` | `1.0` | `18` `17` `16` | [`39🌟`](https://github.com/MasaoFujii/pg_cheat_funcs)

提供一组"取巧"但实用的 PostgreSQL 辅助函数，便于查看数据库内部状态。例如可返回所有内存上下文的统计信息，用于排查内存使用情况。

## fio

`–s-d-r` | `1.0` | `18` `17` `16` | [`33🌟`](https://github.com/csimsek/pgsql-fio)

在数据库中提供基础的文件系统操作函数，统一以 fio_ 为前缀。支持创建目录、修改权限和按通配符列出目录内容等操作。

## qos

`–sLd–` | `1.1.0` | `18` `17` `16` | [`64🌟`](https://github.com/appstonia/pg_qos)

为会话和查询提供 QoS 式资源治理，让同一集群内的多个数据库互不影响。可限制 CPU 核数绑定、并发事务与语句数、每会话 work_mem，并按角色或数据库限制事务和语句速率。

## pg_pathcheck

`–sL—` | `0.9.1` | `18` `17` | [`13🌟`](https://github.com/danolivo/pg_pathcheck)

用于校验 PostgreSQL 查询规划器生成的 Path 树状态，通过遍历每个可达 Path 并检查 NodeTag 来发现已释放或损坏的内存。主要用于开发调试和规划器缺陷排查。

## pgdisablelogerror

`–sLd-r` | `1.0` | `18` `17` `16` | [`0🌟`](https://github.com/fmbiete/pgdisablelogerror)

用于关闭指定 SQL 错误码的服务器日志记录，避免可接受的错误刷屏。例如可跳过唯一键冲突（23505）的日志，错误码通过 pgdisablelogerror.sqlerrcode 配置。

## online_advisor

`–sLd-r` | `1.0` | `18` `17` `16` | [`19🌟`](https://github.com/knizhnik/online_advisor)

通过执行器钩子（类似 auto_explain）在查询结束后分析执行计划，识别过滤大量行的条件、行数估算偏差以及规划开销过大等问题，并建议创建索引或扩展统计信息来提升查询速度。

## pg_column_tetris

`—-d–` | `0.1.0` | `18` `17` `16` | [`104🌟`](https://github.com/rogerwelin/pg_column_tetris)

通过检查表的列顺序与类型对齐情况，减少 PostgreSQL 行内填充字节造成的存储浪费。开发阶段可对不理想的 CREATE TABLE 发出警告，也能审计已有表并生成优化后的迁移脚本。

## cat_tools

`—-d–` | `0.4.0` | `18` `17` `16` | [`3🌟`](https://github.com/Postgres-Extensions/cat_tools)

提供访问 PostgreSQL 系统目录表、视图和函数的工具集，主要供程序代码而非人工使用。使用时需要把 cat_tools__usage 权限授予相关角色。

## pg_living_assertions

`—-d–` | `0.5.10` | `18` `17` `16` | [`1🌟`](https://github.com/Manuelreyesbravo/pg_living_assertions)

用于登记你声称数据库必须始终成立的事实，并为每条断言附带验证用的 SQL 和最近一次验证的日期。便于定期复查唯一索引、约束、审计触发器和 RLS 策略等状态是否仍然有效。

## pg_savior

`–sL–r` | `0.1.0` | `18` `17` `16` | [`100🌟`](https://github.com/viggy28/pg_savior)

检查 DML 和 DDL 语句以阻止误操作造成的数据丢失与高风险阻塞式表结构变更。可拦截无 WHERE 的 DELETE 和 UPDATE、超过影响行数阈值的操作、不安全的 CREATE INDEX、引发重写的 ADD COLUMN 以及大表 TRUNCATE，并中止事务。

## pg_circuit

`–sLd–` | `0.1.0` | `18` `17` `16` | [`14🌟`](https://github.com/PG-Circuit/pg-circuit)

在 PostgreSQL 内部运行的生产环境 SQL 断路器，解析语句并结合实时运行状态，对缺少 WHERE 的 UPDATE/DELETE、TRUNCATE、DROP 及破坏性 DDL 做出放行、告警或阻断判定，用于防止误操作。

## safeupdate

`–sL—` | `1.7` | `18` `17` `16` | [`154🌟`](https://github.com/eradman/pg-safeupdate)

在 UPDATE 或 DELETE 语句未指定 WHERE 条件时直接报错的轻量扩展，用于保护可写数据不被整表误改或误删，最初为防止 PostgREST 场景下的数据意外清除而设计。

## pg_strict

`–sLd–` | `1.0.5` | `18` `17` `16` | [`19🌟`](https://github.com/spa5k/pg_strict)

用 Rust 和 pgrx 编写的扩展，在解析分析阶段拦截危险的 UPDATE 和 DELETE，通过要求语句必须带 WHERE 子句来避免忘记条件而误改全表，提供更新与删除两条独立规则。

## pg_drop_events

`—-d–` | `0.1.0` | `18` `17` `16` | [`7🌟`](https://github.com/bolajiwahab/pg_drop_events)

借助事件触发器记录删除表、表列和物化视图语句的事务 ID、语句内容与执行用户，便于在误删后将该 xact_id 作为恢复目标，辅助完成基于时间点的恢复。

## table_log

`–s-d–` | `0.6.4` | `18` `17` `16` | [`2🌟`](https://github.com/df7cb/table_log)

提供一组函数用于把某张表的变更记录到单独的日志表中，并可将整表或指定行恢复到过去某个时间点的状态；恢复要求原表与日志表都具备主键。

## pgelog

`—-d–` | `1.0.2` | `18` `17` `16` | [`4🌟`](https://github.com/anfiau/pgelog)

通过 dblink 建立伪自治事务，把日志写入数据库表，即使调用方事务回滚日志也不会丢失。dblink 连接借助 pg_variables 缓存并在会话内复用，适合需要可靠记录操作痕迹的场景。

## pgagent

`-b–d–` | `4.2.3` | `18` `17` `16` | [`–`](https://www.pgadmin.org/docs/pgadmin4/development/pgagent.html)

Postgres 数据库的作业调度代理，可在复杂的时间计划上运行多步批处理、Shell 脚本和 SQL 任务。它独立于 pgAdmin 发布，通常配合 pgAdmin 创建和管理作业。

## pgpool_adm

`–s-d-r` | `4.7.3` | `18` `17` `16` | [`–`](https://pgpool.net/)

属于 Pgpool-II 开源中间件套件，提供一组管理函数，用于在数据库内对 Pgpool-II 的连接池、负载均衡与高可用节点进行管理和状态查看。

## pgpool_recovery

`–s-d-r` | `4.7.3` | `18` `17` `16` | [`–`](https://pgpool.net/)

属于 Pgpool-II 开源中间件套件，提供在线恢复相关函数，用于在 PostgreSQL 高可用集群中对故障或新增节点执行数据恢复与重新加入。

## pgpool_regclass

`–s-d-r` | `4.7.3` | `18` `17` `16` | [`–`](https://pgpool.net/)

属于 Pgpool-II 开源中间件套件，提供与 PostgreSQL regclass 类似的表名解析函数，便于在经 Pgpool-II 连接池与负载均衡访问的数据库中获取表的 OID。

# STAT

## pg_profile

`—-d–` | `4.16` | `18` `17` `16` | [`316🌟`](https://github.com/zubkov-andrei/pg_profile)

采集并保存 PostgreSQL 集群的历史负载样本，用于事后定位资源消耗最高的活动。基于统计视图以及 pg_stat_statements、pg_stat_kcache，用纯 pl/pgsql 实现，需配合 cron 定期取样，再生成两个样本区间之间的负载报告。

## pg_tracing

`–sLd-r` | `0.1.3` | `18` `17` `16` | [`408🌟`](https://github.com/DataDog/pg_tracing)

为分布式追踪生成服务端 span，针对采样查询记录 Planner、ProcessUtility、Executor 以及各类语句的执行片段。可通过视图读取 span 或输出为 OTLP JSON，并支持用 SQLCommenter 注释或 GUC 参数传播追踪上下文。

## pg_stat_ch

`–sLd–` | `0.4.0` | `18` `17` `16` | [`129🌟`](https://github.com/ClickHouse/pg_stat_ch)

把 PostgreSQL 中每条查询的执行遥测以原始事件形式实时导出到 ClickHouse，由 ClickHouse 完成聚合分析。事件先写入共享内存环形缓冲区，查询路径上没有网络 I/O，内存占用有界。

## pg_stat_backtrace

`–s-d-r` | `1.0.0` | `18` `17` `16` | [`3🌟`](https://github.com/Nickyoung0/pg_stat_backtrace)

提供从 SQL 抓取同主机上任意 PostgreSQL 进程 C 层调用栈的能力，弥补内置函数只能输出内存上下文、无法获取调用栈的空白。通过 ptrace 附加目标并用 libunwind 展开栈，不向目标发送 SIGSTOP。

## pg_stat_log

`–sLd-r` | `0.3` | `18` | [`30🌟`](https://github.com/fabriziomello/pg_stat_log)

基于 PostgreSQL 18 的 Custom Cumulative Stats API 统计日志消息数量，可按后端类型、数据库、用户、错误级别和 SQLSTATE 分组。计数通过 pg_stat_log 视图查询，需在 shared_preload_libraries 中预加载。

## pg_stat_plans

`–sLd-r` | `2.1.1` | `18` `17` `16` | [`52🌟`](https://github.com/pganalyze/pg_stat_plans)

按执行计划维度统计调用次数与执行时间，并在共享内存中保存对应的 EXPLAIN 文本。通过计划树哈希生成 plan ID 来识别计划形态变化，主要用于发现计划回归和查看正在运行查询的执行计划。

## pgfr_record

`—-d–` | `2.32.1` | `18` `17` `16` | [`82🌟`](https://github.com/neptunestation-com/pg_flight_recorder)

基于 pg_cron 在数据库后台持续采样的飞行记录器，无需外部 agent。每分钟采集等待事件、活跃会话与锁竞争，并快照 WAL、检查点、I/O、表与索引统计、查询性能、复制和 vacuum 进度，用于事后回答故障时数据库里发生了什么。

## pgfr_analyze

`—-d–` | `2.32.1` | `18` `17` `16` | [`82🌟`](https://github.com/neptunestation-com/pg_flight_recorder)

pg_flight_recorder 的可选分析组件，只读取 pgfr_record 采集的数据。提供报告生成、异常检测、按时间点回溯、事件时间线与影响面评估、容量规划和回归分析，用于日常巡检与故障排查。

## pgmonitor

`–sLd–` | `2.2.0` | `18` `17` `16` | [`93🌟`](https://github.com/CrunchyData/pgmonitor-extension)

在 PostgreSQL 内部收集指标，供 Prometheus exporter、Icinga/Nagios 等外部采集器抓取。指标结果存放在物化视图或表中，按可配置的定时器由内置后台 worker 自动刷新，并提供函数接口屏蔽不同主版本系统目录的差异。

## pgtelemetry

`—-d–` | `1.7` | `18` `17` `16` | [`27🌟`](https://github.com/adjust/pg-telemetry)

以视图和函数形式提供 PostgreSQL 使用情况统计，从系统统计信息推导出便于采集的数值指标。主要供 Zabbix、Munin、pganalyze 等监控系统定期拉取，另有一组函数供管理员排查性能问题。

## pg_statviz

`—-d–` | `1.2` | `18` `17` `16` | [`112🌟`](https://github.com/vyruss/pg_statviz)

采集 PostgreSQL 内部统计快照并做时间序列分析的极简扩展与工具组合。配套工具用 pandas 和 Matplotlib 将快照绘制成图表，便于追踪数据库长期性能变化、辅助调优与排障。

## pg_show_plans

`–sLd-r` | `2.1.8` | `18` `17` `16` | [`209🌟`](https://github.com/cybertec-postgresql/pg_show_plans)

查看当前所有正在运行的 SQL 语句的查询计划。计划可输出为 text、JSON、YAML 或 XML 格式，通过 shared_preload_libraries 加载后在共享内存哈希表中保存，适合在线诊断执行中的慢查询。

## pg_stat_kcache

`–sLd-r` | `2.3.2` | `18` `17` `16` | [`279🌟`](https://github.com/powa-team/pg_stat_kcache)

收集 PostgreSQL 后端进程实际发生的磁盘读写与 CPU 消耗统计。它依赖 pg_stat_statements，用于看清查询在文件系统层产生的真实 I/O 和 CPU 开销，便于定位性能瓶颈。

## pg_rusage

`–s-d-r` | `1.0` | `18` `17` `16` | [`349🌟`](https://github.com/michaelpq/pg_plugins/tree/ae57c1f3df697fb942f4576f873a655187193ace/pg_rusage)

在会话内进行 CPU 使用量测量的小型扩展。提供一个 SQL 函数开启测量、另一个函数停止测量，停止时会给出这段区间内累计的 CPU 消耗结果，适合手工评估语句或代码块的资源开销。

## pg_stat_monitor

`–sLd-r` | `2.4.0` | `18` `17` `16` | [`593🌟`](https://github.com/percona/pg_stat_monitor)

面向 PostgreSQL 的查询性能监控工具。它在单个视图中汇总查询来源、执行与计划统计以及查询元数据，让数据库用户获得更完整的可观测性，用于调试和优化查询性能。

## pg_qualstats

`–sLd–` | `2.1.4` | `18` `17` `16` | [`345🌟`](https://github.com/powa-team/pg_qualstats)

收集 WHERE 语句和 JOIN 子句中出现谓词的统计信息，用于分析最常执行的过滤条件、发现缺失的索引，并识别经常被一起查询的相关列。PoWA 项目基于它提供索引建议。

## pg_store_plans

`–sLd-r` | `1.10` | `18` `17` `16` | [`70🌟`](https://github.com/ossc-db/pg_store_plans)

像 pg_stat_statements 记录查询那样存储执行计划，用于集中查看和分析数据库中 SQL 语句的执行计划及其统计信息。

## pg_track_settings

`—-d–` | `2.1.2` | `18` `17` `16` | [`55🌟`](https://github.com/rjuju/pg_track_settings)

跟踪 PostgreSQL 配置参数的修改历史，通过定期调用快照函数记录 pg_settings 视图和 pg_db_role_setting 表中变更的设置，可查询指定时刻的配置、两个时间点之间的差异以及某个参数的变化记录。

## pg_track_optimizer

`–sLd-r` | `0.9.2` | `18` `17` | [`34🌟`](https://github.com/danolivo/pg_track_optimizer)

通过对比查询计划器的行数估算与实际执行统计，检测估算偏差导致的次优执行计划，并在大量查询中找出估算误差最严重的语句，便于针对性修正统计信息。

## pg_wait_sampling

`–sLd-r` | `1.1.11` | `18` `17` `16` | [`181🌟`](https://github.com/postgrespro/pg_wait_sampling)

基于采样的等待事件统计扩展，通过后台工作进程按可配置的周期采样各进程的等待事件并写入内存环形缓冲区，从而为服务器行为提供等待事件的历史记录和描述性统计。

## pg_datasentinel

`–sLd–` | `1.0` | `18` `17` `16` | [`18🌟`](https://github.com/datasentinel/pg_datasentinel)

提供可观测性视图，在 pg_stat_activity 上补充每个 backend 的内存与临时文件用量，把 vacuum、analyze、临时文件与 checkpoint 事件记录到共享内存环形缓冲区，并估算 XID/MXID 回卷风险以及容器 cgroup 的 CPU、内存限制。

## pgsentinel

`–sLd-r` | `1.5.2` | `18` `17` `16` | [`192🌟`](https://github.com/pgsentinel/pgsentinel)

通过后台 worker 周期性采样活跃会话，把会话活动历史保存在内存环形缓冲区中，免去反复查询 pg_stat_activity 的麻烦；与 pg_stat_statements 配合时还能把会话活动关联到对应查询的统计信息。

## system_stats

`–s-d-r` | `4.1` | `18` `17` `16` | [`184🌟`](https://github.com/EnterpriseDB/system_stats)

提供一组函数读取操作系统层面的统计信息，包括 CPU、内存和磁盘等指标，供监控使用；支持 Linux、macOS 与 Windows，某些平台上不适用的值返回 NULL。

## pgexporter_ext

`–s-d-r` | `0.2.5` | `18` `17` `16` | [`15🌟`](https://github.com/pgexporter/pgexporter_ext)

为 pgexporter 提供额外的 Prometheus 指标，涵盖操作系统与 CPU 信息、内存、网络、负载均值、磁盘空间以及 FIPS 模式检测，便于在 Prometheus 中统一监控数据库主机。

## meta

`—-d–` | `0.4.0` | `18` `17` `16` | [`24🌟`](https://github.com/aquameta/meta)

提供更友好易用的系统目录，用约 30 个视图封装并整合 pg_catalog 与 information_schema，采用归一化的通用视图名和列名，避免开发者直接面对 oid 等内部结构；还提供按名称标识对象的复合类型与可选触发器。

## pgnodemx

`–sLd-r` | `2.0.1` | `18` `17` `16` | [`54🌟`](https://github.com/CrunchyData/pgnodemx)

通过 SQL 函数采集节点操作系统的运行指标，包括 /proc 下的 meminfo、loadavg、进程 IO 与磁盘统计，以及 cgroup v1/v2 和 Kubernetes DownwardAPI 数据。常用于在数据库内监控容器与主机资源使用情况。

## pg_proctab

`—-d-r` | `2.0.1` | `18` `17` `16` | [`54🌟`](https://github.com/CrunchyData/pgnodemx)

pgnodemx 附带的兼容扩展，以 0.0.10-compat 版本提供 pg_proctab、pg_cputime、pg_loadavg、pg_memusage、pg_diskusage 等函数，供 pg_top 等工具沿用原有接口读取系统与进程信息。

## pg_statvfs

`–s-d-r` | `1.0` | `18` `17` `16` | [`349🌟`](https://github.com/michaelpq/pg_plugins/tree/ae57c1f3df697fb942f4576f873a655187193ace/pg_statvfs)

对系统调用 statvfs 的 PostgreSQL 封装，用于查询数据库所用文件系统的状态数据，例如总容量、剩余空间等，方便直接在 SQL 中查看存储使用情况。

## pg_stat_tcpinfo

`–s-d-r` | `1.1` | `18` `17` `16` | [`0🌟`](https://github.com/jakubwartakEDB/pg_stat_tcpinfo)

仅支持 Linux 的扩展，把属于数据库服务进程 OS 用户的每个 TCP socket 细节以 jsonb 形式通过视图输出，包括 RTT、拥塞窗口、重传、队列与 socket 内存。可用于排查缓慢或停滞的客户端连接、复制链路以及 postgres_fdw、dblink 流量。

## pg_sqlog

`—-d–` | `1.7` | `18` `17` `16` | [`7🌟`](https://github.com/kouber/pg_sqlog)

通过 SQL 访问 PostgreSQL 日志的扩展，借助 file_fdw 把按天生成的 CSV 日志映射为外部表，并提供提取查询耗时、归并相似查询的函数，便于分析慢查询。

## bgw_replstatus

`–sL—` | `1.0.8` | `18` `17` `16` | [`34🌟`](https://github.com/mhagander/bgw_replstatus)

轻量级后台工作进程，用于低成本地报告节点当前的复制状态。它监听指定 TCP 端口，连接建立后立即返回 MASTER 或 STANDBY 并关闭连接，适合被 haproxy 等负载均衡器轮询，无需建立完整的 PostgreSQL 连接并登录查询。

## pgmeminfo

`–s-d–` | `1.0.1` | `18` `17` `16` | [`15🌟`](https://github.com/okbob/pgmeminfo)

提供名为 pgmeminfo 的函数，用于访问 PostgreSQL 的内存使用诊断信息。适合在排查内存占用异常时，直接在数据库中查看内存使用情况。

## toastinfo

`–s-d-r` | `1.7` | `18` `17` `16` | [`3🌟`](https://github.com/df7cb/toastinfo)

暴露 PostgreSQL 变长数据类型 varlena 的内部存储结构。pg_toastinfo 返回数据的存储形式，如短内联、长内联或存放在 TOAST 表中以及压缩方式；pg_toastpointer 返回该值在 TOAST 表中的 chunk_id，便于分析大字段的实际存储与压缩情况。

## explain_ui

`–s-d–` | `0.0.2` | `18` `17` `16` | [`5🌟`](https://github.com/davidgomes/pg-explain-ui)

一个基于 pgrx 构建的扩展，帮助用户为任意 SQL 查询快速跳转到可视化执行计划界面。它集成了 Dalibo 的 Explain UI 服务，该服务基于 Postgres Explain Visualizer 2（pev2）实现，便于直观查看查询计划。

## pg_relusage

`–sL–r` | `1.0.2` | `18` `17` `16` | [`22🌟`](https://github.com/adept/pg_relusage)

通过挂接查询执行器，发现并记录 SQL 语句实际使用的关系。相比只显示查询中显式引用对象的一般语句日志，它能考虑视图展开、连接消除和分区裁剪的结果，适合排查大型遗留数据库中哪些对象仍被客户端使用、哪些可以清理。

## pagevis

`—-d-r` | `0.1` | `18` `17` `16` | [`31🌟`](https://github.com/hollobon/pagevis)

借助 pageinspect 的 get_raw_page 函数，把数据库页面内容渲染成 ASCII 图形，每个字符对应页面上的一个字节，可直观看到页头、行指针与元组的排列。需超级用户调用，主要用于理解页面布局和教学调试。

## powa

`–sLd–` | `5.3.0` | `18` `17` `16` | [`75🌟`](https://github.com/powa-team/powa-archivist)

PoWA（PostgreSQL Workload Analyzer）项目的核心扩展，负责采集 PostgreSQL 的性能统计信息，配合前端界面提供实时图表，帮助监控和调优数据库服务器。

# SEC

## passwordcheck_cracklib

`–sL—` | `3.2.1` | `18` `17` `16` | [`4🌟`](https://github.com/devrimgunduz/passwordcheck_cracklib)

基于 cracklib 的口令强度检查模块，在通过 CREATE ROLE 或 ALTER ROLE 设置密码时进行校验，强度不足的密码会被拒绝并让命令报错终止。相比内置 passwordcheck，其检查更为严格。

## supautils

`–sL—` | `4.0.0` | `18` `17` `16` | [`94🌟`](https://github.com/supabase/supautils)

Supabase 开发的可加载库，让非超级用户也能安全地创建 event trigger、publication、extension 和外部数据包装器等高级对象，无需授予 SUPERUSER。全部通过 postgresql.conf 配置生效，不向数据库添加任何表或函数。

## pgsodium

`–sLd–` | `3.1.11` | `18` `17` `16` | [`619🌟`](https://github.com/michelp/pgsodium)

基于 libsodium 的加密扩展，提供服务器端根密钥管理，可按键 ID 派生密钥与密钥对，并支持透明列加密，自动加解密表中指定列。也可直接调用 libsodium 的哈希、签名和公钥加密接口。

## column_encrypt

`–sLd–` | `4.0` | `18` `17` `16` | [`22🌟`](https://github.com/vibhorkum/column_encrypt)

提供透明的列级加密，用户可用自己的密钥写入指定列，数据以密文形式存储。内置 encrypted_text 与 encrypted_bytea 两种加密类型，加解密在类型输入输出层自动完成，无需改写 SQL；采用 KEK/DEK 两层密钥模型，基于 pgcrypto 的 AES 加密，密文头部记录密钥版本以便轮换。

## encsearch

`–sLd–` | `0.1.1` | `17` | [`0🌟`](https://github.com/lokeshmulpuru/encsearch)

对文本做可搜索加密：用 AES-256-GCM 等 AEAD 加密原文，同时生成基于 HMAC-SHA256 的盲索引，存入带 GIN 索引的 int8[] 列。支持等值、分词、前缀、后缀和子串查询，无需解密整张表，适合加密存储下仍需快速检索的场景。

## passwordpolicy

`–sLd-r` | `2.0.6` | `18` `17` `16` | [`2🌟`](https://github.com/fmbiete/passwordpolicy)

类似 PostgreSQL 自带的 passwordcheck 模块，但密码复杂度要求可动态配置。在 CREATE ROLE 或 ALTER ROLE 设置密码时检查强度，过弱的密码会被拒绝并报错；还可与其他 passwordcheck 模块串联使用，需加入 shared_preload_libraries 生效。

## supabase_vault

`–s-d–` | `0.3.2` | `18` `17` `16` | [`238🌟`](https://github.com/supabase/vault)

在 Vault 中加密存储机密信息的扩展，提供 vault.secrets 表保存 API key 等敏感数据，落盘和数据库转储中均为密文。通过 vault.decrypted_secrets 视图解密读取，所用密钥不暴露给 SQL、只能按 ID 引用，适合集中保管各类凭据。

## pg_session_jwt

`–s-dt-` | `0.5.0` | `18` `17` `16` | [`71🌟`](https://github.com/neondatabase/pg_session_jwt)

通过 JWT 管理认证会话的扩展。配置 JWK 时会校验 JWT 真实性并将 JWT 存入数据库，提供函数读取用户 ID（sub）与载荷其他字段；未配置 JWK 时回退到 PostgREST 兼容的 request.jwt.claims 参数，便于在行级安全（RLS）策略中使用。

## anon

`–sLd–` | `3.3.2` | `18` `17` `16` | [`–`](https://gitlab.com/dalibo/postgresql_anonymizer/)

为 PostgreSQL 提供数据脱敏与匿名化能力，可对敏感数据做替换或伪装，常用于把生产数据安全地用于测试、开发或对外分享。

## pgsmcrypto

`–s-d–` | `0.1.1` | `18` `17` `16` | [`17🌟`](https://github.com/zhuobie/pgsmcrypto)

基于 Rust 和 pgrx 构建的国密算法扩展，提供 SM3 摘要、SM2 签名验签与加解密、SM4 对称加密等函数，可直接在数据库内完成国密合规的密码运算。

## pg_enigma

`–s-d–` | `0.5.0` | `18` `17` `16` | [`12🌟`](https://github.com/SoftwareLibreMx/pg_enigma)

提供加密的 PostgreSQL 数据类型，支持用 PGP 或 OpenSSL RSA 密钥对列数据加解密，私钥可从文件加载并在使用后清除。

## pgaudit

`–sLd-r` | `18.0` | `18` `17` `16` | [`1.7k🌟`](https://github.com/pgaudit/pgaudit)

通过 PostgreSQL 标准日志设施提供详细的会话级和对象级审计日志，用于满足政府、金融或 ISO 认证等合规审计要求。

## pgauditlogtofile

`–sLd-r` | `1.8.7` | `18` `17` `16` | [`24🌟`](https://github.com/fmbiete/pgauditlogtofile)

pgAudit 的配套插件，把审计日志重定向到独立文件而不是服务器日志，并支持按分钟自动轮转，便于单独归档和清理。

## pg_roast

`–sLd–` | `1.0` | `18` `17` `16` | [`40🌟`](https://github.com/samirketema/pg_roast)

在数据库内部对 PostgreSQL 进行全面审计并给出尖锐批评的扩展，检查范围涵盖表结构设计、命名反模式、缺失约束、安全配置错误、运维健康状况和查询行为，灵感来自《PostgreSQL Mistakes and How to Avoid Them》一书。它以单条 CREATE EXTENSION 安装、无需外部依赖，适合用来发现那些数月后才显现的潜在问题。

## pg_auditor

`—-d–` | `0.3` | `18` `17` `16` | [`9🌟`](https://github.com/kouber/pg_auditor)

记录指定表上每一条数据修改语句并支持事务回滚的 PostgreSQL 审计扩展。它把表纳入审计监控，记录 INSERT、UPDATE、DELETE 乃至 TRUNCATE 带来的数据变更，在完整记录三类修改后可整体回滚事务，将数据恢复到先前状态；行版本借助 hstore 扩展存储。

## logerrors

`–sLd-r` | `2.1.5` | `18` `17` `16` | [`37🌟`](https://github.com/munakoiso/logerrors)

用于收集 PostgreSQL 日志文件中各类消息统计信息的扩展。它按固定间隔把 warning、error、fatal 等类型的消息数量写入内存缓冲区并保留多个时间区间，可配置采集间隔、区间数量以及需要排除的错误码，之后通过 pg_log_errors_stats() 函数查询统计结果，需在 shared_preload_libraries 中预加载。

## pg_auth_mon

`–sLd-r` | `5.0` | `18` `17` `16` | [`29🌟`](https://github.com/RafiaSabih/pg_auth_mon)

用于监控数据库客户端认证尝试的 PostgreSQL 扩展。它把登录成功与失败的情况单独记录下来，便于判断某用户最后一次成功登录的时间、失败是输错密码还是账号已被攻破、以及恶意角色是否在特定时段活动，还可将统计内容定期写入 Postgres 日志。

## pg_jobmon

`—-d–` | `1.4.1` | `18` `17` `16` | [`202🌟`](https://github.com/omniti-labs/pg_jobmon)

为事务和函数提供持久化日志记录的 PostgreSQL 扩展。它通过 dblink 回连同一数据库，以非事务方式写入日志，因此当事务或函数失败甚至回滚时，此前已记录的信息仍会保留在日志表中，适合追踪长时间运行作业的执行过程。

## pg_oidc_validator

`–sL—` | `1.1.0` | `18` | [`42🌟`](https://github.com/percona/pg_oidc_validator)

为 PostgreSQL 18 提供 OAuth/OIDC 认证校验的库，支持大多数以 JWT 作为访问令牌的 OIDC 提供商。可在 pg_hba.conf 中启用 OAuth 认证，并通过 authn_field 指定用于身份映射的 JWT 字段。

## oidc_validator

`–sL—` | `0.1.0` | `18` | [`5🌟`](https://github.com/UnAfraid/pg_oidc_validator_rust)

用 Rust 编写的 PostgreSQL 18 OIDC 校验库，用于启用 OAuth bearer 认证机制。通过环境变量提供配置，需先启用扩展并调整 pg_hba.conf 中的认证方式。

## pgmemento

`—-d–` | `0.7.4` | `18` `17` `16` | [`416🌟`](https://github.com/pgMemento/pgMemento)

借助触发器和 PL/pgSQL 服务端函数为 PostgreSQL 数据库提供审计追踪，并记录 DDL 变更以实现 schema 版本管理。只记录变更增量并以 JSONB 存入数据日志表，还提供还原或修复历史版本的能力。

## credcheck

`–sLd–` | `6.0` | `18` `17` `16` | [`86🌟`](https://github.com/HexaCluster/credcheck)

在创建用户、修改密码和重命名用户时对凭据进行检查的扩展，可定义允许或禁止的凭据规则、拒绝易被破解的密码。还支持密码过期与复用策略、认证失败封禁、限制登录时段以及强制首次登录后改密。

## pgcryptokey

`–s-d-r` | `0.85` | `18` `17` `16` | [`–`](https://momjian.us/download/pgcryptokey/)

PostgreSQL 的加密密钥管理扩展，支持创建、选择、轮换和删除数据密钥。每个数据密钥都由一个访问密码加密包裹，使用时需提供正确的访问密码。

## pg_pwhash

`–s-d-r` | `1.0` | `18` `17` `16` | [`2🌟`](https://github.com/cybertec-postgresql/pg_pwhash)

提供基于自适应实现的密码哈希函数，支持 Argon2（argon2id、argon2i、argon2d）、scrypt 和 yescrypt 算法，并可选用 OpenSSL、libscrypt、crypt 后端。适合在数据库内生成和校验高强度密码哈希。

## login_hook

`–s-d–` | `1.9` | `18` `17` `16` | [`33🌟`](https://github.com/splendiddata/login_hook)

模拟 Oracle 的 logon 触发器，在用户登录数据库时自动执行指定代码，可用于登录审计和会话初始化。PostgreSQL 17 起建议改用原生 login 事件触发器。

## set_user

`–sLd–` | `4.3.0` | `18` `17` `16` | [`77🌟`](https://github.com/pgaudit/set_user)

允许会话在受控条件下切换用户角色并记录详细审计日志，可拦截 ALTER SYSTEM、COPY PROGRAM 和 log_statement 等操作，并通过 allowlist 管理可切换的超级用户。常用于需要受控提权的运维场景。

## pg_snakeoil

`–sLd-r` | `1.4` | `18` `17` `16` | [`25🌟`](https://github.com/credativ/pg_snakeoil)

基于 ClamAV 在 PostgreSQL 内部扫描数据是否含病毒，提供 so_is_infected 等 SQL 函数，可手动调用或通过触发器、检查约束自动执行。避免在服务器上运行常驻杀毒软件带来的性能与稳定性问题。

## pgextwlist

`–sL—` | `1.20` | `18` `17` `16` | [`103🌟`](https://github.com/dimitri/pgextwlist)

实现 PostgreSQL 扩展白名单，阻止用户安装名单之外的扩展，并以类似 sudo 的方式让白名单扩展以超级用户身份安装、随后立即降权。适合托管环境中限制普通用户可安装的扩展。

## pg_command_fw

`–sLd–` | `0.1.0` | `18` `17` `16` | [`1🌟`](https://github.com/rustwizard/pg_command_fw)

基于 pgrx 构建的命令防火墙，通过 ProcessUtility 钩子拦截 DDL 与 utility 语句，并拦截 pg_read_file 等危险内置函数，按类别用 GUC 开关决定放行还是阻止。适合在受控环境中限制高危操作。

## sslutils

`–s-d–` | `1.4.1` | `18` `17` `16` | [`13🌟`](https://github.com/EnterpriseDB/sslutils)

把 SSL 证书生成函数暴露给 PostgreSQL，用 SQL 即可完成证书相关操作，主要供 Postgres Enterprise Manager 服务端调用，无需再依赖数据库之外的工具。

## libx509pq

`–s-d-r` | `1.3` | `18` `17` `16` | [`56🌟`](https://github.com/crtsh/libx509pq)

将 OpenSSL 的 X.509 证书解析器封装为一组 SQL 函数，传入 DER 编码的证书 bytea 即可取回颁发者、主体、有效期、密钥、扩展和指纹等信息。crt.sh 的证书透明度日志检索正是以此作为解析引擎。

## noset

`–sLd–` | `0.3.0` | `18` `17` `16` | [`–`](https://gitlab.com/ongresinc/extensions/noset)

用于阻止特定用户修改一组用户上下文变量，避免普通用户擅自更改既定的配置项。适合在多用户环境下锁定关键参数。

## block_copy_command

`–sLd–` | `0.1.5` | `18` `17` `16` | [`3🌟`](https://github.com/rustwizard/block_copy_command)

借助 ProcessUtility 钩子在整个集群范围内拦截 COPY 命令，支持按角色黑名单、COPY TO/FROM PROGRAM 以及导入导出方向分别阻断，超级用户可绕过，其余 SQL 语句不受影响。

## pg_policy

`—-d–` | `0.1.0` | `18` `17` `16` | [`1🌟`](https://github.com/rahiakil/pg-policy)

在 PostgreSQL 内为 AI agent 提供策略层，用可读的 Agent Policy Language 定义 agent 可调用的工具、参数与会话预算，并与 RLS 互补：RLS 管行，它管 agent 的工具与软性引导。

## pg_kpart

`–sL–r` | `1.0` | `18` `17` `16` | [`5🌟`](https://github.com/hexacluster/pg_kpart)

拦截未使用分区键条件的查询，防止误扫全部分区。它通过 planner_hook 检查执行计划中的 Append 与 MergeAppend 节点，若分区裁剪后剩余分区数等于总分区数即报错。

## pg_agent_gate

`–sLd–` | `0.4.1` | `18` | [`2🌟`](https://github.com/Manuelreyesbravo/pg_agent_gate)

在 AI agent 与数据库之间加一道原生闸门。属于 agent 的会话中 SQL 不会直接执行，agent 只能提交一条语句，由 PostgreSQL 用服务端钩子自行校验并展示其确切影响，全部守卫通过后才保留。

## pg_tde

`–sLd–` | `2.2.2` | `18` | [`233🌟`](https://github.com/percona/pg_tde)

Percona 的透明数据加密扩展，在文件层面加密以保护静态数据，对用户查询透明。它提供 tde_heap 访问方法，加密元组、WAL 和索引，密钥可存放于 keyring 文件或通过全局密钥提供者接口对接外部 KMS。

## pg_vault_tde

`-bsLd–` | `1.7.2` | `18` `17` | [`15🌟`](https://github.com/labmiriade/pg_vault_tde)

面向 PostgreSQL 17 及以上版本的透明数据加密方案，无需修改内核。它在表访问方法层用 AES-256-GCM 加密每个元组，密钥由 HashiCorp Vault、OpenBao 或本地 PKCS#12 钱包管理并缓存在共享内存中，支持自动轮换。

# FDW

## wrappers

`–s-d-r` | `0.6.4` | `18` `17` `16` | [`899🌟`](https://github.com/supabase/wrappers)

用 Rust 编写的 PostgreSQL 外部数据包装器（FDW）开发框架，同时也是 Supabase 构建的一组 FDW 集合。它支持 RDBMS、REST API、平面文件等同步与异步后端，并支持 WHERE、ORDER BY、LIMIT 下推。

## multicorn

`–s-d-r` | `3.2` | `18` `17` `16` | [`–`](https://github.com/pgsql-io/multicorn2)

Multicorn2 项目提供的 PostgreSQL 外部数据包装器框架，用于以 Python 等脚本语言实现自定义 FDW。适合把非标准数据源接入 PostgreSQL 查询。

## odbc_fdw

`–s-d-r` | `0.5.2` | `18` `17` `16` | [`1🌟`](https://github.com/devrimgunduz/odbc_fdw)

通过 ODBC 访问远程数据库的 PostgreSQL 外部数据包装器。可在 CREATE SERVER、CREATE FOREIGN TABLE 和 IMPORT FOREIGN SCHEMA 的 OPTION 子句中配置 ODBC 连接属性，需预先安装对应数据源的 ODBC 驱动。

## jdbc_fdw

`–s-d-r` | `1.2` | `18` `17` `16` | [`79🌟`](https://github.com/pgspider/jdbc_fdw)

连接任意 JDBC 数据源的 PostgreSQL 外部数据包装器。它支持对外部表执行 INSERT、UPDATE、DELETE，可通过函数执行整条 SQL 查询并返回记录集，还支持 WHERE 子句下推。

## pgspider_ext

`–s-d-r` | `1.3.0` | `18` `17` `16` | [`28🌟`](https://github.com/pgspider/pgspider_ext)

用于构建高性能 SQL 集群引擎的扩展，借助 FDW 访问多种数据源并纵向整合分布式数据。它基于声明式分区实现节点分区表，可把多个数据源中结构相似的表当作单个虚拟表查询。

## mysql_fdw

`–s-d-r` | `2.9.3` | `18` `17` `16` | [`600🌟`](https://github.com/EnterpriseDB/mysql_fdw)

让 PostgreSQL 通过外部表访问 MySQL 数据库。支持 INSERT、UPDATE、DELETE 写操作，并在同一会话内复用连接以减少开销。

## oracle_fdw

`–s-d-r` | `2.9.0` | `18` `17` `16` | [`554🌟`](https://github.com/laurenz/oracle_fdw)

提供对 Oracle 数据库高效便捷的访问，可下推 WHERE 条件和所需列，并给出完整的 EXPLAIN 支持，便于把 Oracle 数据整合进 PostgreSQL 查询。

## tds_fdw

`–s-d-r` | `2.0.5` | `18` `17` `16` | [`437🌟`](https://github.com/tds-fdw/tds_fdw)

通过 TDS 协议连接 Sybase 和 Microsoft SQL Server 的外部数据包装器，依赖 FreeTDS 等 DB-Library 实现。当前不支持 JOIN 下推和写操作，开启 match_column_names 时可下推 WHERE 条件和列。

## db2_fdw

`–s-d-r` | `18.2.0` | `18` `17` `16` | [`32🌟`](https://github.com/pg-fdw/db2_fdw)

提供对 DB2 数据库高效便捷的访问，支持下推 WHERE 条件与所需列，并提供完整的 EXPLAIN 支持，方便在 PostgreSQL 中直接查询 DB2 数据。

## sqlite_fdw

`–s-d-r` | `2.5.0` | `18` `17` `16` | [`265🌟`](https://github.com/pgspider/sqlite_fdw)

让 PostgreSQL 连接 SQLite 数据库文件，支持事务以及 INSERT、UPDATE、DELETE 和 TRUNCATE 操作。配合 PostGIS 还可访问 SpatiaLite 空间数据库文件。

## pgbouncer_fdw

`—-d–` | `1.4.0` | `18` `17` `16` | [`36🌟`](https://github.com/CrunchyData/pgbouncer_fdw)

将 PgBouncer 的 SHOW 命令封装成 SQL 外部表，借助 dblink_fdw 把连接池服务器的运行状态以表的形式暴露出来，便于搭建监控或让其他服务直接查询其统计信息。

## etcd_fdw

`–s-d–` | `0.0.1` | `18` `17` `16` | [`4🌟`](https://github.com/cybertec-postgresql/etcd_fdw)

为 PostgreSQL 提供访问 etcd 的外部数据包装器，可以把 etcd 中的键值对作为外部表读取，方便在数据库里直接查询服务发现与配置数据。当前版本只支持读取操作。

## informix_fdw

`–s-d-r` | `0.6.3` | `18` `17` `16` | [`27🌟`](https://github.com/credativ/informix_fdw)

用于在 PostgreSQL 中访问远程 Informix 表的外部数据包装器，外部表可像普通表一样与本地表关联查询或导入数据，并支持修改远程数据，需要 IBM ESQL/C Client SDK。

## nominatim_fdw

`–s-d-r` | `2.3` | `18` `17` `16` | [`1🌟`](https://github.com/jimjonesbr/nominatim_fdw)

通过函数调用访问 Nominatim 地理编码服务器，提供正向搜索、反向解析和批量查询能力，可在 PostgreSQL 中采集并解析地址数据，依赖 libxml2 与 libcurl。

## mongo_fdw

`–s-d-r` | `5.5.3` | `18` `17` `16` | [`343🌟`](https://github.com/EnterpriseDB/mongo_fdw)

为 PostgreSQL 提供访问 MongoDB 的外部数据包装器，支持对集合执行 INSERT、UPDATE、DELETE，具备会话级连接池并将 WHERE 条件下推到远端，用于直接查询和修改 MongoDB 数据。

## redis_fdw

`–s-d-r` | `2.0` | `18` `17` `16` | [`534🌟`](https://github.com/pg-redis-fdw/redis_fdw)

连接 PostgreSQL 与 Redis 键值数据库的 foreign data wrapper，可在 SQL 中对 Redis 数据执行 SELECT 以及 INSERT、UPDATE、DELETE，把 key/value 数据当作外部表读写。适用于 Redis 6.0 及以上版本，也兼容 Valkey。

## redis

`–s-d-r` | `0.0.1` | `18` `17` `16` | [`32🌟`](https://github.com/brettlaforge/pg_redis_pubsub)

让 PostgreSQL 连接到 Redis 并向指定频道发布消息，底层依赖 HIREDIS C 客户端。常用于把数据库中的业务事件或变更实时推送给 Redis 订阅方。

## kafka_fdw

`–s-d-r` | `0.0.3` | `18` `17` `16` | [`111🌟`](https://github.com/adjust/kafka_fdw)

把 Kafka 中的消息当作 PostgreSQL 外部表来查询的 foreign data wrapper，基于 librdkafka，支持 csv 和 json 两种消息格式，建表时需指定 broker 列表以及分区、偏移量元列。项目自述尚未达到生产就绪状态，使用需谨慎。

## hdfs_fdw

`–s-d-r` | `2.0.5` | `18` `17` `16` | [`141🌟`](https://github.com/EnterpriseDB/hdfs_fdw)

访问 Hadoop HDFS 的 foreign data wrapper，使 PostgreSQL 和 EDB Postgres Advanced Server 能够查询存放在 HDFS 上的分布式数据，支持 PostgreSQL 14 至 19。由 EnterpriseDB 维护。

## firebird_fdw

`–s-d-r` | `1.4.2` | `18` `17` `16` | [`43🌟`](https://github.com/ibarwick/firebird_fdw)

连接 PostgreSQL 与 Firebird 的 foreign data wrapper，提供 SELECT 读取以及 INSERT、UPDATE、DELETE 写入，并支持部分操作下推，兼容 Firebird 2.5 及以后版本。作者提示仍处于开发阶段，使用需自行承担风险。

## rdf_fdw

`–s-d–` | `3.1` | `18` `17` `16` | [`39🌟`](https://github.com/jimjonesbr/rdf_fdw)

通过 SPARQL 端点访问 RDF 三元组存储的 PostgreSQL FDW。可用 SQL 查询 RDF 数据，并支持下推 WHERE、LIMIT、ORDER BY、DISTINCT 以及 INSERT/UPDATE/DELETE 等修改操作。

## oai_fdw

`–s-d-r` | `1.16` | `18` `17` `16` | [`4🌟`](https://github.com/jimjonesbr/oai_fdw)

用于访问支持 OAI-PMH 2.0 协议的数字仓储的 PostgreSQL FDW。可在库内导入并查询元数据记录，支持 IMPORT FOREIGN SCHEMA 与采集整表，常用于图书馆和学术元数据整合。

## aws_s3

`—-d-r` | `0.0.1` | `18` `17` `16` | [`178🌟`](https://github.com/chimpler/postgres-aws-s3)

在 PostgreSQL 与 S3 之间导入导出数据的扩展，兼容 AWS RDS 上的同名 aws_s3。基于 Python boto3 实现，提供 table_import_from_s3 和 query_export_to_s3 函数，便于本地开发对齐 RDS 行为。

## log_fdw

`–s-d-r` | `1.5` | `18` `17` `16` | [`26🌟`](https://github.com/aws/postgresql-logfdw)

把 PostgreSQL 日志文件包装成外部表的 FDW，从而用 SQL 直接读取和分析日志内容。可列出日志目录中的文件及大小，仅允许超级用户创建和使用该扩展。

# SIM

## documentdb

`–sLd–` | `1.0` | `18` `17` `16` | [`3.6k🌟`](https://github.com/documentdb/documentdb)

构建在 PostgreSQL 之上的 MongoDB 兼容开源文档数据库。原生支持 BSON 数据类型和 CRUD 操作，并可执行全文检索、地理空间查询与向量搜索，适合云原生文档负载。

## documentdb_core

`–sLd–` | `1.0` | `18` `17` `16` | [`3.6k🌟`](https://github.com/documentdb/documentdb)

为 PostgreSQL 引入 BSON 数据类型及其运算，是 DocumentDB 的底层组件，用于在 Postgres 中原生存储和操作 MongoDB 风格的文档数据。

## documentdb_extended_rum

`–sLd-r` | `1.0` | `18` `17` `16` | [`3.6k🌟`](https://github.com/documentdb/documentdb)

属于 DocumentDB 项目的组件，与 pg_documentdb_core 等配合，支撑基于 PostgreSQL 的 MongoDB 兼容文档数据库的文档存储与查询能力。

## pg_projection

`—-d-r` | `1.0.0` | `18` `17` `16` | [`0🌟`](https://github.com/suissa/pg_projection)

为 JSONB 提供 MongoDB 风格的字段投影，用 1 表示包含、0 表示排除，可替代繁琐的 jsonb_build_object 拼接，也能把整个查询结果投影为对象数组。

## orafce

`–s-d–` | `4.17.1` | `18` `17` `16` | [`551🌟`](https://github.com/orafce/orafce)

在 PostgreSQL 中实现 Oracle 数据库的部分函数和包，兼容 Oracle 的日期函数与格式串，主要用于把 Oracle 应用迁移到 PostgreSQL 或补齐常用工具函数。

## pgtt

`–sLd–` | `4.6` | `18` `17` `16` | [`100🌟`](https://github.com/darold/pgtt)

提供 Oracle 风格的全局临时表，用普通 unlogged 表作为模板并在内部重定向到临时表，便于从 Oracle 迁移应用时无需改写代码。

## session_variable

`–s-d–` | `3.6` | `18` `17` `16` | [`13🌟`](https://github.com/splendiddata/session_variable)

提供会话级变量和常量的创建与维护功能，效果类似 Oracle 的全局变量。变量在数据库级定义，每个会话首次调用时得到自己的本地副本，set 只修改本会话的值，常用于兼容 Oracle 的迁移场景。

## pg_statement_rollback

`–sL—` | `1.6` | `18` `17` `16` | [`57🌟`](https://github.com/HexaCluster/pg_statement_rollback)

为 PostgreSQL 增加类似 Oracle、DB2 的服务端语句级回滚能力。某条 SQL 执行出错时只撤销该语句自身的影响，事务中此前完成的工作不会丢失，事务仍可继续，适合从 Oracle 迁移的应用。

## ivorysql_ora

`–s-d–` | `1.0` | `18` | [`1.1k🌟`](https://github.com/IvorySQL/IvorySQL/tree/master/contrib/ivorysql_ora)

IvorySQL 提供的 Oracle 兼容 contrib 扩展。IvorySQL 是基于 PostgreSQL 的开源 Oracle 兼容数据库，可通过 compatible_mode 参数在 Oracle 与 PostgreSQL 兼容模式之间切换，并提供支持 PL/SQL 语法的 PL/iSQL 过程语言。

## ora_btree_gin

`–s-dt-` | `1.0` | `18` | [`1.1k🌟`](https://github.com/IvorySQL/IvorySQL/tree/master/contrib/ora_btree_gin)

IvorySQL 项目的 contrib 扩展，对应 btree_gin。用于在 Oracle 兼容模式下为常见数据类型提供 GIN 索引所需的 btree 操作符类，便于沿用 btree_gin 的索引方案。

## ora_btree_gist

`–s-dt-` | `1.0` | `18` | [`1.1k🌟`](https://github.com/IvorySQL/IvorySQL/tree/master/contrib/ora_btree_gist)

IvorySQL 项目的 contrib 扩展，对应 btree_gist。用于在 Oracle 兼容模式下为常见数据类型提供 GiST 索引所需的 btree 操作符类，支持等值查询与排除约束等用法。

## pg_get_functiondef

`–s-dt-` | `1.0` | `18` | [`1.1k🌟`](https://github.com/IvorySQL/IvorySQL/tree/master/contrib/pg_get_functiondef)

IvorySQL（兼容 Oracle 的 PostgreSQL 分支）附带的 contrib 扩展，用于获取函数的定义文本，方便查看或导出存储过程的源码。

## plisql

`–s-dt-` | `1.0` | `18` | [`1.1k🌟`](https://github.com/IvorySQL/IvorySQL/tree/master/src/pl/plisql)

IvorySQL 提供的 PL/iSQL 过程语言，支持 Oracle 的 PL/SQL 语法和 Oracle 风格 Package，便于把 Oracle 存储过程迁移到 PostgreSQL。

## gb18030_2022

`–s-dt-` | `1.0` | `18` | [`1.1k🌟`](https://github.com/IvorySQL/IvorySQL/tree/master/contrib/gb18030_2022)

IvorySQL 附带的 contrib 扩展，面向 GB18030-2022 中文编码标准，用于在数据库中处理采用该字符集编码的数据。

## db2fce

`—-d–` | `0.0.17` | `18` `17` `16` | [`6🌟`](https://github.com/credativ/db2fce)

为 PostgreSQL 提供 DB2 兼容环境，把 DB2 的函数、类型和运算符集中创建在 db2 schema 中，并提供 SYSIBM.SYSDUMMY1 视图，使部分 DB2 SQL 语句无需修改即可执行。

## plpgsql_wrap

`–s-d–` | `1.0` | `18` `17` `16` | [`11🌟`](https://github.com/hexacluster/plpgsql_wrap/)

Oracle WRAP 的 PostgreSQL 等价实现，用 LANGUAGE plpgsql_wrap 编写的存储过程会先校验源码，再用 AES-256-GCM 加密写入 pg_proc.prosrc，使他人无法查看明文源码，pg_dump 导出同样不会泄露。

## pg_synonym

`–s-d–` | `1.0` | `18` `17` `16` | [`2🌟`](https://github.com/Mazuco/pg_synonym)

为 PostgreSQL 提供类似 Oracle、SQL Server 的同义词功能，可为表或视图在另一个 schema 下建立别名。别名由可更新视图实现，并能随目标表的 ALTER TABLE 自动同步，适合迁移旧应用时隐藏表的真实位置和名称。

## pg_dbms_metadata

`—-d–` | `1.0.0` | `18` `17` `16` | [`13🌟`](https://github.com/HexaCluster/pg_dbms_metadata)

以兼容 Oracle DBMS_METADATA 包的方式提取数据库对象的 DDL。提供 GET_DDL 等函数，可直接在普通 SQL 查询或 PL/pgSQL 中生成对象定义语句，便于批量导出和迁移。

## pg_dbms_lock

`—-d–` | `2.0` | `18` `17` `16` | [`6🌟`](https://github.com/HexaCluster/pg_dbms_lock)

基于 PostgreSQL advisory lock 模拟 Oracle DBMS_LOCK 包，提供 ALLOCATE_UNIQUE、REQUEST、RELEASE、SLEEP 等存储过程。可按独占或共享模式加锁并设置超时，用于协调并行程序或控制对共享资源的独占访问。

## pg_dbms_job

`–sLd–` | `2.0` | `18` `17` `16` | [`43🌟`](https://github.com/HexaCluster/pg_dbms_job)

提供与 Oracle DBMS_JOB 兼容的作业调度功能，可在作业队列中提交和管理定时任务。支持 SUBMIT、CHANGE、RUN、REMOVE 等过程，作业可执行 SQL 命令、PL/pgSQL 代码或已有存储过程，也可立即异步执行。

## pg_dbms_errlog

`–sLd–` | `2.4` | `18` `17` `16` | [`17🌟`](https://github.com/HexaCluster/pg_dbms_errlog)

模拟 Oracle DBMS_ERRLOG 的 DML 错误日志功能，通过错误记录表让批量 DML 在遇到错误后继续执行而不是整体回滚。错误先进入动态共享内存队列，再由后台工作进程写入日志表，通常需配合 SAVEPOINT 或 pg_statement_rollback 使用。

## pg_utl_smtp

`—-d–` | `2.0.0` | `18` `17` `16` | [`6🌟`](https://github.com/hexacluster/pg_utl_smtp)

为 PostgreSQL 提供 Oracle UTL_SMTP 包的兼容接口，基于 plperlu 存储过程和 Perl 的 Net::SMTP 模块实现。可在数据库中打开 SMTP 连接、完成 EHLO/HELO 握手、指定收件人与发件人并写入邮件内容，从而直接在 SQL 中发送邮件。

## babelfishpg_common

`–s-d-r` | `6.2.0` | `18` `17` | [`–`](https://babelfishpg.org/)

Babelfish for PostgreSQL 的公共基础组件，为 T-SQL 兼容层和 TDS 协议端点提供共享的类型、函数与工具支持。它是 Babelfish 各组件协同工作的底层依赖，通常在部署 Babelfish 时随其他组件一同安装。

## babelfishpg_tsql

`–s-d-r` | `6.2.0` | `18` `17` | [`–`](https://babelfishpg.org/)

Babelfish for PostgreSQL 的 T-SQL 兼容层组件，让 PostgreSQL 能够理解并执行 Microsoft SQL Server 的 T-SQL 方言。主要用于把原本运行在 SQL Server 上的应用迁移到 PostgreSQL，减少查询改写和驱动更换的工作量。

## babelfishpg_tds

`–sLd-r` | `1.0.0` | `18` `17` | [`–`](https://babelfishpg.org/)

Babelfish for PostgreSQL 的网络协议组件，负责在 PostgreSQL 上实现 SQL Server 的 TDS 线协议端点和常用命令。借助它，原本连接 SQL Server 的客户端与驱动可以直接连到 PostgreSQL，无需修改连接方式。

## babelfishpg_money

`–s-d–` | `1.1.0` | `18` `17` | [`–`](https://babelfishpg.org/)

Babelfish for PostgreSQL 的货币数据类型组件，提供与 SQL Server 兼容的 money 类型及运算支持。用于在迁移 SQL Server 应用时保持金额字段的定义、精度和计算结果一致，避免改写相关表结构与查询。

## pgmemcache

`–s-d-r` | `2.3.0` | `18` `17` `16` | [`175🌟`](https://github.com/ohmu/pgmemcache)

提供一组 PostgreSQL 用户自定义函数，用于在 SQL 中直接访问 memcached。它基于 libmemcached（也可选用 OMcache），默认使用 memcache 二进制协议，方便在数据库里读写和增减缓存数据。

## pgs3

`–sLd–` | `0.1.1` | `18` `17` | [`24🌟`](https://github.com/pgsty/pgs3)

在 PostgreSQL 内部实现 S3 兼容的对象存储，把一个数据库变成 path-style 的 S3 端点。后台 worker 认证 HTTP 请求并转换为基于 SQL 的对象操作，适合在数据库已是系统记录时存放带版本、按租户隔离的 agent 产物，可用 AWS CLI、boto3、rclone 等客户端访问。

## kafgres

`–sLd–` | `0.3.2` | `16` | [`431🌟`](https://github.com/RayElg/kafgres)

在 PostgreSQL 中内嵌一个 Kafka broker，让未修改的 Kafka 客户端连接 9092 端口即可收发消息，topic、partition、offset、consumer group 与日志都存放在数据库里。目标是让数据库写入与事件流事务性耦合，避免 outbox 表和双写不一致。

# ETL

## pglogical

`-bsLd–` | `2.4.8` | `18` `17` `16` | [`1.2k🌟`](https://github.com/2ndQuadrant/pglogical)

基于发布/订阅模型的 PostgreSQL 逻辑流式复制扩展，源自 BDR 项目的技术。它以节点、提供者和订阅者、复制集组织数据流，可用于跨大版本升级和多节点数据分发，速度比 Slony、Bucardo 等方案更快。

## pglogical_origin

`–s-d–` | `1.0.0` | `18` `17` `16` | [`1.2k🌟`](https://github.com/2ndQuadrant/pglogical)

pglogical 逻辑复制套件附带的辅助扩展，为复制来源（replication origin）过滤提供支持，避免多节点订阅时数据被重复回放。它通常随 pglogical 一同安装并作为其依赖，不单独面向业务使用。

## pglogical_ticker

`–sLd–` | `1.4.1` | `18` `17` `16` | [`3🌟`](https://github.com/enova/pglogical_ticker)

借助 PostgreSQL 后台工作进程定期向参与复制的表写入数据，用于测量 pglogical provider 侧的复制延迟时间。

## pgl_ddl_deploy

`–s-d–` | `2.2.1` | `18` `17` `16` | [`99🌟`](https://github.com/enova/pgl_ddl_deploy)

为 PostgreSQL 提供透明的 DDL 复制，同时支持 pglogical 和原生逻辑复制，把主库上的 DDL 变更自动传送到订阅端，省去手工同步表结构的操作。

## logical_ddl

`–s-d–` | `0.1.0` | `18` `17` `16` | [`11🌟`](https://github.com/samedyildirim/logical_ddl)

基于 PostgreSQL 内置逻辑复制实现 DDL 复制，利用事件触发器捕获表上的 DDL 操作并记录到会被复制的表中，订阅端再生成并执行对应 SQL，减少手工操作和表定义不一致导致复制中断的风险。

## pg_failover_slots

`–sL–r` | `1.2.1` | `18` `17` `16` | [`109🌟`](https://github.com/EnterpriseDB/pg_failover_slots)

让逻辑复制槽可跨物理故障转移继续使用，把主库的槽复制到备库并定期同步位置，避免主库提升后订阅端丢失变更而出现数据缺口。

## db_migrator

`—-d-r` | `1.0.0` | `18` `17` `16` | [`28🌟`](https://github.com/cybertec-postgresql/db_migrator)

提供将其他数据库迁移到 PostgreSQL 的函数框架，需配合对应数据源的外部数据包装器和专用插件，目前支持 Oracle、MySQL/MariaDB 和 Microsoft SQL Server。

## pgactive

`-bsLd–` | `2.1.9` | `18` `17` `16` | [`1.1k🌟`](https://github.com/aws/pgactive)

由 AWS 开发的 PostgreSQL 复制扩展，用于构建 active-active 数据库集群，允许同一集群的多个实例同时接受写入。基于异步复制实现，适用于提升可用性、降低访问延迟等场景。

## spock

`-bsLd–` | `5.0.13` | `18` `17` `16` | [`768🌟`](https://github.com/pgEdge/spock)

PostgreSQL 多主逻辑复制扩展，支持在多个节点同时写入并处理冲突，提供数据过滤、DDL 复制、批量插入和集群监控等管理能力。适合构建多活集群和分布式数据库部署。

## lolor

`–s-dt-` | `1.2.3` | `18` `17` `16` | [`51🌟`](https://github.com/pgEdge/lolor)

让 PostgreSQL 的大对象（Large Object）兼容逻辑复制。它把大对象按分片存入 lolor schema 下的普通表并生成独立 OID，避开系统目录表难以复制的限制，通常与逻辑复制方案配合使用。

## pgclone

`–sLd–` | `4.4.2` | `18` `17` `16` | [`45🌟`](https://github.com/valehdba/pgclone)

在 PostgreSQL 实例之间直接通过 SQL 克隆数据库、schema、表和函数，无需 pg_dump、pg_restore 或 shell 脚本。还支持从 Oracle、SQL Server、MySQL 拉取表数据，并提供数据脱敏与克隆后校验。

## pgmqtt

`–sLd–` | `0.5.1` | `18` `17` `16` | [`12🌟`](https://github.com/RayElg/pgmqtt)

基于 pgrx 构建的 PostgreSQL 扩展，内嵌由变更数据捕获驱动的 MQTT broker，把表的 INSERT、UPDATE、DELETE 变更自动转为 MQTT 消息推送。也支持 MQTT 客户端发布消息写入表中。

## wal2json

`–s—-` | `2.7` | `18` `17` `16` | [`1.5k🌟`](https://github.com/eulerto/wal2json)

PostgreSQL 逻辑解码的 JSON 输出插件，可读取 WAL 中 INSERT、UPDATE、DELETE 产生的新旧元组。format version 1 按事务输出一个 JSON 对象，version 2 按元组输出，可通过逻辑复制槽或专用 SQL 接口消费变更，常用于变更数据捕获与 ETL。

## wal2mongo

`–s—-` | `1.0.7` | `18` `17` `16` | [`18🌟`](https://github.com/HighgoSoftware/wal2mongo)

PostgreSQL 逻辑解码输出插件，把解码得到的变更格式化成 mongo 可接受的类 JSON 结构，用于简化从 PostgreSQL 到 MongoDB 的逻辑复制。

## decoderbufs

`–sL—` | `3.7.0` | `18` `17` `16` | [`260🌟`](https://github.com/debezium/postgres-decoderbufs)

PostgreSQL 逻辑解码输出插件，将变更数据以 Protocol Buffers 格式输出，由 Debezium 采集使用。编译依赖 protobuf-c，并借助 PostGIS 支持几何类型。

## decoder_raw

`–s—-` | `1.0` | `18` `17` `16` | [`349🌟`](https://github.com/michaelpq/pg_plugins/blob/main/decoder_raw/)

PostgreSQL 逻辑复制输出插件，根据解码到的变更生成原始 SQL 语句，供任意远端直接消费。UPDATE 和 DELETE 的 WHERE 条件依据 REPLICA IDENTITY 构造，只有 FULL、可用的 DEFAULT 索引或 USING INDEX 等能保证行唯一性的设置才会生成。

## mimeo

`-b–d–` | `1.5.1` | `18` `17` `16` | [`79🌟`](https://github.com/omniti-labs/mimeo)

在 PostgreSQL 实例之间做按表定制的复制。支持整表快照复制、基于递增时间戳或 id 的增量复制，以及捕获 INSERT、UPDATE、DELETE 的 DML 复制，依赖 dblink 扩展。

## repmgr

`-bsLd–` | `5.5.1` | `18` `17` `16` | [`1.7k🌟`](https://github.com/EnterpriseDB/repmgr)

一套管理 PostgreSQL 服务器集群复制与故障转移的开源工具，可搭建备库、监控复制状态，并执行 failover、switchover 等运维操作。适合构建高可用 PostgreSQL 集群。

## pg_fact_loader

`—-d–` | `2.0.1` | `18` `17` `16` | [`–`](https://sources.debian.org/src/pg-fact-loader/2.0.1-5/)

PostgreSQL 的 ETL 扩展，用于加载数据仓库中的事实表（fact table）。适合按批次向事实表导入数据的场景。

## pg_bulkload

`-bs-d–` | `3.1.23` | `18` `17` `16` | [`497🌟`](https://github.com/ossc-db/pg_bulkload)

面向 PostgreSQL 的高速数据加载工具，可绕过共享缓冲区向表中写入海量数据，并提供输入数据校验与转换等 ETL 功能。适合大规模数据导入场景。
