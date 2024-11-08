/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, rigntNotes)){
	with( instance_place(x, y, rigntNotes) ){
		instance_destroy();
		addPoints(50);
	}	
} else {
	removePoints(10);
}	