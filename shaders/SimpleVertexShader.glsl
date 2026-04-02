#version 300 es
#define ALLOW_INCLUDES
#extension GL_ARB_shading_language_include : enable
precision         highp float;

layout(location = 0) in vec3 vertexPosition_modelspace;
// uniform mat4 MVP;

void main() {
//	gl_Position = MVP * vec4(vertexPosition_modelspace, 1);
	gl_Position.xyz = vertexPosition_modelspace;
	gl_Position.w = 1.0;
}