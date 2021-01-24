void setup() 
{
    size(500,500);

    drawTextAt(100, 100, "word");
}

void drawTextAt(int x, int y, String str)
{
    textSize(32);
    text(str, x, y);
}