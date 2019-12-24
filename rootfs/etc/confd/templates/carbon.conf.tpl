[common]
user = "carbon"
graph-prefix = "carbon.agents.{host}"
metric-endpoint = "tcp://localhost:2003"
max-cpu = {{getv "/go-carbon/max-cpu"}}
metric-interval = "1m0s"

[whisper]
enabled = true
data-dir = "/data/whisper/"
schemas-file = "/etc/go-carbon/storage-schemas.conf"
aggregation-file = "/etc/go-carbon/storage-aggregation.conf"
workers = 2
max-updates-per-second = 10000
sparse-create = false

[cache]
max-size = 100000
write-strategy = "noop"

[udp]
enabled = true
listen = ":2003"
log-incomplete = false
buffer-size = 2000

[tcp]
enabled = true
listen = ":2003"
buffer-size = 2000

[pickle]
enabled = true
listen = ":2004"
max-message-size = 67108864
buffer-size = 2000

[carbonlink]
enabled = true
listen = ":7002"
read-timeout = "30s"
query-timeout = "100ms"

[grpc]
enabled = true
listen = ":7003"

[carbonserver]
enabled = true
listen = ":8080"
query-cache-enabled = true
query-cache-size-mb = 0
find-cache-enabled = true
buckets = 10
max-globs = 100
fail-on-max-globs = false
metrics-as-counters = false
trigram-index = true
graphite-web-10-strict-mode = true
internal-stats-dir = ""
read-timeout = "1m0s"
idle-timeout = "1m0s"
write-timeout = "1m0s"
scan-frequency = "5m0s"

[dump]
enabled = false
path = "/data/graphite/dump/"
restore-per-second = 0

[pprof]
enabled = false
listen = ":7007"

[[logging]]
logger = ""
file = "stdout"
level = "info"
encoding = "mixed"
encoding-time = "iso8601"
encoding-duration = "seconds"
