//距離関数の参照
//https://iquilezles.org/www/articles/distfunctions/distfunctions.htm

//屈折表現の参照
//https://qiita.com/aa_debdeb/items/4c35f59cc6ead09c822d
//https://stackoverflow.com/questions/9841863/reflection-refraction-with-chromatic-aberration-eye-correction

precision highp float;

uniform vec2  u_resolution;
uniform float u_time;

//---

const float pi = acos(-1.);

mat2 rot(float a)
{
    float c=cos(a),s=sin(a);
    return mat2(c,s,-s,c);
}

vec3 rep(vec3 p,float r)
{
    return mod(p,r)-.5*r;
}

vec3 round(vec3 p, float c)
{
	vec3 r;
	r.x = floor(p.x/c+0.5);
	r.y = floor(p.y/c+0.5);
	r.z = floor(p.z/c+0.5);
	return r;
}

vec3 opRepLim( in vec3 p, in float c, in vec3 l)
{
	vec3 r = round(p,c);
    return p-c*clamp(r,-l,l);
}

//---

float random (in vec2 st) 
{
    return fract(sin(dot(st.xy,
        vec2(12.9898,78.233)))*
        43758.5453123);
}

float hash( float n )
{
    return fract(sin(n)*43758.5453);
}

float noise( in vec3 x ) 
{
    vec3 p = floor(x);
    vec3 f = fract(x);

    f = f*f*(3.0-2.0*f);
    float n = p.x + p.y*57.0 + 113.0*p.z;
    return mix(mix(mix( hash(n+  0.0), hash(n+  1.0),f.x),
                   mix( hash(n+ 57.0), hash(n+ 58.0),f.x),f.y),
               mix(mix( hash(n+113.0), hash(n+114.0),f.x),
                   mix( hash(n+170.0), hash(n+171.0),f.x),f.y),f.z);
}

vec3 noise3(vec3 x) 
{
	return vec3( noise(x+vec3(123.456,.567,.37)),
				 noise(x+vec3(.11,47.43,19.17)),
				 noise(x) );
}

// https://www.shadertoy.com/view/4dS3Wd
float noise_fbm (in vec2 st) 
{
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}

#define OCTAVES 6
float fbm (in vec2 st) 
{
    float value = 0.0;
    float amplitude = .5;

    for (int i = 0; i < OCTAVES; i++) 
	{
        value += amplitude * noise_fbm(st);
        st *= 2.;
        amplitude *= .5;
    }
    return value;
}

//---

float sdSphere(vec3 p, float s)
{
    return length(p) - s;
}

float sdBubble(vec3 p, float r)
{
	float  t = u_time * 2.5;
	vec3 n = vec3(sin(t * 0.5), sin(t * 0.3), cos(t * 0.2));
	vec3 q = 0.15 * (noise3(p + n) - 0.5);
	
	return length(q + p) - r;
}

float sdOctahedron( vec3 p, float s)
{
	p.xy *= rot(pi*u_time*0.1);
	p = abs(p);
	float m = p.x+p.y+p.z-s;
	vec3 q;
		if( 3.0*p.x < m ) q = p.xyz;
	else if( 3.0*p.y < m ) q = p.yzx;
	else if( 3.0*p.z < m ) q = p.zxy;
	else return m*0.57735027;

	float k = clamp(0.5*(q.z-q.y+s),0.0,s); 
	return length(vec3(q.x,q.y-s+k,q.z-k)); 
}

float sdOctBubble( vec3 p, float s)
{
	p = abs(p);
	float  t = u_time * 2.5;
	vec3 n = vec3(sin(t * 0.5), sin(t * 0.3), cos(t * 0.2));
	vec3 q = 0.35 * (noise3(p + n) - 0.5);
	p += q;
	return (p.x+p.y+p.z-s)*0.57735027;
}

float sdRoundBox( vec3 p, vec3 b, float r )
{
	// p.yx *= rot(pi*0.25);
	p.zx *= rot(pi*u_time*0.1);
  	vec3 q = abs(p) - b;
  	return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0) - (r-0.05*sin(u_time*0.1));
}

// domain rep
// https://www.shadertoy.com/view/4dcBRN
float lisp(vec3 p, float r, float s)
{
	float cc = 5.;
	float t = 0.5;
	p.x += sin(u_time* t)*cc;
	p.y += 1.2 * cos(u_time * 0.5*t)*cc;
	p.z += 2. * sin(u_time*0.1*t)*cc;

	return sdBubble(opRepLim(p,r, vec3(1.0, 1.0, 1.0)),s);
}

float randBubble(vec3 p)
{
	float d = lisp(p, 15., 1.5);
	float t = 20.;
    return d;
}

float sdCylinder( vec3 p, vec3 c )
{
  	return length(p.xz-c.xy)-c.z;
}

