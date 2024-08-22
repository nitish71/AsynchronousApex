//Future method to count contacts on each Account.

public class ContactCounterFutureMethod {
    
    public static void countContact(List<ID> accID){
        
        List<Account> accList = [SELECT ID ,(SELECT ID FROM Contacts) FROM Account WHERE ID IN : accID];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.Contacts.size();
                system.debug('Total Contacts...'+ acc.Contacts.size());
            }
            
            update accList;
        }
        
    }
    
}
