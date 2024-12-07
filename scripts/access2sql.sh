#!/bin/bash


access_database=${1}

# set output format from arg or postgres by default
if [ -z ${2} ]; then
    output_format=postgres
else
    output_format=${2}
fi

output_file=/dev/stdout

if [ -z ${access_database} ]; then
    exit 1
fi

echo "-- Export database: ${access_database}"
echo "-- Output format: ${output_format}"
echo -e "\n"

echo "-- Export schema"
mdb-schema ${access_database} ${output_format} > ${output_file}
echo "-- End export schema"
echo -e "\n" >> ${output_file}

tables=$(mdb-tables -1 ${access_database})
for table in $tables
do
    echo "-- Export table: ${table}" >> ${output_file}
    mdb-export -I ${output_format} ${access_database} ${table} >> ${output_file}
    echo -e "\n" >> ${output_file}
done