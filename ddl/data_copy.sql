-- location_type
insert 
into location_type(location_type_id, name)
  select id, name
  from public.filter_type;

-- location **
insert 
into locations(location_id, location_type_id, name, latitude, longitude, country, radius)
  select id, filter_type, name, latitude, longitude, country, radius
  from public.filter_locations;

-- shared_folder
insert
into shared_folders(shared_folder_id, name, created_at)
  select id, name, created_at
  from public.shared_folders;

-- tag_types
insert
into tag_types(tag_type_id, name)
  select id, name
  from public.tag_types;

-- tags 
insert 
into tags(tag_id, tag_type_id, name)
  select id, type, name
  from public.tags;

-- images **
insert
into images(image_id, location_id, source_id)
select id, filter_location, source_oid
  from public.images;


-- image_tags
insert
into image_tags(image_id, tag_id, confidence)
  select 