/// @description Insert description here
// You can write your code in this editor


//set up variable to select path
var _select = -1;



//waiting means one line of diaglogue has been given but there are more lines, press space to advance
if ChatterboxIsWaiting(chatterbox){
	if keyboard_check_pressed(vk_space){
		ChatterboxContinue(chatterbox);
		text = ChatterboxGetContent(chatterbox,0);
		nodeTitle   = ChatterboxGetCurrent(chatterbox); }
} else
	{
		
	///this else block is for selecting an option.  The options are printed in the draw event
		
 if (ChatterboxGetOptionCount(chatterbox))
    {
	  
     if (keyboard_check_released(ord("1"))) _select = 1;      
     if (keyboard_check_released(ord("2"))) _select = 2;      
     	
	}
}

if (_select != -1)  {
	
	if (_select == 1) {
		room_goto_next();
	}
	
	else if (_select == 2) {
		game_end();	
	}
	
}