float sdBoundingBox( vec3 p, vec3 b, float e )
{
    p = abs(p  )-b;
  	vec3 q = abs(p+e)-e;
  	return min(min(
      length(max(vec3(p.x,q.y,q.z),0.0))+min(max(p.x,max(q.y,q.z)),0.0),
      length(max(vec3(q.x,p.y,q.z),0.0))+min(max(q.x,max(p.y,q.z)),0.0)),
      length(max(vec3(q.x,q.y,p.z),0.0))+min(max(q.x,max(q.y,p.z)),0.0));
}

float sdCappedTorus(in vec3 p, in vec2 sc, in float ra, in float rb)
{
	p.yz = p.yz*rot(pi*0.5);
	p.x = abs(p.x);
	float k = (sc.y*p.x>sc.x*p.y) ? dot(p.xy,sc) : length(p.xy);
	return sqrt( dot(p,p) + ra*ra - 2.0*ra*k ) - rb;
}

//---

float easeInOutCubic(float x) 
{
	return (x < 0.5) ? 4. * x * x * x : 1. - pow(-2. * x + 2., 3.) / 2.;
	// return 1. - pow(1. - x, 3.);
}

float easeInQuad(float x) 
{
	return x * x;
}

float ht = 0.;

float map(vec3 p)
{
	p.y += ht ;
	float d;
	float t = u_time;
	float s;
	float rb = randBubble(p);
	float box = sdRoundBox(p, vec3(2.), 1.);
	float bub = sdBubble(p, 2.);
	float bub_2 = sdBubble(p, 4.);
	float oct = sdOctahedron(p, 4.);
	float octbub = sdOctBubble(p, 4.);

	if(t < 5.){d = bub;}
	else if(5. < t && t < 10.){ s = clamp(easeInOutCubic(t-5.),0.,1.); d = mix(bub, oct, s);}
	else if(10. < t && t < 15.){s = clamp(easeInOutCubic(t-10.),0.,1.); d = mix(oct, octbub,s);}
	else if(15. < t && t < 20.){s = clamp(easeInOutCubic(t-15.),0.,1.); d = mix(octbub, bub_2,s);}
	else if(20. < t && t < 25.){s = clamp(easeInQuad(t-20.),0.,1.); d = mix(bub_2, rb,s);}
	else{s = clamp(easeInQuad(t-25.),0.,1.); d = mix(rb, box,s);}
	
	return d;
	// return oct;
}

float samplingMap(vec3 p)
{
	float d;

	vec3 rp = rep(p,19.);
  	vec3 rpp = vec3(p.x, rp.y, p.z);

	vec3 cp_1 = vec3(p.x, p.y, p.z);
	vec3 cp_2 = vec3(p.x+ 20., p.y, p.z+ 10.);
	vec3 cp_3 = vec3(p.x+ 10., p.y, p.z- 10.);

	float c = sdCylinder(cp_1, vec3(0.));
	// c = min(c, sdCylinder(cp_2, vec3(1.)));
	// c = min(c, sdCylinder(cp_3, vec3(1.)));
	float b = sdCappedTorus(rpp, vec2(0.), 25., 1.);
	float tb = sdBoundingBox(rpp,vec3(20., 9.7, 20.), 1.5);
	d = c;

	return d;
}

//---

vec3 getNormal(vec3 p)
{
    float d = 0.0001;
	vec2 z = vec2(0.);
    return normalize(vec3(
        map(p + vec3(d, z)) - map(p + vec3(-d, z)),
        map(p + vec3(z.x, d, z.x)) - map(p + vec3(z.x, -d, z.x)),
        map(p + vec3(z, d)) - map(p + vec3(z, -d))
    ));
}

float rI = 1.5;
vec3 lightDir = normalize(vec3(1.0, .0, 1.0));
vec3 lightCol = vec3(2.0);
vec3 subCol = vec3(0.90, 0.95, 1.0);

//https://www.shadertoy.com/view/3lf3zX
vec3 starPat (vec3 rd, float scl)
{
	vec3 tm, qn, u;
	vec2 q;
	float f;
	tm = -1. / max (abs (rd), 0.0001);
	qn = - sign (rd) * step (tm.zxy, tm) * step (tm.yzx, tm);
	u = max (tm.x, max (tm.y, tm.z)) * rd;
	
	q = atan (vec2 (dot (u.zxy, qn), dot (u.yzx, qn)), vec2 (1.)) / pi;
	f = 0.57 * (fbm (11. * dot (0.5 * (qn + 1.), vec3 (1., 2., 4.)) + 731.13 * scl * q) +
		fbm (13. * dot (0.5 * (qn + 1.), vec3 (1., 2., 4.)) + 771.13 * scl * q.yx));
	return 8. * vec3 (1., 1., 0.8) * pow (f, 16.);
}

