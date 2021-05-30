Table table; 
PFont f;
int i;

public void setup(){
  table = loadTable("Apple.csv", "header");
  size(1000,800);
  background(40);
 
}

void draw(){
  String[] priceList;
  
  priceList = table.getStringColumn("High");
  print(parseFloat(priceList[3].substring(1)));
  //String val1 = table.getString(100,5).split("$")[0];

  i ++;
  
  
    int x = i%(width/50);
    int y = i/(width/50);
    //fill(255-(i%(width/50))*10);
    fill(255-abs(x-7)*7-abs(y-20)*3.5);
    
    text(priceList[i], x*50, y*15);
  
  
  save("DataLoadTest.jpg");
}
