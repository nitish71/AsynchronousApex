//a future method to count Cases on Account
    @future
    public static void countCaseOnAcc(List<ID> accID){
        List<Account> accList = [SELECT ID, (SELECT ID FROM Cases) FROM Account WHERE ID IN : accID];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Cases__c = acc.Cases.size();
            }
            
            Update accList;
        }
    }
