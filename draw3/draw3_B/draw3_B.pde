import controlP5.*;//controlP5のインポート

ControlP5 cp5;//ControlP5変数を定義
float sliderValue = 0;

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
  noStroke();
  cp5 = new ControlP5(this);

  cp5.addSlider("sliderValue")
     .setPosition(0,0)
     .setRange(0,2*PI)
     ;
}

void draw() 
{
    colorMode(RGB, 255);
    background(255);
    
    float A = 200; 
    float B = 200;
    float t = sliderValue;

    Lissajous(A, B);
    LissajousAnimation(A, B, t);
}

void Lissajous(float A, float B) 
{
  colorMode(HSB, 1f);
  stroke(0, 1, 1, 0.2f);

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

void LissajousAnimation(float A, float B, float t)
{
    float x = A * cos(3*t);
    float y = B * sin(4*t+PI);

    x += halfWidth;
    y += halfHeight;

    stroke(0);
    ellipse(x, y, 30, 30);
}