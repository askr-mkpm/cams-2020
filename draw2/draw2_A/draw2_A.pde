void settings()
{
    size(500, 500);
}

float offx;
float offy;

void setup()
{
    background(255);

    offx = width/2;
    offy = height/2;

    float xa = 0+offx;
    float ya = 0+offy;

    stroke(200);
    strokeWeight(10);
    line(xa,ya,xa+offx/2,ya);//軸の描画
    line(xa,ya,xa,ya+offy/2);//軸の描画
}

void draw()
{
    stroke(0);
    strokeWeight(15);
    if(mousePressed)
    {    
        float sx = mouseX;
        float sy = mouseY;

        point(sx, sy);

        sx = sx - offx;
        sx = -sx;       
        sx = sx + offx;  
        point(sx, sy);    

        sy = sy - offy;
        sy = -sy;
        sy = sy + offy;
        point(sx, sy);

        sx = sx - offx; 
        sx = -sx;         
        sx = sx + offx;    
        point(sx, sy);
    }
}