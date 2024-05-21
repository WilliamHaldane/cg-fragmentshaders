#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color = texture(image, model_uv);

    vec3 invertcolor = 1.0 - color.rgb;

    FragColor = vec4(invertcolor, 1.0);
}
