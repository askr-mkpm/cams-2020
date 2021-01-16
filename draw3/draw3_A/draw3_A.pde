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

float t = 0;

void draw()
{
    colorMode(RGB, 255);
    background(255);
    Lissajous();

    float A = 200; //  横の大きさ
    float B = 200; //  縦の大きさ

    t += 0.03;
    float x = A * cos(3*t);
    float y = B * sin(4*t+PI);

    x += halfWidth;
    y += halfHeight;

    stroke(0);
    ellipse(x, y, 30, 30);
    
}

void Lissajous() 
{
  float A = 200; //  横の大きさ
  float B = 200; //  縦の大きさ
  colorMode(HSB, 1f);//RGBではなくHSB指定に変更。二つ目の引数はmax値を示す
  stroke(0, 1, 1, 0.2f);
  //fill(0, 1, 1, 0.2f);//中身を塗りつぶしてもよい

  for (float t=0; t<TWO_PI; t+=0.03f)
  {
    //一点ずつ色を変えるなら
    stroke(t/7, 1, 1, 0.5f);


    float x = A * cos(3*t);
    float y = B * sin(4*t+PI);


    //  図形を画面の中央に移動する
    x += halfWidth;
    y += halfHeight;

    //  得られたxとyの位置に円を描く
    ellipse(x, y, 20, 20);
  }
}