PVector canvasSize;
int canvasSize_x, canvasSize_y;

void settings()
{
    canvasSize = new PVector(500,500);
    canvasSize_x = int(canvasSize.x);
    canvasSize_y = int(canvasSize.y);

    size(canvasSize_x, canvasSize_y);
}

void setup() 
{
    int textObjectLength = int(random(10,30));
    int[] textPosXArray = new int[textObjectLength];
    int[] textPosYArray = new int[textObjectLength];
    String[] textStrArray = new String[textObjectLength];

    for(int i = 0; i < textObjectLength; i++)
    {
        int x = int(random(0, canvasSize_x)); 
        int y = int(random(0, canvasSize_y));
        String str = "("+str(x)+","+str(y)+")";
        textPosXArray[i] = x;
        textPosYArray[i] = y;
        textStrArray[i] = str;
    }

    drawTextAtArray(textPosXArray, textPosYArray, textStrArray);
    
}

void drawTextAtArray(int[] x, int[] y, String[] str)
{
    textSize(12);
    for(int i =0; i < str.length; i++)
    {
        text(str[i], x[i], y[i]);
    }
}
