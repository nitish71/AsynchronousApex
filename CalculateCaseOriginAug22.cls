//Write a method to calculate the case origin.
public class CalculateCaseOriginAug22 {
    
    @future
    public static void countCaseOrigin(List<ID> ids){
        
        List<Account> accList = [SELECT ID, Cases_Through_Email__c,Cases_Through_Phone__c ,Cases_Through_Web__c	, 
                                 (SELECT ID, Origin FROM Cases) FROM Account WHERE ID IN : ids];
        
        if(!accList.isEmpty()){
            
            for(Account acc : accList){
                integer Email = 0, Phone = 0, Web = 0;
                for(Case c : acc.Cases){
                    if(c.Origin == 'Email'){
                        Email++;
                    }else if(c.Origin == 'Phone'){
                        Phone++;
                    }else if(c.Origin == 'Web'){
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

}
