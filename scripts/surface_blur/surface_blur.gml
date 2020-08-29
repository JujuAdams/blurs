/// @param  surface       Surface to blur
/// @param  tempSurface   Temporary surface to use as a transfer. Set this to -1 to have this script create a surface for you
/// @param  shader        Shader to use for the blur
/// @param  sampleScale   Step scale to use for the blur

var _surface = argument0;
var _temp    = argument1;
var _shader  = argument2;
var _scale   = argument3;

var _temp_destroy = false;
if (!surface_exists(_temp))
{
    _temp_destroy = true;
    _temp = surface_create(surface_get_width(_surface), surface_get_height(_surface));
}

surface_set_target(_temp);
draw_clear(c_black);
shader_set(_shader);
shader_set_uniform_f( shader_get_uniform(_shader, "u_vTexelStep"), _scale*texture_get_texel_width(surface_get_texture(_surface)), 0.0);
shader_set_uniform_f( shader_get_uniform(_shader, "u_fIntensity"), 1);
draw_surface(_surface, 0, 0);
shader_reset();
surface_reset_target();

surface_set_target(_surface);
shader_set(_shader);
shader_set_uniform_f(shader_get_uniform(_shader, "u_vTexelStep"), 0.0, _scale*texture_get_texel_height(surface_get_texture(_temp)));
shader_set_uniform_f(shader_get_uniform(_shader, "u_fIntensity"), 1);
draw_surface(_temp, 0, 0);
shader_reset();
surface_reset_target();

if (_temp_destroy) surface_free(_temp);