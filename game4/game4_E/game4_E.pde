float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

void settings()
{
    size(500, 500);

    halfWidth = width / 2;
    halfHeight = height / 2;
}

void setup()
{
    PVector vecA = new PVector(1,2);
    PVector unitA = new PVector();

    unitA = PVector.div(vecA, sqrt(pow(vecA.x,2)+pow(vecA.y,2)));

    print("UnitVector:"+unitA);
}