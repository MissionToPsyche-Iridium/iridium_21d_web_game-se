// restart_game.gml
function restart_game() {
    // Reset all global variables or states here
    global.quiz_completed = false;
    global.questions_answered = 0;
    global.current_question = 0;
    global.player_answer = -1;
    global.result_text = "";

    // Go back to the first room (e.g., the scientist selection room)
    room_goto(room_start);
}
