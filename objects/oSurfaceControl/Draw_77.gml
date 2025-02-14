shader_set(sLightDecay)
shader_set_uniform_f(u_px, oPlayer.x)
shader_set_uniform_f(u_py, oPlayer.y)

draw_surface(application_surface, 0, 0);
shader_reset()