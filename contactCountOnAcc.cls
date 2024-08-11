//write a future method to count number of contacts related to it and store it into Total Contact fields.
    
    @future
    
    public static void contactCountOnAcc(List<ID> accID){
        
        List<Account> accList = [SELECT ID, (SELECT ID FROM Contacts) FROM Account WHERE ID IN : accID];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contacts__c  = acc.Contacts.size();
            }
            
            update accList;
        }
    }
