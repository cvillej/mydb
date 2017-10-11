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

-- shared_folder_images **
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
into images(image_id, location_id, source_id)
  select i.id, i.filter_location, sm.source
  from public.social_media sm
  JOIN public.images i ON i.source_oid = sm.oid;

-- image_tags 
insert
into image_tags(image_id, tag_id, confidence)
  select  image, tag, confidence
  from public.image_tags;

-- photos
insert 
into tmp_photos(photo_id, title_translat, title_translit, service, user_translit, tags, tags_translit, lang, image_id)
select  nextval('photos_photo_id_seq'), p.title_translat, p.title_translit, p.service, p.user_tranlit, p.tags, p.tags_translit, p.lang, i.id
FROM public.social_media sm
join public.photos p on sm.ogc_fid = p.ogc_fid and sm.source > 2
JOIN public.images i ON i.source_oid = sm.oid
JOIN public.sources s ON s.id = sm.source
join public.filter_locations fl on fl.id = i.filter_location;

insert 
into photos(photo_id, title_translat, title_translit, service, user_translit, tags, tags_translit, lang)
select p.photo_id, p.title_translat, p.title_translit, p.service, p.user_translit, p.tags, p.tags_translit, p.lang 
FROM tmp_photos p;

-- photo_images 
insert 
into photo_images(photo_id, image_id)
select p.photo_id, p.image_id
  from tmp_photos p,
       images i
  where i.image_id = p.image_id;

-- instagram  
insert 
into tmp_instagram(instagram_id, user_name_translit, location_translit, description_translit, tags, tags_translit, sentiment, lang_value, lang_primary, lang_others, date_translated, image_id)
select nextval('instagram_instagram_id_seq'), ins.user_name_translit, ins.location_translit, ins.description_translit, ins.tags, ins.tags_translit, ins.sentiment, ins.lang_value, ins.lang_primary, ins.lang_others, ins.date_translated, i.id
FROM public.social_media sm
     join public.instagram ins on sm.ogc_fid = ins.ogc_fid and sm.source = 1
     JOIN public.images i ON i.source_oid = sm.oid
     JOIN public.sources s ON s.id = sm.source
     JOIN public.filter_locations fl ON fl.id = i.filter_location;

insert 
into instagram(instagram_id, user_name_translit, location_translit, description_translit, tags, tags_translit, sentiment, lang_value, lang_primary, lang_others, date_translated)
  select instagram_id, user_name_translit, location_translit, description_translit, tags, tags_translit, sentiment, lang_value, lang_primary, lang_others, date_translated
  from tmp_instagram;

-- instagram_images
insert 
into instagram_images(instagram_id, image_id)
select ti.instagram_id, ti.image_id 
  from tmp_instagram ti,
       images i
where i.image_id = ti.image_id;


-- vk_albums 
insert 
into tmp_vk_albums(vk_album_id, profile_image, relation_status, birthday, user_languages, user_website, journal_link, hometown, curr_city, mobile_phone, skype_username, inspired_by, twitter_link, facebook_link, last_time_seen, political_views, world_views, activities, interests, vk_source, author, likes, commcount, photo_desc, photo_hash, military_branch, user_address, image_id)
select nextval('vk_album_id_seq'), vk.profile_image, vk.relation_status, vk.birthday, vk.user_languages, vk.user_website, vk.journal_link, vk.hometown, vk.curr_city, vk.mobile_phone, vk.skype_username, vk.inspired_by, vk.twitter_link, vk.facebook_link, vk.last_time_seen, vk.political_views, vk.world_views, vk.activities, vk.interests, vk.vk_source, vk.author, vk.likes, vk.commcount, vk.photo_desc, vk.photo_hash, vk.military_branch, vk.user_address, i.id
FROM public.social_media sm
     JOIN public.vk_albums vk on sm.ogc_fid = vk.ogc_fid and sm.source = 3
     JOIN public.images i ON i.source_oid = sm.oid
     JOIN public.sources s ON s.id = sm.source
     JOIN public.filter_locations fl ON fl.id = i.filter_location;

insert 
into vk_albums(vk_album_id, profile_image, relation_status, birthday, user_languages, user_website, journal_link, hometown, curr_city, mobile_phone, skype_username, inspired_by, twitter_link, facebook_link, last_time_seen, political_views, world_views, activities, interests, vk_source, author, likes, commcount, photo_desc, photo_hash, military_branch, user_address)
  select vk_album_id, profile_image, relation_status, birthday, user_languages, user_website, journal_link, hometown, curr_city, mobile_phone, skype_username, inspired_by, twitter_link, facebook_link, last_time_seen, political_views, world_views, activities, interests, vk_source, author, likes, commcount, photo_desc, photo_hash, military_branch, user_address
  from tmp_vk_albums;


-- vk_album_images
insert 
into vk_images(vk_album_id, image_id)
select tvk.vk_album_id, i.image_id
  from tmp_vk_albums tvk,
       images i
 where i.image_id = tvk.image_id