#version 300 es
#define ALLOW_INCLUDES
#extension GL_ARB_shading_language_include : enable

layout(location = 0) in vec2 a_pos;

void main() {
    gl_Position = vec4(a_pos, 0.0, 1.0);
}
