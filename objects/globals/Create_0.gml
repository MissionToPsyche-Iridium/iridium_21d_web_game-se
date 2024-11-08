/// @description Insert description here
// You can write your code in this editor




if(instance_exists(globals)){
	if(id != instance_find(globals, 0)){
		instance_destroy();
	}
}	

global.PointsCounter = 0;

