class Converter{
  static int dateToInt(String str){
    String t = str.substring(0,4)+str.substring(5,7)+str.substring(8,10)+str.substring(11,13)+str.substring(14,16);
    //print(t);
    return int.parse(t);
  }

 static String intToString(int t){
    String str=t.toString();
    str=str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6,8)+" "+str.substring(8,10)+":"+str.substring(10,12);
    return str;
  }
}