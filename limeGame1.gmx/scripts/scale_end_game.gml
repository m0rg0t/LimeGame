obj_overlay.x = 0;
obj_overlay.y = 0;

obj_overlay.image_yscale = view_hview[0] / obj_overlay.sprite_height;
obj_overlay.image_xscale = view_wview[0] / obj_overlay.sprite_width;
show_debug_message("obj_overlay.sprite_width " + obj_overlay.sprite_width);
show_debug_message("obj_overlay.image_yscale " + obj_overlay.image_yscale);

var k_power = 0;

if (instance_exists(obj_lose_text)) {
    k_power = (view_wview[0]/2) / obj_lose_text.sprite_width;
    
    obj_lose_text.image_yscale = k_power;
    obj_lose_text.image_xscale = k_power;
    
    obj_lose_text.x = (view_wview[0] /2) - obj_lose_text.sprite_width*0.5;
    obj_lose_text.y = view_wview[0] / 4;
}

if (instance_exists(obj_win_text)) {
    k_power = (view_wview[0]/2) / obj_win_text.sprite_width;
    
    obj_win_text.image_yscale = k_power;
    obj_win_text.image_xscale = k_power;
    
    obj_win_text.x = (view_wview[0] /2) - obj_win_text.sprite_width*0.5;
    obj_win_text.y = view_wview[0] / 4;
}

k_power = (4*view_wview[0]/5) / obj_try_again.sprite_width;

show_debug_message("k_power " + k_power);

obj_try_again.image_yscale = k_power;
obj_try_again.image_xscale = k_power;

obj_try_again.x = (view_wview[0] /2) - obj_try_again.sprite_width*0.5;
obj_try_again.y = 2* view_wview[0] / 3;

k_power = (4*view_wview[0]/5) / obj_more.sprite_width;

obj_more.image_yscale = k_power;
obj_more.image_xscale = k_power;

obj_more.x = (view_wview[0] /2) - obj_try_again.sprite_width*0.5;
obj_more.y = obj_try_again.y + obj_try_again.sprite_height + 30;

