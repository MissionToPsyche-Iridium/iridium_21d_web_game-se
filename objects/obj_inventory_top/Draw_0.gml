/// @description Insert description here
// You can write your code in this editor


draw_self();

if (obj_clothing_controller.dressed)  {
	
	if (obj_clothing_controller.wear_professional) draw_sprite(spr_clothing_monocle_64, 0, x, y);
	
	else if (obj_clothing_controller.wear_swim) draw_sprite(spr_clothing_goggles_64, 0, x, y);
	
	else if (obj_clothing_controller.wear_knight) draw_sprite(spr_clothing_helm_64, 0, x, y);	
	
}