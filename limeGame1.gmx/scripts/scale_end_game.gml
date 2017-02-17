obj_overlay.x = 0;
obj_overlay.y = 0;

obj_overlay.image_yscale = view_hview[0] / obj_overlay.sprite_height;
obj_overlay.image_xscale = view_wview[0] / obj_overlay.sprite_width;

var k_power = 0;

var current_header;
if (instance_exists(obj_lose_text)) {
    current_header = obj_lose_text;
    k_power = (view_wview[0]/2) / obj_lose_text.sprite_width;
    
    obj_lose_text.image_yscale = k_power;
    obj_lose_text.image_xscale = k_power;
    
    obj_lose_text.x = (view_wview[0] /2) - obj_lose_text.sprite_width*0.5;
    obj_lose_text.y = view_wview[0] / 5;
}

if (instance_exists(obj_win_text)) {
    current_header = obj_win_text;
    k_power = (view_wview[0]/2) / obj_win_text.sprite_width;
    
    obj_win_text.image_yscale = k_power;
    obj_win_text.image_xscale = k_power;
    
    obj_win_text.x = (view_wview[0] /2) - obj_win_text.sprite_width*0.5;
    obj_win_text.y = view_wview[0] / 5;
}

k_power = (4*view_wview[0]/5) / obj_try_again.sprite_width;

obj_try_again.image_yscale = k_power;
obj_try_again.image_xscale = k_power;

obj_try_again.x = (view_wview[0] /2) - obj_try_again.sprite_width*0.5;
obj_try_again.y = current_header.y + current_header.sprite_height + 10;
//2* view_wview[0] / 5;

k_power = (4*view_wview[0]/5) / obj_more.sprite_width;

obj_more.image_yscale = k_power;
obj_more.image_xscale = k_power;

obj_more.x = (view_wview[0] /2) - obj_try_again.sprite_width*0.5;
obj_more.y = obj_try_again.y + obj_try_again.sprite_height + 10;

if (instance_exists(obj_vk)) {
    k_power = (view_wview[0]/4) / obj_vk.sprite_width;
    
    obj_vk.image_yscale = k_power;
    obj_vk.image_xscale = k_power;
    
    obj_vk.x = 0.3*(view_wview[0] / 4);
    obj_vk.y = view_hview[0] - obj_vk.sprite_height*1.5;
    
    clickable_add_ext(obj_vk.x, obj_vk.y, sprite_get_tpe(spr_vk_button, 0), "https://vk.com/share.php?url="+global.current_path, "_blank", "", obj_vk.image_xscale, obj_vk.image_xscale);
}

if (instance_exists(obj_fb)) {
    k_power = (view_wview[0]/4) / obj_fb.sprite_width;
    
    obj_fb.image_yscale = k_power;
    obj_fb.image_xscale = k_power;
    
    obj_fb.x = 0.2*(view_wview[0] / 4) + obj_vk.x + obj_vk.sprite_width;
    obj_fb.y = view_hview[0] - obj_fb.sprite_height*1.5;
    
    clickable_add_ext(obj_fb.x, obj_fb.y, sprite_get_tpe(spr_fb_button, 0), "http://www.facebook.com/sharer.php?s=100&p[title]=Corona Extra&p[url]="+global.current_path, "_blank", "", obj_fb.image_xscale, obj_fb.image_xscale);
}

if (instance_exists(obj_twitter)) {
    k_power = (view_wview[0]/4) / obj_twitter.sprite_width;
    
    obj_twitter.image_yscale = k_power;
    obj_twitter.image_xscale = k_power;
    
    obj_twitter.x = 0.2*(view_wview[0] / 4) + obj_fb.x + obj_fb.sprite_width;
    obj_twitter.y = view_hview[0] - obj_twitter.sprite_height*1.5;
    
    clickable_add_ext(obj_twitter.x, obj_twitter.y, sprite_get_tpe(spr_twitter_button, 0), "https://twitter.com/intent/tweet?url="+global.current_path, "_blank", "", obj_twitter.image_xscale, obj_twitter.image_xscale);
}

if (instance_exists(obj_share_text)) {
    k_power = 3*(view_wview[0]/4) / obj_share_text.sprite_width;
    
    obj_share_text.image_yscale = k_power;
    obj_share_text.image_xscale = k_power;
    
    obj_share_text.x = (view_wview[0] - obj_share_text.sprite_width)/2;
    obj_share_text.y = obj_twitter.y - obj_share_text.sprite_height*1.4;
}

