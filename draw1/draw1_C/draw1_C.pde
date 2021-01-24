void settings()
{
    size(500, 500);
}

void setup() 
{
    background(255);
    colorMode(HSB, 255,255,255);

    branch(width/2, height, -90, 10);
}

void branch(float sx, float sy,  float angle, int depth)
{
    if(depth>0)
    {
        float rad = radians(angle);
        float radius = depth * 5;
        
        float lengthDepthFactor = depth * 0.2;
        float ex =sx + cos(rad)* radius * lengthDepthFactor;
        float ey =sy + sin(rad)* radius * lengthDepthFactor;
        
        strokeWeight(depth*0.5);
        stroke(255,150,0); 

        line(sx, sy, ex, ey);

        branch(ex,ey,angle+20, depth-1);
        branch(ex,ey,angle-20, depth-1);
    }
}