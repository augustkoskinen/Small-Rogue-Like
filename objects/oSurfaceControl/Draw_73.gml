var scale = 1;
var sprite = sLight;

if (!surface_exists(self.light_surface)) {
    self.light_surface = surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
}
if (!surface_exists(self.light_surface2)) {
    self.light_surface2 = surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
}