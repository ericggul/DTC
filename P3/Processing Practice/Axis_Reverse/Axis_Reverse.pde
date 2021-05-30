Table table; 
PFont f;
int i;
import java.util.Stack;
import java.util.List;

public void setup(){
  table = loadTable("Apple.csv", "header");
  size(1250,200);
  background(40);
 
}

void draw(){
  String[] initialPriceListLow, initialPriceListHigh, initialDate;
  initialPriceListLow = table.getStringColumn("Low");
  initialPriceListHigh = table.getStringColumn("High");
  initialDate = table.getStringColumn("Date");
  
  int totalLength = initialPriceListLow.length;
  
  float[] priceListLow = new float [totalLength];
  float[] priceListHigh = new float [totalLength];
  String[] date = new String [totalLength];
  
  for(int i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[totalLength -1 - i].substring(1));
    priceListHigh[i] = parseFloat(initialPriceListHigh[totalLength- 1 - i].substring(1));
    date[i] = initialDate[totalLength-1-i];
  }
  
  int maxValue = ceil(sort(priceListHigh)[0]);
  float valueMain[][] = new float [maxValue*2][]; 
  
  //Stack <float[][]> valueStack = new Stack<float[][]>();
  //List<Stack<float[]>>
  Stack[] valueStack = new Stack[maxValue];
  
  for(int i=0; i<totalLength; i++){
    int low = floor(priceListLow[i]);
    int high = ceil(priceListHigh[i]);
    float diff = priceListHigh[i] - priceListLow[i];

    for(int j=low; j<high; j++){
       float min_diff = min(min(priceListHigh[i]-j, 1),j-priceListLow[i]+1);
       float diff_result = min_diff/diff;
       valueStack[j].push(diff_result);
       //valueMain[j].push(diff_result); 
       //valueStack[j].push();
       //float x[] = new float [4];
       //x.add(diff_result);
    }
  }
  
  i ++;
  
  if(i<maxValue){
    if(i==1){
      textSize(20);
      text("Apple(AAPL) Stock Price", 20, 30);
      textSize(10);
      text("Source: NASDAQ", 20, 50);
    }
    fill(255);
    noStroke();
    ellipse(i*20,10,10,10);
    
  }
  saveFrame("AAPLStock.jpg");
}
