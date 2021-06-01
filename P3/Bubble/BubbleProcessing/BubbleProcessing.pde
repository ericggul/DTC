Table table; 
PFont font;
int i = 0;
int totalLength;
String dateText;
import java.util.Stack;
import java.util.List;
PShape bubble;

//Intialize String
String[] initialPriceListLow, initialPriceListHigh, initialDate;
float [] priceListLow, priceListHigh;
String[] date;

int maxValue;

String company = "AAPL";

public void setup(){
  //Getting csv file name: QCOM.csv for example
  String csv = String.format("%s.csv", company);
  table = loadTable(csv, "header");
  
  //Font
  font = loadFont("TimesNewRomanPSMT-48.vlw");
  textFont (font, 20);
  
  //Data Retriving
  initialPriceListLow = table.getStringColumn("Low");
  initialPriceListHigh = table.getStringColumn("High");
  initialDate = table.getStringColumn("Date");

  totalLength = initialPriceListLow.length;
  
  priceListLow = new float [totalLength];
  priceListHigh = new float [totalLength];
  date = new String [totalLength];
  
  for(int i=0; i<totalLength; i++){
    priceListLow[i] = parseFloat(initialPriceListLow[totalLength -1 - i].substring(1));
    priceListHigh[i] = parseFloat(initialPriceListHigh[totalLength- 1 - i].substring(1));
    date[i] = initialDate[totalLength-1-i];
  }
  
  //MaxValue of All Time
  maxValue = ceil(reverse(sort(priceListHigh))[0]);

  size(1250,700);
  bubble = loadShape("Bubble.svg");
}





//Draw Function
void draw(){
  background(color(173, 49, 89));
  
  i ++;
  
  shape(bubble, 100,100);
  
  if(i<totalLength){

    shape(bubble, 200, 200, 5*priceListHigh[i], 5*priceListHigh[i]);

  }
  
  
  //Saving
  String outputPath = String.format("output/%sStock.jpg", company);
  saveFrame(outputPath);
}
