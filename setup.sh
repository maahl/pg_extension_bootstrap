#!/usr/bin/env sh

# This script replaces the name of the extension in all necessary files and
# renames them accordingly.

# check the existence of the parameter
[ -z "$1" ] && \
    echo "Please provide the extension name as an argument" && \
    exit 1
extension_name=$1

# change the name of the extension in the files
sed -i -- "s/pg_extension_bootstrap/$extension_name/g" \
    Makefile \
    pg_extension_bootstrap--0.1.sql \
    pg_extension_bootstrap.c

sed -i -- "s/pgextensionbootstrap/$extension_name/g" \
    pg_extension_bootstrap.control

# rename the files according to the extension name
mv pg_extension_bootstrap--0.1.sql "$extension_name--0.1.sql"
mv pg_extension_bootstrap.c "$extension_name.c"
mv pg_extension_bootstrap.control "$extension_name.control"

# warn the user if the extension name starts with "pg_", because schema names
# can't start with this prefix
[ "${extension_name:0:3}" == "pg_" ] && \
    echo "Note: make sure to change the schema name in $extension_name.control" \
        "(postgres reserves schemas starting with pg_ for the system)"
