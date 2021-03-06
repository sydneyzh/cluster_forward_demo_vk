#version 450 core
#extension GL_ARB_separate_shader_objects : enable

layout (location= 0) in vec3 pos_in;

layout(set = 0, binding = 0) uniform UBO
{
    mat4 view;
    mat4 normal;
    mat4 model;
    mat4 projection_clip;

    vec2 tile_size; // xy
    uvec2 grid_dim; // xy

    vec3 cam_pos;
    float cam_far;

    vec2 resolution;
    uint num_lights;
} ubo_in;

out gl_PerVertex
{
    vec4 gl_Position;
};

void main(void)
{
    gl_Position = ubo_in.projection_clip * ubo_in.view * ubo_in.model * vec4(pos_in, 1.f);
}
