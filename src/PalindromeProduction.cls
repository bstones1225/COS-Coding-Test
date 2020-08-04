// Ensemble Production that reads input, finds the longest palidromes, and outputs the results
// Should contain instances of each of the Palidrome business hosts (Service, Process, Operation)
Class src.PalindromeProduction Extends Ens.Production
{
XData ProductionDefinition
{
<Production Name="src.PalindromeProduction">
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="src.Hosts.PalindromeService" 
        ClassName="src.Hosts.PalindromeService" 
        PoolSize="1" Enabled="true" Foreground="false" InactivityTimeout="0">
  </Item>
  <Item Name="src.Hosts.PalindromeProcess" 
        ClassName="src.Hosts.PalindromeProcess" 
        PoolSize="1" Enabled="true" Foreground="false" InactivityTimeout="0">
  </Item>
  <Item Name="src.Hosts.PalindromeOperation" 
        ClassName="src.Hosts.PalindromeOperation" 
        PoolSize="1" Enabled="true" Foreground="false" InactivityTimeout="0">
  </Item>
</Production>
}
