

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



