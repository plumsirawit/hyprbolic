#version 300 es
#define ALLOW_INCLUDES
#extension GL_ARB_shading_language_include : enable
precision         highp float;
// in vec3 fragmentColor;
out vec3 color;
void main() {
	color = vec3(1,0,0);
}