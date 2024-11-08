/// @description Insert description here
// You can write your code in this editor

//text box draws itself
draw_self();


//set up formatting for text
draw_set_color(c_aqua);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//offsets 
var _opty = 60;
_x = x + 20;


//if stopped means there is not more text or options, that is the end of the yarn file or path
if ChatterboxIsStopped(chatterbox){
   draw_text_ext_color(x,y," ",lineHeight,textWidth, c_aqua,  c_aqua,  c_aqua,  c_aqua, 1);
} else 
	//this else branch is to print the main text and the if is in case of options
	{
 
	 draw_text_ext_color(x,y,text,lineHeight,textWidth, c_aqua,  c_aqua,  c_aqua,  c_aqua, 1);
 
	 if ChatterboxGetOptionCount(chatterbox) > 0{
		 for (var _i = 0; _i < ChatterboxGetOptionCount(chatterbox); _i++){
			 var _option = string(_i+1) +": " + ChatterboxGetOption(chatterbox, _i); 
			 draw_text_ext_color(_x, y+_opty,_option, lineHeight, textWidth, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, 1);
				_opty+=20;  
		}
	}
	
	}

