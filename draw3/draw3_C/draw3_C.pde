int count = 0;
int ballnum = 1000;//ballは1000個に限定
PVector cen;
float size;
//極座標で点の位置を決める
float dist[];//中心からの距離
float ang[];//中心からの角度
float sizeArr[];

void setup() {
  size(800, 800);
  cen = new PVector();
  cen.x = width/2;
  cen.y = height/2;
  size = 4;//ball size

  dist = new float[ballnum];
  ang = new float[ballnum];  
  sizeArr = new float[ballnum];

  noStroke();
  // fill(255);
}

void draw() {
  background(50);

  //ボールを一個ずつ配置していくので、
  //count番目のボールを中央付近に配置するところから始まる

  //配置位置を決める角度と距離
  float angle = 10;
  //float angle = 137.5;//黄金比に関連のある角度

  //配置当初の距離と角度（角度はこの後も不変）
  dist[count]=50;
  ang[count]=angle*count;
  sizeArr[count] = size;

  float theta = 137.5077641;

  //count番目以下のボールは既に配置されているので、
  //それらの位置の更新もしてあげます
  for (int i=0; i < count; i++)
  {
    //単純に円の極座標で、距離を少しずつ大きくしてます。
    //角度は変わっていません。
    // float x = dist[i] * cos(radians(ang[i]));
    // float y = dist[i] * sin(radians(ang[i]));
    float x = dist[i] * cos(theta/180*ang[i]);
    float y = dist[i] * sin(theta/180*ang[i]);
    
    fill(dist[i]);
    ellipse(x+cen.x, y+cen.y, sizeArr[i], sizeArr[i]);
    dist[i] += 0.4f;//これでちょっとずつ外側に移動する
    sizeArr[i] += 0.015f;
  }

  //次のdraw()の処理でcount+1番目のボールを配置するため
  //countを一つ足す。
  count++;

  //ボールは1000個しかないので、0～999番目までしかない。
  //countが1000になったら、0に戻してエラーを回避します。
  if (count>=ballnum)count=0;
}