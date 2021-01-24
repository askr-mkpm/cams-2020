final float PI = acos(-1);

void settings()
{
    size(500, 500);
}

void setup() 
{
    int lineNum = 20;

    for(int i = 0; i < 4; i++)
    {
        rotate(PI/2);
        translate(0, -height);
        drawPattern(width, height, lineNum);
    }
}

void drawPattern(int x, int y, int lineNum)
{
    for(int i = 0; i < lineNum; i++)
    {
        float x1 = 0; 
        float y1 = 0;
        y1 += (y/lineNum)*i;

        float x2 = 0;
        x2 += (x/lineNum)*i;
        float y2 = y;
    
        stroke(255-y1, x2, 255+y1);    
        line(x1, y1, x2, y2);
    }
}
