public class ContactCounterAug13 {
    
    @Future
    public static void countContacts(List<ID> accID){
        
        List<Account> accList = new List<Account>();
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.Contacts.size();
            }
            update accList;
        }
        
    }
    
}
