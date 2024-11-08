/// @description Insert description here
// You can write your code in this editor


draw_self();

if (!obj_clothing_controller.dressed) {
	
	
	
}

else if (obj_clothing_controller.dressed) {
	
	if (obj_clothing_controller.wear_professional) {
		draw_sprite(spr_clothing_monocle_64, 0, x, y);
        draw_sprite(spr_clothing_cravate_64, 0, x, y);
        draw_sprite(spr_clothing_briefcase_64, 0, x, y);
	}
	
	else if (obj_clothing_controller.wear_swim) {
		draw_sprite(spr_clothing_goggles_64, 0, x, y);
        draw_sprite(spr_clothing_snorkel_64, 0, x, y);
        draw_sprite(spr_clothing_floaties_64, 0, x, y);
	}
	
	else if (obj_clothing_controller.wear_knight) {
		draw_sprite(spr_clothing_helm_64, 0, x, y);
        draw_sprite(spr_clothing_armor_64, 0, x, y);
        draw_sprite(spr_clothing_knightboots_64, 0, x, y);
	}	
}