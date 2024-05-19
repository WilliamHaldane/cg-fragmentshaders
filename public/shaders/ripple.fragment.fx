#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec2 scaled = model_uv * 2.0 - (vec2(1.0));
    // multiply by 2, then subtract 1

    float radius = length(scaled);
    // calculate radius = magnitude of texture coordinate

    vec2 offset = scaled * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;
    // calculate a texture coordinate offset = texture_coordinate * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0

    vec2 ripple = model_uv + offset;

    FragColor = texture(image, ripple);
}
