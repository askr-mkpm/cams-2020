int canvasSize_x, canvasSize_y;
float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

void settings()
{
    canvasSize_x = 500;
    canvasSize_y = 500;
    size(canvasSize_x, canvasSize_y);

    halfWidth = width / 2;
    halfHeight = height / 2;
}

void setup()
{
    strokeWeight(2);
    stroke(255);
}

float len = 100; //length of vector

void draw()
{
    background(0);

    float cx = halfWidth;
    float cy = halfHeight;
    float dist = sqrt(sq(mouseX - cx) + sq(mouseY - cy));
    float vecx = (mouseX - cx)/dist;
    float vecy = (mouseY - cy)/dist;  

    line(cx, cy, cx + vecx*len, cy + vecy*len);
}