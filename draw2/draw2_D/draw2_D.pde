int canvasSize_x, canvasSize_y;
final float PI = acos(-1);

void settings()
{
    canvasSize_x = 500;
    canvasSize_y = 500;

    size(canvasSize_x, canvasSize_y);
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