
CREATE TABLE image_tags (
    image_id   INTEGER NOT NULL,
    tag_id     INTEGER NOT NULL
);

ALTER TABLE image_tags ADD CONSTRAINT image_tags_pk PRIMARY KEY ( image_id,
tag_id );

CREATE TABLE images (
    image_id      INTEGER NOT NULL,
    location_id   INTEGER NOT NULL,
    source_id     INTEGER NOT NULL
);

ALTER TABLE images ADD CONSTRAINT image_pk PRIMARY KEY ( image_id );

CREATE TABLE instagram (
    instagram_id   INTEGER NOT NULL,
    source_id      INTEGER NOT NULL
);

ALTER TABLE instagram ADD CONSTRAINT instagram_pk PRIMARY KEY ( instagram_id );

CREATE TABLE location_type (
    location_type_id   INTEGER NOT NULL,
    name               character varying 
--  ERROR: Datatype UNKNOWN is not allowed 
);

ALTER TABLE location_type ADD CONSTRAINT location_type_pk PRIMARY KEY ( location_type_id );

CREATE TABLE locations (
    location_id        INTEGER NOT NULL,
    location_type_id   INTEGER NOT NULL
);

ALTER TABLE locations ADD CONSTRAINT location_pk PRIMARY KEY ( location_id );

CREATE TABLE photos (
    photo_id         INTEGER NOT NULL,
    source_id        INTEGER NOT NULL,
    title_translat   character varying 
--  ERROR: Datatype UNKNOWN is not allowed 
);

ALTER TABLE photos ADD CONSTRAINT photos_pk PRIMARY KEY ( photo_id );

CREATE TABLE shared_folder_images (
    shared_folder_id   INTEGER NOT NULL,
    image_id           INTEGER NOT NULL
);

ALTER TABLE shared_folder_images ADD CONSTRAINT shared_folder_images_pk PRIMARY KEY ( shared_folder_id,
image_id );

CREATE TABLE shared_folders (
    shared_folder_id   INTEGER NOT NULL,
    name               character varying 
--  ERROR: Datatype UNKNOWN is not allowed 
);

ALTER TABLE shared_folders ADD CONSTRAINT shared_folders_pk PRIMARY KEY ( shared_folder_id );

CREATE TABLE sources (
    source_id   INTEGER NOT NULL,
    name        character varying 
--  ERROR: Datatype UNKNOWN is not allowed 
);

ALTER TABLE sources ADD CONSTRAINT sources_pk PRIMARY KEY ( source_id );

CREATE TABLE tag_types (
    tag_type_id   INTEGER NOT NULL,
    name          character varying 
--  ERROR: Datatype UNKNOWN is not allowed 
);

ALTER TABLE tag_types ADD CONSTRAINT tag_types_pk PRIMARY KEY ( tag_type_id );

CREATE TABLE tags (
    tag_id        INTEGER NOT NULL,
    tag_type_id   INTEGER NOT NULL
);

ALTER TABLE tags ADD CONSTRAINT tag_pk PRIMARY KEY ( tag_id );

CREATE TABLE vk_albums (
    vk_album_id   INTEGER NOT NULL,
    source_id     INTEGER NOT NULL
);

ALTER TABLE vk_albums ADD CONSTRAINT vk_albums_pk PRIMARY KEY ( vk_album_id );

ALTER TABLE image_tags
    ADD CONSTRAINT image_tags_images_fk FOREIGN KEY ( image_id )
        REFERENCES images ( image_id );

ALTER TABLE image_tags
    ADD CONSTRAINT image_tags_tags_fk FOREIGN KEY ( tag_id )
        REFERENCES tags ( tag_id );

ALTER TABLE images
    ADD CONSTRAINT images_locations_fk FOREIGN KEY ( location_id )
        REFERENCES locations ( location_id );

ALTER TABLE images
    ADD CONSTRAINT images_sources_fk FOREIGN KEY ( source_id )
        REFERENCES sources ( source_id );

ALTER TABLE instagram
    ADD CONSTRAINT instagram_sources_fk FOREIGN KEY ( source_id )
        REFERENCES sources ( source_id );

ALTER TABLE locations
    ADD CONSTRAINT locations_location_type_fk FOREIGN KEY ( location_type_id )
        REFERENCES location_type ( location_type_id );

ALTER TABLE photos
    ADD CONSTRAINT photos_sources_fk FOREIGN KEY ( source_id )
        REFERENCES sources ( source_id );

ALTER TABLE shared_folder_images
    ADD CONSTRAINT shared_folder_images_images_fk FOREIGN KEY ( image_id )
        REFERENCES images ( image_id );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE shared_folder_images
    ADD CONSTRAINT shared_folder_images_shared_folders_fk FOREIGN KEY ( shared_folder_id )
        REFERENCES shared_folders ( shared_folder_id );

ALTER TABLE tags
    ADD CONSTRAINT tags_tag_types_fk FOREIGN KEY ( tag_type_id )
        REFERENCES tag_types ( tag_type_id );

ALTER TABLE vk_albums
    ADD CONSTRAINT vk_albums_sources_fk FOREIGN KEY ( source_id )
        REFERENCES sources ( source_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   6
-- WARNINGS                                 0

