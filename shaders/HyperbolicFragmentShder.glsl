#version 300 es

precision highp float;
uniform vec2 u_resolution;
uniform vec2 u_center;
out vec4 FragColor;

const vec2  GEO_C  = vec2(3.6035, 2.0107);
const float GEO_R2 = 16.028;

vec2 cMul(vec2 a, vec2 b) {
    return vec2(a.x*b.x - a.y*b.y, a.x*b.y + a.y*b.x);
}

vec2 cDiv(vec2 a, vec2 b) {
    return vec2(dot(a,b), a.y*b.x - a.x*b.y) / dot(b,b);
}

vec2 mobiusPan(vec2 z, vec2 c) {
    return cDiv(z + c, vec2(1.0,0.0) + cMul(vec2(c.x,-c.y), z));
}

void main() {
    vec2 uv = (gl_FragCoord.xy / u_resolution) * 2.0 - 1.0;
    float aspect = u_resolution.x / u_resolution.y;
    uv.x *= aspect;
    float diskR = min(u_resolution.x, u_resolution.y) / u_resolution.x;
    uv /= diskR;

    float r = length(uv);
    if (r >= 1.0) {
        FragColor = vec4(1.0, 1.0, 1.0, 1.0);
        return;
    }

    vec2  z   = mobiusPan(uv, u_center);
    float par = 0.0;

    for (int i = 0; i < 100; i++) {
        if (z.x < 0.0) { z.x = -z.x; par = 1.0 - par; }
        if (z.y < 0.0) { z.y = -z.y; par = 1.0 - par; }
        vec2  d  = z - GEO_C;
        float d2 = dot(d, d);
        if (d2 < GEO_R2) {
            z   = GEO_C + (GEO_R2 / d2) * d;
            par = 1.0 - par;
        }
    }

    float col = par;
    col = mix(col, 0.45, smoothstep(0.97, 1.0, r));
    FragColor = vec4(col, col, col, 1.0);
}
