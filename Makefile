EXTENSION = pg_extension_bootstrap
MODULES = pg_extension_bootstrap
DATA = $(wildcard *--*.sql)

# postgresql build stuff
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
