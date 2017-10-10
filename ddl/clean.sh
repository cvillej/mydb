#!/bin/bash

perl -pi -e 's/unknown/character varying/g' create_tables.sql

perl -pi -e 's/ CONSTRAINTS//g' drop_tables.sql
