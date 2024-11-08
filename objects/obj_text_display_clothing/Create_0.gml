/// @description Insert description here
// You can write your code in this editor


//create chatterbox and load yarn file

ChatterboxLoadFromFile("clothing_game.yarn");
chatterbox = ChatterboxCreate("clothing_game.yarn");

//determine which node from yarn file to load based on room name

ChatterboxJump(chatterbox, "Start");


//variables for text box set up
textWidth = 400;
lineHeight = 28;


//get text and node title from yarn file
text = ChatterboxGetContent(chatterbox, 0);
node_title = ChatterboxGetCurrent(chatterbox);

