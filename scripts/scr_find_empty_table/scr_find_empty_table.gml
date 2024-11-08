function scr_find_empty_table() {
    var table_found = noone;

    // loop through all tables in the room
    with (obj_table) {
        if (!occupied) {  // check if the table is unoccupied
            table_found = id;  // set this table as found
            break;
        }
    }
    return table_found;
}
