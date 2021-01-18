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

    ball = new Ball(30);
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
    float[] ballSize;

    PVector[] vel;

    PVector[] pos;
    int bN;

    //7. ↓"constructor" (コンストラクタ)
    Ball(int ballNum)
    {
        bN = ballNum;
        pos = new PVector[bN];
        vel = new PVector[bN];
        ballSize = new float[bN];

        for(int i = 0; i < bN; i++)
        {
          pos[i] = new PVector(i*10, i*10);
          vel[i] = new PVector(random(1, 3), random(1, 3));
          ballSize[i] = 10;
        }

    }  

    //8. ↓member methods (メンバメソッド)
    void display()
    {
        blendMode(ADD);
        fill(31, 127, 255, 127);

        for(int i = 0; i < bN; i++)
        {
            ellipse(pos[i].x, pos[i].y, ballSize[i], ballSize[i]);
        }   
    }  

    void move()
    {
        for(int i = 0; i < bN; i++)
        {
            pos[i].x += vel[i].x;
            pos[i].y += vel[i].y;

            if(pos[i].x < 0 || width < pos[i].x || pos[i].y < 0 || height < pos[i].y)
            {
                vel[i].x *= -1;
                vel[i].y *= -1;

                ballSize[i] -= 1;
                if(ballSize[i] < 0)
                {
                    ballSize[i] = 0;
                }
            }
        }
    }  
}