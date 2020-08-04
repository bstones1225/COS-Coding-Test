/// Custom Ensemble Business Operation for outputting the longest palindrome results
Class src.Hosts.PalindromeOperation Extends Ens.BusinessOperation
{
  Parameter ADAPTER = "EnsLib.File.OutboundAdapter";
  
  Property FilePath = "C:/index/";
  
  Parameter INVOCATION = "Queue";
  
  Method writeToFile(pRequest as %String, pResponse as Ens.StringResponse)
  { 
    set st = ..PutString("outFile.txt,pRequest)
  
  }
}
