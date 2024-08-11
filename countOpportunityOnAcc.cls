//a method to count opportunity number of Account
    @future
    public static void countOpportunityOnAcc(List<ID> accID){
        List<Account> accList = [SELECT ID, (SELECT ID FROM Opportunities) FROM Account WHERE ID IN :accID];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Opportunity__c = acc.Opportunities.size();
            }
            
            Update accList;
        }
    }
    
