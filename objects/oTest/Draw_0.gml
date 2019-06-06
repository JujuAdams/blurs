var _shader = shdBlurLinear;
switch(mode)
{
    case 0: _shader = shdBlurGaussian; break;
    case 1: _shader = shdBlurSigmoid; break;
    case 2: _shader = shdBlurLinear; break;
}

if (!surface_exists(surface)) surface = surface_create(room_width, room_height);

surface_set_target(surface);
draw_clear(c_black);
draw_sprite(sTest, 0, 0, 0);
surface_reset_target();

surface_blur(surface, _shader, 1);

draw_surface(surface, 0, 0);