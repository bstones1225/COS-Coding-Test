/// Custom Ensemble Business Process for finding the longest palindrome
Class src.Hosts.PalindromeProcess Extends Ens.BusinessProcess
{
  Property TargetConfigNames = "src.Hosts.PalindromeOperation";
  
  Parameter SETTINGS = "TargetConfigNames";

Method onRequest(request as %File.String, response as %RegisteredObject) As %Status
{
  set tsc=$$$OK;
  do #class(src.Custom.PalindromeProcess).PaliSubString(request,.response);
  do ..StoreSQL(response);
  Set tSC = ..SendRequestAsync(TargetConfigNames, response)

}


Method PaliSubString(word as %File.String, output as %File.String) As %Status
{
     set n = CHAR_LENGTH(word); 
      
    // All substrings of length 1 
    // are palindromes 
    set maxLength = 1; start = 0; 
  
    // Nested loop to mark start and end index 
    for (set i = 0; i < n; i++) { 
        for (set j = i; j < n(); j++) { 
            set flag = 1; 
  
            // Check palindrome 
            for (set k = 0; k < (j - i + 1) / 2; k++) 
                if (word[i + k] != word[j - k]) 
                    flag = 0; 
  
            // Palindrome 
            if (flag && (j - i + 1) > maxLength) { 
                start = i; 
                maxLength = j - i + 1; 
            } 
        } 
    }
}

Method StoreSQL(paliWord as %File.String)
{
  SET sql=6
  SET sql(1)="CREATE TABLE mytable"
  SET sql(2)="Word VARCHAR(20))"
  SET sql(3)="INSERT INTO mytable(Word) VALUES (?)"
  SET statement=##class(%SQL.Statement).%New()
  SET statement.%Dialect="MSSQL"
  SET status=statement.%Prepare(.sql)
  SET result=statement.%Execute(paliWord)
}
}
