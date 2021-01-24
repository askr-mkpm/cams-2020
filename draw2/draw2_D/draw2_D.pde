final float PI = acos(-1);

void settings()
{
    size(500, 500);
}

void setup() 
{
    background(255);

    float x = 300;
    float y = 200;

    float angle = PI * 10/180;
    int itr = int(2*PI/angle);

    for(int i = 0; i < itr; i++)
    {
        float preX = x;
        float preY = y;

        circle(x, y, 10);

        preX -= width/2;
        preY -= height/2;

        x = cos(angle) * preX - sin(angle) * preY;
        y = sin(angle) * preX + cos(angle) * preY;

        x += width/2;
        y += height/2;
    }
}