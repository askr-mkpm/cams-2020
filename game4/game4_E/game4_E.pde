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
    PVector vecA = new PVector(1,1,1);
    PVector vecB = new PVector(2,2,2);
    vecA.add(vecB);
    float magA = vecA.mag();
    print("magnitude of VecA:"+magA);
}