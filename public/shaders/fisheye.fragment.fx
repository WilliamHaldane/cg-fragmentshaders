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
    vec2 scaled = model_uv * 2.0 - (vec2(1.0));
    // multiply by 2, then subtract 1

    float theta = atan(scaled.y, scaled.x);
    // calculate 𝜽 = arctan(texture_coordinate_y, texture_coordinate_x)

    float radius = pow(length(scaled), 1.5);
    // calculate radius = magnitude of texture coordinate, raised to the power of 1.5

    vec2 fishCoord = vec2(radius * cos(theta), radius * sin(theta));
    // calculate fish eye texture coordinate = (radius * cos(𝜽),  radius * sin(𝜽))

    scaled = 0.5 * (fishCoord + 1.0);
    // final texture coordinate = 0.5 * (fish eye texture coordinate + 1.0)

    FragColor = texture(image, fishCoord);
}
