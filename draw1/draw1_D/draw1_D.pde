void settings()
{
    size(500, 500);
}

void setup() 
{
    background(255);
    colorMode(HSB, 255,255,255);

    branch(width/2, height, -90, 10, 10);
}

void branch(float sx, float sy,  float angle, float depth, float depthMax)
{
    if(depth>0)
    {
        float depthFactor = depth/depthMax; 

        float rad = radians(angle);
        float radius = depth * 5;
        
        float lengthDepthFactor = depth * 0.2;
        float ex =sx + cos(rad)* radius * lengthDepthFactor;
        float ey =sy + sin(rad)* radius * lengthDepthFactor;
        
        strokeWeight(depth*0.5);
        stroke(depthFactor*255*0.2,150,255);
        
        line(sx, sy, ex, ey);

        branch(ex,ey,angle+20, depth-1, depthMax);
        branch(ex,ey,angle-20, depth-1, depthMax);
    }
}