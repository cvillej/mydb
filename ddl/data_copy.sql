-- location_type
insert 
into location_type(location_type_id, name)
  select id, name
  from public.filter_type;

-- location 
insert 
into locations(location_id, location_type_id, name, latitude, longitude, country, radius)
  select id, filter_type, name, latitude, longitude, country, radius
  from public.filter_locations;

-- shared_folder
insert
into shared_folders(shared_folder_id, name, created_at)
  select id, name, created_at
  from public.shared_folders;

-- shared_folder_images
insert 
into shared_folder_images(shared_folder_id, image_id)
  select folder, image
  from public.shared_images;

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

-- sources
insert
into sources(source_id, name)
  select id, source_name
  from public.sources;

-- images 
insert
into images(location_id, source_id)
  select i.filter_location, sm.source
  from public.social_media sm
  JOIN public.images i ON i.source_oid = sm.oid;

-- image_tags **
insert
into image_tags(image_id, tag_id, confidence)
  select  image, tag, confidence
  from public.image_tags;

-- photos 
insert 
into photos(source_id, title_translat, title_translit, service, user_translit, tags, tags_translit, lang)
  select 2, title_translat, title_translit, service, user_tranlit, tags, tags_translit, lang 
  from public.photos;

-- instagram 
insert 
into instagram(source_id, user_name_translit, location_translit, description_translit, tags, tags_translit, sentiment, lang_value, lang_primary, lang_others, date_translated)
  select 1, user_name_translit, location_translit, description_translit, tags, tags_translit, sentiment, lang_value, lang_primary, lang_others, date_translated
  from public.instagram;

-- vk_albums **
insert 
into vk_albums(source_id, profile_image, relation_status, birthday, user_languages, user_website, journal_link, hometown, curr_city, mobile_phone, skype_username, inspired_by, twitter_link, facebook_link, last_time_seen, political_views, world_views, activities, interests, vk_source, author, likes, commcount, photo_desc, photo_hash, military_branch, user_address)
  select 3, profile_image, relation_status, birthday, user_languages, user_website, journal_link, hometown, curr_city, mobile_phone, skype_username, inspired_by, twitter_link, facebook_link, last_time_seen, political_views, world_views, activities, interests, vk_source, author, likes, commcount, photo_desc, photo_hash, military_branch, user_address
  from public.vk_albums; 


