application_surface_draw_enable(false);

light_surface = surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
light_surface2 = surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))

u_px = shader_get_uniform(sLightDecay,"u_px");
u_py = shader_get_uniform(sLightDecay,"u_py");
