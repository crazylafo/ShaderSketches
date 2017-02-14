float circle(vec2 coord, vec2 offs)
{
    float reso = 16.0;
    float cw = iResolution.x / reso;

    vec2 p = mod(coord, cw) + offs * cw;
    float d = distance(p, vec2(cw / 2.0));

    vec2 p2 = floor(coord / cw) - offs;

    float t = iGlobalTime * 2.0 + p2.x * 0.44 + p2.y * 0.31;

    float l = cw * (sin(t) + 1.2) * 0.4;
    float lw = 1.5;

    return saturate(1.0 - abs(l - d) / lw);
}

void main()
{
    float c = 0.0;
    for (int i = 0; i < 9; i++)
        c += circle(gl_FragCoord.xy, vec2(mod(float(i), 3.0) - 1.0, float(i / 3) - 1.0));
    gl_FragColor = vec4(vec3(saturate(c)), 1);
}