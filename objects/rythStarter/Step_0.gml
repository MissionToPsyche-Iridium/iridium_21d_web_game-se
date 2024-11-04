/// @description add rythem game
// You can write your code in this editor
var shows = "";
var songPosition = (delta_time / 1000) + songPos;
for(var i = 0; i < ds_list_size(noteTimings); i++){
	var noteTime = ds_list_find_value(noteTimings, i);
	var note = ds_list_find_value(notes, i);
	shows += string(note)+ ", ";
	if(songPos < noteTime && songPosition >= noteTime){
		
		
		switch(note){
			case 0:
				instance_create_layer(160, -64, "Instances", leftNote);
			break;
			case 1:
				instance_create_layer(320, -64, "Instances", midNote);
			break;
			case 2:
				instance_create_layer(480, -64, "Instances", rigntNotes);
		}	
		
	}	
}
songPos = songPosition;

