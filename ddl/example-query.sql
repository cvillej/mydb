

select count(*)
from locations l,
     images i,
     image_tags it,
     tags t,
     tag_types tt,
     vk_images vki,
     vk_albums vka,
     instagram_images igi,
     instagram ig,
     photo_images pi,
     photos p
where i.location_id = l.location_id
  and it.image_id = i.image_id
  and t.tag_id = it.tag_id
  and tt.tag_type_id = t.tag_type_id
  and vki.image_id = i.image_id
  and vk.vk_album_id = vki.vk_album_id
  and igi.image_id = i.image_id
  and i.instagram_id = igi.instagram_id
  and pi.image_id = i.image_id
  and p.photo_id = pi.photo_id;


select count(p.id)
from public.photos p,
     public.social_media sm,
     public.images i
where sm.ogc_fid = p.ogc_fid
  and sm.source = 3
  and i.source_oid = sm.oid;

select count(*)
from public.photos;

select count(p.id)
from public.photos p,
     public.social_media sm
where sm.ogc_fid = p.ogc_fid;


select count(p.id)
FROM public.social_media sm
left outer join public.photos p on sm.ogc_fid = p.ogc_fid and sm.source > 3
JOIN public.images i ON i.source_oid = sm.oid
JOIN public.sources s ON s.id = sm.source;


   FROM social_media sm
        left outer join instagram ins on sm.ogc_fid = ins.ogc_fid and sm.source = 1
        left outer join vk_albums vk on sm.ogc_fid = vk.ogc_fid and sm.source = 3
        left outer join photos p on sm.ogc_fid = p.ogc_fid and sm.source > 3
     JOIN images i ON i.source_oid = sm.oid
     JOIN sources s ON s.id = sm.source
     JOIN filter_locations fl ON fl.id = i.filter_location
     JOIN filter_type ft ON ft.id = fl.filter_type
     JOIN country_codes_iso cc ON fl.country::text = cc.iso3166_alpha_2::text
     LEFT JOIN shared_images si ON si.image = i.id;