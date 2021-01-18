int canvasSize_x, canvasSize_y;
float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

Ball ball;

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
    ball = new Ball();
}

void draw()
{
    background(0);
    ball.display();
    ball.move();
}

class Ball
{
    //6. ↓ member variables (メンバ変数)
    float bx=200;
    float by=100;
    float vx = 10;
    float vy = 0;
    float ballSize = 100;

    float ang = 0;

    //7. ↓"constructor" (コンストラクタ)
    Ball(){}  

    //8. ↓member methods (メンバメソッド)
    void display()
    {
        ellipse(bx, by, ballSize, ballSize);
    }  

    void move()
    {
        bx += sin(ang*PI)*20;
        ang += 0.05;
    }  
}