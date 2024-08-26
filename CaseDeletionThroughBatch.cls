//write method to delete case created though Web
public class CaseDeletionThroughBatch implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            [SELECT ID FROM Case WHERE Origin = 'Web']
        );
        
        
    }
    
    public void execute(Database.BatchableContext bc, List<Case> caseList){
        try{
            delete caseList;
        } catch(Exception ex){
            system.debug('Error deleting case '+ ex.getMessage());
        }
    }
    
    //define the finish method after all the batches finished.
    public void finish(Database.BatchableContext bc){
        system.debug('Batch processing finished.');
    }

}
