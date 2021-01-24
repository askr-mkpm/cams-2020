float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

Ball ball;

void settings()
{
    size(500, 500);

    halfWidth = width / 2;
    halfHeight = height / 2;
}

void setup()
{
    ball = new Ball(10);
}

void draw()
{
    background(0);
    ball.display();
    // ball.move();
}

class Ball
{
    //6. ↓ member variables (メンバ変数)

    float vx = 10;
    float vy = 0;
    float ballSize = 100;

    float ang = 0;

    PVector[] pos;
    int bN;

    //7. ↓"constructor" (コンストラクタ)
    Ball(int ballNum)
    {
        bN = ballNum;
        pos = new PVector[bN];

        for(int i = 0; i < bN; i++)
        {
          pos[i] = new PVector(i*50, i*50);
        }

    }  

    //8. ↓member methods (メンバメソッド)
    void display()
    {
        for(int i = 0; i < bN; i++)
        {
            ellipse(pos[i].x, pos[i].y, ballSize, ballSize);
        }   
    }  

    // void move()
    // {
    //     bx += sin(ang*PI)*20;
    //     ang += 0.05;
    // }  
}