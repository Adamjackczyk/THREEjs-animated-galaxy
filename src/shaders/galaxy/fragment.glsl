#define PI 3.1415926535897932384626433832795

varying vec3 vColor;

vec2 rotate(vec2 uv, vec2 pivot, float angle) {
    // Translate UV to pivot point
    uv -= pivot;
    
    // Rotate using 2D rotation matrix
    float s = sin(angle);
    float c = cos(angle);
    mat2 rotationMatrix = mat2(c, -s, s, c);
    uv = rotationMatrix * uv;
    
    // Translate back
    uv += pivot;
    
    return uv;
}

void main()
            {
                //Disk

                // float strength = distance(gl_PointCoord, vec2(0.5));
                // strength = 1.0 -step(.5, strength);

                //Diffuse point
                // float strength = distance(gl_PointCoord, vec2(0.5));
                // strength *= 2.0;
                // strength = 1.0 - strength;

                //Light point

                // float strength = distance(gl_PointCoord, vec2(0.5));
                // strength = 1.0 - strength;
                // strength =  pow(strength, 10.0);

                //Star
                 vec2 rotatedUv = rotate(gl_PointCoord, vec2(0.5, 0.5), PI / 4.0);

                 vec2 lightUvX = vec2((rotatedUv.x * .1) + .45,(rotatedUv.y * .6) + .2);
                 vec2 lightUvY = vec2((rotatedUv.y * .1) + .45,(rotatedUv.x * .6) + .2);

                 float strengthX = 0.015 / distance(lightUvX, vec2(0.5, 0.5));
                 float strengthY = 0.015 / distance(lightUvY, vec2(0.5, 0.5));

                 float strength = strengthX * strengthY;

                 float alpha = step(0.009, strength);


                vec3 color = mix(vec3(0.0), vColor, strength);

                gl_FragColor = vec4(color, alpha);

                #include <colorspace_fragment>
            }