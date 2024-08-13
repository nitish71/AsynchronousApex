//Count the cases created through various origin
public class CountCaseOriginAug13 {
    
    @future
    public static void countOriginOfCases(List<ID> IDs){
        
        List<Account> accList = [SELECT ID, Cases_Through_Email__c ,Cases_Through_Phone__c , Cases_Through_Web__c, 
                                 (SELECT ID, Origin From Cases) FROM Account WHERE ID IN : IDs];
        
        for(Account acc : accList){
            integer Email = 0, Phone = 0, Web = 0;
            
            for(Case cse : acc.Cases){
                if(cse.Origin == 'Email'){
                    Email++;
                }else if (cse.Origin == 'Phone'){
                    Phone++;
                }else if(cse.Origin == 'Web'){
                    Web++;
                }
            }
            
            acc.Cases_Through_Email__c = Email;
            acc.Cases_Through_Phone__c = Phone;
            acc.Cases_Through_Web__c = Web;
            
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    
}
