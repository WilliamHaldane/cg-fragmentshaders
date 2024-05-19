#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {

    vec4 color = texture(image, model_uv);
    vec4 roundedcolor = (round(color * 4.0)) / 4.0;

    FragColor = roundedcolor;
}