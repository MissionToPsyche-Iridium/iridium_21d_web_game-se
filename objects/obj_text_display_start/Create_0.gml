/// @description Insert description here
// You can write your code in this editor
room_goto(room_end);  // Skips all the other rooms and jumps to room_end


//create chatterbox and load yarn file

ChatterboxLoadFromFile("llamaStub.yarn");
chatterbox = ChatterboxCreate("llamaStub.yarn");

//determine which node from yarn file to load based on room name

if (room == room_start) {
	ChatterboxJump(chatterbox,"Start");
} else if (room == room_clothing) {
	ChatterboxJump(chatterbox,"ClothingGame");
} else if (room == room_jump) {
	ChatterboxJump(chatterbox,"JumpGame");
}  else if (room == room_pizza) {
	ChatterboxJump(chatterbox,"PizzaGame");
}  else if (room == room_deck) {
	ChatterboxJump(chatterbox,"DeckGame");
}  else if (room == room_rhythm) {
	ChatterboxJump(chatterbox,"RhythmGame");
} else if (room == room_end) {
	ChatterboxJump(chatterbox,"End");
}


//variables for text box set up
textWidth = 400;
lineHeight = 28;


//get text and node title from yarn file
text = ChatterboxGetContent(chatterbox, 0);
nodeTitle = ChatterboxGetCurrent(chatterbox);

