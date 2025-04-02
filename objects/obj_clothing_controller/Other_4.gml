//@description  Set up room size, viewports, and cameras for room_clothing

// Stop all sounds
audio_stop_all();

// Play new sound on loop
var new_sound = snd_autumn_lo_fi_astronaut; // Replace with your sound asset
audio_play_sound(new_sound, 1, true);


ChatterboxLoadFromFile("clothing_game_random.yarn");
global.chatterbox_clothing = ChatterboxCreate("clothing_game_random.yarn");
ChatterboxVariableDefault("rand_branch", -1);
ChatterboxVariableDefault("outcome", -1);


show_debug_message("mode = " + global.mode);
