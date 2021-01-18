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
    background(0);

    ball = new Ball(10);
}

void draw()
{
    blendMode(BLEND);
    fill(0,0,0,10);
    rect(0,0,width,height);

    ball.display();
    ball.move();
}

class Ball
{
    //6. ↓ member variables (メンバ変数)

    float vx = 10;
    float vy = 0;
    float ballSize = 50;

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
        blendMode(ADD);
        fill(31, 127, 255, 127);

        for(int i = 0; i < bN; i++)
        {
            ellipse(pos[i].x, pos[i].y, ballSize, ballSize);
        }   
    }  

    void move()
    {
        for(int i = 0; i < bN; i++)
        {
            pos[i].x += cos((ang+i)*PI)*20;
            pos[i].y += sin((ang+i)*PI)*20;
        } 
        ang += 0.05;
    }  
}