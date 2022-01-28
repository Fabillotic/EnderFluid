#version 150

#moj_import <projection.glsl>

in vec3 Position;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out vec4 texProj0;

void main() {
	vec2 p = normalize(Position.xz);
    vec4 pos = ProjMat * ModelViewMat * vec4(Position.x, Position.y + (sin(GameTime * 5000 + (p.x + p.y) * 3) - 1) / 2 * 0.2, Position.z, 1.0);
	gl_Position = pos;

    texProj0 = projection_from_position(pos);
}
