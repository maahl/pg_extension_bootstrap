// this include should come first
#include "postgres.h"

#include "fmgr.h"

PG_MODULE_MAGIC;

void _PG_init(void);
void _PG_fini(void);

// function executed when the library is loaded
void _PG_init(void)
{
}


// function executed when the library is unloaded
void _PG_fini(void)
{
}
