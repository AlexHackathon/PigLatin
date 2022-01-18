public void setup() 
{
  String[] lines = loadStrings("LowellHymn.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) 
  {
    ArrayList<String> lineWords = findWord(lines[i]);
    for(int j = 0; j < lineWords.size(); j++){
      print(pigLatin(lineWords.get(j)) + " ");
    }
    print(",");
    println();
  }
  println();

  String[] words = loadStrings("words.txt");
  System.out.println("there are " + words.length + " lines");
  for (int j = 0; j < words.length; j++) 
  {
    System.out.println(pigLatin(words[j]));
  }
}
public ArrayList<String> findWord(String line){
  int spaceIndex = -1;
  ArrayList<String> words = new ArrayList<String>();
  for(int i = 0; i < line.length(); i++){
    if(line.substring(i,i+1).equals(" ") || line.substring(i,i+1).equals(",") || line.substring(i,i+1).equals(".")){
      words.add(line.substring(spaceIndex + 1, i));
      spaceIndex = i;
    }
  }
  return words;
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  sWord = sWord.toLowerCase();
  for(int i = 0; i < sWord.length(); i++){
    if(sWord.charAt(i) == 'a' || 
       sWord.charAt(i) == 'e' ||
       sWord.charAt(i) == 'i' ||
       sWord.charAt(i) == 'o' ||
       sWord.charAt(i) == 'u'){
         return i;
     }
  }
  return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  if(findFirstVowel(sWord) == -1)
  {
    return sWord + "ay";
  } else if(findFirstVowel(sWord) == 0){
    return sWord + "way";
  } else if(sWord.charAt(0) == 'q' && findFirstVowel(sWord) == 1){
    return sWord.substring(2,sWord.length()) + "quay";
  } else {
    return sWord.substring(findFirstVowel(sWord),sWord.length()) + sWord.substring(0,findFirstVowel(sWord)) + "ay";
  }
}
