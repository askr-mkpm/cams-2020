int canvasSize_x, canvasSize_y;
final float PI = acos(-1);

void settings()
{
    canvasSize_x = 500;
    canvasSize_y = 500;

    size(canvasSize_x, canvasSize_y);
}

float offx;
float offy;

float angle = PI * 60/180;
int itr = int(2*PI/angle);

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
    float x = mouseX;
    float y = mouseY;

    for(int i = 0; i < itr; i++)
    {
        float preX = x;
        float preY = y;

        mouseDrawMirror(x, y);

        preX -= width/2;
        preY -= height/2;

        x = cos(angle) * preX - sin(angle) * preY;
        y = sin(angle) * preX + cos(angle) * preY;

        x += width/2;
        y += height/2;
    }
}

void mouseDrawMirror(float sx, float sy)
{
    stroke(0);
    strokeWeight(15);
    if(mousePressed)
    {
        point(sx, sy);

        sx = sx - offx;
        sx = -sx;       
        sx = sx + offx;  
        point(sx, sy);    
    }
}