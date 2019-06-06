/// @param  surface
/// @param  shader
/// @param  sampleScale 

var _surface = argument0;
var _shader  = argument1;
var _scale   = argument2;

var _width  = surface_get_width(_surface);
var _height = surface_get_height(_surface);
var _temp   = surface_create(_width, _height);

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
