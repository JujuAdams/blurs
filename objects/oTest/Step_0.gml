if (keyboard_check_released(vk_anykey)) mode = (mode + 1) mod 3;
if (keyboard_check_released(vk_escape)) game_end();