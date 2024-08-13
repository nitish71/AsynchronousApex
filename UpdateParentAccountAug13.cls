public class UpdateParentAccount implements Queueable{
    private List<Account> accList;
    private Id parentAccId;
    
    //Constructor
    public UpdateParentAccount(List<Account> accRecords, Id accId){   
        accList = accRecords;
        parentAccId = accId;
    }
   
    public void execute(QueueableContext ct){
        for(Account acc : accList){
            acc.ParentId = parentAccId;
        }
        update accList;
    }
}
