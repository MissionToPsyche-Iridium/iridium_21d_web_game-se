// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ticks_to_milliseconds(ticks, bpm, resolution) {
    var ms_per_tick = 60000 / (bpm * resolution); // Calculate milliseconds per tick
    return ticks * ms_per_tick;  // Convert ticks to milliseconds
}