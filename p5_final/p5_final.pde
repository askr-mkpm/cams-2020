PShader frag;

void setup() 
{
    size(960, 540, P2D);
    frag = loadShader("bubble.glsl");
}

void draw() 
{
    frag.set("u_resolution", (float)width, (float)height);  
    frag.set("u_time", millis() / 1000.0);

    shader(frag);
    rect(0, 0, width, height);
}