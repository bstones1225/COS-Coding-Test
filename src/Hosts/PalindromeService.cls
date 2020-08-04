/// Custom Ensemble Business Service for reading the input for the Longest Palindrome problem
Class src.Hosts.PalindromeService Extends Ens.BusinessService
{
  Parameter ADAPTER = "EnsLib.File.InboundAdapter";
  
  Property FilePath = "C:/INDEX.TXT";
  
  Property FileSpec = "inputFile.txt";
  
  Property TargetConfigNames = "src.Hosts.PalindromeProcess";
  
  Parameter SETTINGS = "TargetConfigNames, FilePath, FileSpec";
  
Method OnProcessInput(pInput As %RegisteredObject,pOutput As %RegisteredObject) As %Status
{
   set tsc=$$$OK
   while `pInput.AtEnd {
      set word = pInput.ReadLine()
      Set tSC = ..SendRequestAsync(TargetConfigNames, word)

   
   Quit tsc
}
}


