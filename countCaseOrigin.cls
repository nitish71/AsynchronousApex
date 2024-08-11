//Future method to count how many cases created through Web, Email and Phone.
    @future
    public static void countCaseOrigin(List<ID> accID){
        
        List<Account> accList = [SELECT ID, Cases_Through_Email__c, Cases_Through_Phone__c, Cases_Through_Web__c ,
                                 (SELECT ID, ORIGIN FROM Cases) FROM Account WHERE ID IN : accID];
        
        for(Account acc : accList){
            integer Email = 0, Web = 0, Phone = 0;
            
            for(Case c : acc.Cases){
                if(c.ORIGIN == 'Email'){
                    Email++;
                }else if(c.ORIGIN == 'Phone'){
                    Phone++;
                }else{
                    Web++;
                }
            }
            
            acc.Cases_Through_Email__c	 = Email;
            acc.Cases_Through_Phone__c  = Phone;
            acc.Cases_Through_Web__c  = Web;
        }
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
