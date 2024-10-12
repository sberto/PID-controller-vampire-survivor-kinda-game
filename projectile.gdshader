shader_type canvas_item;

uniform vec2 velocity;
uniform float size = 0.5;

void fragment() {
	COLOR = vec4(vec3(1.), 1. - 2. * length(UV-0.5));
}
