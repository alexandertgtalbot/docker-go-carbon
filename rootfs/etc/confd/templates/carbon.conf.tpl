[common]
user                        = "{{ getv "/go-carbon/common/user" "carbon" }}"
graph-prefix                = "{{ getv "/go-carbon/common/graph-prefix" "carbon.agents.{host}" }}"
metric-endpoint             = "{{ getv "/go-carbon/common/metric-endpoint" "tcp://localhost:2003" }}"
max-cpu                     =  {{ getv "/go-carbon/common/max-cpu" "1" }}
metric-interval             = "{{ getv "/go-carbon/common/metric-interval" "1m0s" }}"

[whisper]
enabled                     =  {{ getv "/go-carbon/whisper/enabled" "true" }}
data-dir                    = "{{ getv "/go-carbon/whisper/data-dir" "/data/whisper/" }}"
schemas-file                = "{{ getv "/go-carbon/whisper/schemas-file" "/etc/go-carbon/storage-schemas.conf" }}"
aggregation-file            = "{{ getv "/go-carbon/whisper/aggregation-file" "/etc/go-carbon/storage-aggregation.conf" }}"
workers                     =  {{ getv "/go-carbon/whisper/workers" "2" }}
max-updates-per-second      =  {{ getv "/go-carbon/whisper/max-updates-per-second" "10000" }}
sparse-create               =  {{ getv "/go-carbon/whisper/sparse-create" "false" }}

[cache]
max-size                    =  {{ getv "/go-carbon/cache/max-size" "100000" }}
write-strategy              = "{{ getv "/go-carbon/cache/write-strategy" "noop" }}"

[udp]
enabled                     =  {{ getv "/go-carbon/udp/enabled" "true" }}
listen                      = "{{ getv "/go-carbon/udp/listen" ":2003" }}"
log-incomplete              =  {{ getv "/go-carbon/udp/log-incomplete" "false" }}
buffer-size                 =  {{ getv "/go-carbon/udp/buffer-size" "2000" }}

[tcp]
enabled                     =  {{ getv "/go-carbon/tcp/enabled" "true" }}
listen                      = "{{ getv "/go-carbon/tcp/listen" ":2003" }}"
buffer-size                 =  {{ getv "/go-carbon/tcp/buffer-size" "2000" }}

[pickle]
enabled                     =  {{ getv "/go-carbon/pickle/enabled" "true" }}
listen                      = "{{ getv "/go-carbon/pickle/listen" ":2004" }}"
max-message-size            =  {{ getv "/go-carbon/pickle/max-message-size" "67108864" }}
buffer-size                 =  {{ getv "/go-carbon/pickle/buffer-size" "2000" }}

[carbonlink]
enabled                     =  {{ getv "/go-carbon/carbonlink/enabled" "true" }}
listen                      = "{{ getv "/go-carbon/carbonlink/listen" ":7002" }}"
read-timeout                = "{{ getv "/go-carbon/carbonlink/read-timeout" "30s" }}"
query-timeout               = "{{ getv "/go-carbon/carbonlink/query-timeout" "100ms" }}"

[grpc]
enabled                     =  {{ getv "/go-carbon/grpc/enabled" "true" }}
listen                      = "{{ getv "/go-carbon/grpc/listen" ":7003" }}"

[carbonserver]
enabled                     =  {{ getv "/go-carbon/carbonserver/enabled" "true" }}
listen                      = "{{ getv "/go-carbon/carbonserver/listen" ":8080" }}"
query-cache-enabled         =  {{ getv "/go-carbon/carbonserver/query-cache-enabled" "true" }}
query-cache-size-mb         =  {{ getv "/go-carbon/carbonserver/query-cache-size-mb" "0" }}
find-cache-enabled          =  {{ getv "/go-carbon/carbonserver/find-cache-enabled" "true" }}
buckets                     =  {{ getv "/go-carbon/carbonserver/buckets" "10" }}
max-globs                   =  {{ getv "/go-carbon/carbonserver/max-globs" "100" }}
fail-on-max-globs           =  {{ getv "/go-carbon/carbonserver/fail-on-max-globs" "false" }}
metrics-as-counters         =  {{ getv "/go-carbon/carbonserver/metrics-as-counters" "false" }}
trigram-index               =  {{ getv "/go-carbon/carbonserver/trigram-index" "true" }}
graphite-web-10-strict-mode =  {{ getv "/go-carbon/carbonserver/graphite-web-10-strict-mode" "true" }}
internal-stats-dir          = "{{ getv "/go-carbon/carbonserver/internal-stats-dir" "" }}"
read-timeout                = "{{ getv "/go-carbon/carbonserver/read-timeout" "1m0s" }}"
idle-timeout                = "{{ getv "/go-carbon/carbonserver/idle-timeout" "1m0s" }}"
write-timeout               = "{{ getv "/go-carbon/carbonserver/write-timeout" "1m0s" }}"
scan-frequency              = "{{ getv "/go-carbon/carbonserver/scan-frequency" "5m0s" }}"

[dump]
enabled                     =  {{ getv "/go-carbon/dump/enabled" "false" }}
path                        = "{{ getv "/go-carbon/dump/path" "/data/graphite/dump/" }}"
restore-per-second          =  {{ getv "/go-carbon/dump/restore-per-second" "0" }}

[pprof]
enabled                     =  {{ getv "/go-carbon/pprof/enabled" "false" }}
listen                      = "{{ getv "/go-carbon/pprof/listen" ":7007" }}"

[[logging]]
logger                      = "{{ getv "/go-carbon/logging/logger" "" }}"
file                        = "{{ getv "/go-carbon/logging/file" "stdout" }}"
level                       = "{{ getv "/go-carbon/logging/level" "info" }}"
encoding                    = "{{ getv "/go-carbon/logging/encoding" "mixed" }}"
encoding-time               = "{{ getv "/go-carbon/logging/encoding-time" "iso8601" }}"
encoding-duration           = "{{ getv "/go-carbon/logging/encoding-duration" "seconds" }}"
