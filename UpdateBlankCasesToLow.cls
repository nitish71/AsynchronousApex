//Batch to update all the cases priority to Low when its blank.
public class UpdateBlankCasesToLow implements Database.Batchable<sObject>, Database.stateful{
    
    //instance memeber to retain memebers aross the transaction
    public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.Batchable Context bc){
        return Database.getQueryLocator('SELECT ID, Priority FROM Case WHERE Priority = NULL');
    }
    
    public void execute(Database.BatchableContext bc, List<Case> caseList){
        
        //process each batch of records
        for(Case c : caseList){
            c.Priority = 'Low';
            
        }
        //increment the instance member
        recordsProcessed = recordsProcessed+1;
        update caseList;
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug(recordsProcessed +'records has been processed!');
    }
    
    
}
