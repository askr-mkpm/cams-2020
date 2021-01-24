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
    circle(x, y, 10);

    float angle = PI * 10/180;
    float rotX = cos(angle) * x - sin(angle) * y;
    float rotY = sin(angle) * x + cos(angle) * y;
    circle(rotX, rotY, 10);
}