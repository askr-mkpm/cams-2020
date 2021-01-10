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
    circle(x, y, 10);

    float angle = PI * 10/180;
    float rotX = cos(angle) * x - sin(angle) * y;
    float rotY = sin(angle) * x + cos(angle) * y;
    circle(rotX, rotY, 10);
}