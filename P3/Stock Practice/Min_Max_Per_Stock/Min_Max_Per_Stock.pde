
//Company Name
String company = "AMZN";
String[] companies = {"FB", "AMZN", "NFLX", "AAPL", "GOOG", "NVDA", "TSLA"};

Table table; 
PFont font;
int i = 0;
int totalLength;
String dateText;
import java.util.Stack;
import java.util.List;


//Intialize String
String[] initialPriceListLow, initialPriceListHigh, initialDate;
float [] priceListLow, priceListHigh;
String[] date;

int maxValue;
int minValue;

int[] maxValues = new int[companies.length];
int[] minValues =  new int[companies.length];


public void setup(){
  for(int j=0; j<companies.length; j++){
    company = companies[j];
    String csv = String.format("%s.csv", company);
    table = loadTable(csv, "header");
    
    smooth(2);
    
    //Font
    font = loadFont("HelveticaNeue-48.vlw");
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
    minValue = floor(sort(priceListHigh)[0]);    
    
    maxValues[j] = maxValue;
    minValues[j] = minValue;
  }
  

  size(2500, 1000);
  background(40);

}

//Define Coordinate Class to store the (j,k) coordinate value per time
class Coordinate{
  int j, k;
  Coordinate(int _j, int _k){
    j = _j;
    k = _k;
  }
}



//Draw Function
void draw(){
  
  print(companies[i], maxValues[i], minValues[i], float(maxValues[i]/minValues[i]), ' ');
  i++;
}