vec3 sky(vec3 lightDir, vec3 rd, vec3 ro)
{
	vec3 col;
	float sunWeight = clamp(dot(rd,lightDir),0.,1.);

	vec3 sunCol = vec3(0.8,0.8,0.6);
	vec3 darkCol = vec3(0.0863, 0.1686, 0.2549);
	vec3 sky = mix(darkCol, sunCol, 1.5*pow(sunWeight, 20.));
	
	col =  sky*(1.0-0.8*rd.y);
	col += 0.3*vec3(0.4, 0.4902, 0.5333)*pow(sunWeight, 10.);
	col += 0.1*vec3(1., 0.7, 0.7)*pow(sunWeight, 30.);
	col += vec3(1.0, 0.6941, 0.3451)*pow(sunWeight, 512.);

	col = mix( col, 0.9*vec3(1.0, 0.9569, 0.8314), pow( 1.-max(rd.y+0.1,0.0), 8.0));
 
	float st = pow(starPat(rd, 3.1).x,4.);
	vec3 starCol = col + st* max(rd.y, -0.2)*3.;
	col = mix(col, starCol, rd.y);

	float cloudSpeed = 0.01;
	float cloudFlux = .5;

	vec3 cloudCol = mix(vec3(1.0, 1.0, 1.0), 0.35*sunCol,pow(sunWeight, 2.));

	vec2 uv = (rd*-1000./dot(rd, vec3(0.,1.,0.))).xz + u_time * 3.5;
    float clouds = 0.5*smoothstep(0.5,0.8,fbm(0.0002*uv+fbm(0.0002*uv+u_time*cloudFlux)));

	col = mix(col, cloudCol, clouds);

	return col;
}

vec3 samplingMarch(vec3 ro, vec3 rd) 
{
	vec3 sampleCol = sky(lightDir, rd, ro);
	float dist;
	float rayDepth = 0.;

	return sampleCol;	
}

float schlickFresnel(float ri, float cosine) 
{
	float r0 = (1.0 - ri) / (1.0 + ri);
	r0 = r0 * r0;
	return r0 + (1.0 - r0) * pow(1.0 - cosine, 5.0);
}

vec3 march(vec3 ro, vec3 rd)
{
	vec3 rayCol = samplingMarch(ro,rd);
	float dist;
	float rayDepth = 0.;
	
	for(int i = 0; i < 64; i++)
	{
		vec3 rayPos = ro + rd * rayDepth;
		dist = map(rayPos);
		float dist2 = samplingMap(rayPos);

		if(dist < 0.001 && dist < dist2)
		{
			vec3 n = getNormal(rayPos);
			vec3 refl = reflect(rd, n);
			float eta = 1. / rI;
			vec3 refr = refract(rd, n, eta);

			float f = schlickFresnel(rI, max(0.0, dot(-rd, n)));

			vec3 spec = f * lightCol * pow(max(0.0, dot(refl, lightDir)), .5);
			// return spec + subCol * samplingMarch(rayPos, refr);
			
			vec3 revRayPos = rayPos + refr * 1000.0;
			for (int j = 0; j < 32; j++) 
			{
				float d = map(revRayPos);
				revRayPos += -refr * d;
				if (d < 0.001 && dist < dist2) 
				{
					vec3 n2 = getNormal(revRayPos);
					vec3 refr_2 = refract(refr, -n2, rI);

					if (length(refr_2) > 0.01) 
					{
						rayCol = spec + subCol * samplingMarch(revRayPos, refr_2);
						return rayCol;
					} else {
						vec3 refl_2 = reflect(refr, -n2);
						rayCol = spec + subCol * samplingMarch(revRayPos, refl_2);
						return rayCol;
					}
				}
			}
		}

		rayDepth += dist;
	}

	return rayCol;//samplingMarch(ro,rd);
}

//https://github.com/CesiumGS/cesium/blob/master/Source/Shaders/Builtin/Functions/saturation.glsl
vec3 czm_saturation(vec3 rgb, float adjustment)
{
	// Algorithm from Chapter 16 of OpenGL Shading Language
	const vec3 W = vec3(0.2125, 0.7154, 0.0721);
	vec3 intensity = vec3(dot(rgb, W));
	return mix(intensity, rgb, adjustment);
}

void main( void ) 
{
	vec2 p = (gl_FragCoord.xy * 2.- u_resolution) / min(u_resolution.y, u_resolution.x);

	vec3 camOffset = vec3(5.0 * cos(u_time * 0.2)-10., 5.0 * (-2.5 - (sin(u_time*0.5))) + 3.0, 30.0 * sin(u_time * 0.2)-10.);
    vec3 ro = vec3(0.,0.,-15.);
	ro.xz = ro.xz * rot(pi*0.6-u_time * 0.04);
	ro += camOffset;
	float tt = 0.085;
	ro += fbm(vec2(sin(u_time*tt), cos(u_time*tt)))*8.;

    vec3 ta = vec3(0.);
	ta.y -= ht;
    vec3 z = normalize(ta - ro);
    vec3 up = vec3(0., 1., 0.);
    vec3 x = normalize(cross(z, up));
    vec3 y = normalize(cross(x, z));
	vec3 rd = normalize(x * p.x + y * p.y + z * 2.5);

	vec3 col = march(ro, rd);

	//vignette
    float vg = pow(sqrt(dot(p,p)) * 0.4,3.)+1.;
    float vig = 1.0 / pow(vg,3.);
	col *= vig;

	col = czm_saturation(col, 1.);
	// col += 0.01;

	gl_FragColor = vec4(col, 1.);
}