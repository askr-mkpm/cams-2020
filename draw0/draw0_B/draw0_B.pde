void settings()
{
    size(500, 500);
}

void setup() 
{
    int textObjectLength = int(random(10,30));
    int[] textPosXArray = new int[textObjectLength];
    int[] textPosYArray = new int[textObjectLength];
    String[] textStrArray = new String[textObjectLength];

    for(int i = 0; i < textObjectLength; i++)
    {
        int x = int(random(0, width)); 
        int y = int(random(0, height));
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
