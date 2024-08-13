//Write a batch to update Accounts billing address to mailing address on contacts.
public class BatchApex implements Database.Batchable<sObject>, Database.Stateful {
    //instance memeber to retain instance across transaction
    public integer recordsProcessed = 0;
    public Database.queryLocator start(Database.BatchableCotext bc){
        return Database.getQueryLocator('SELECT ID, BillingStreet, BillingCity, BillingState, BillingPostalCode,'+
                                        '(SELECT ID, MailingStreet, MailingCity, MailingState, MailingPostalCode FROM Contacts)'+
                                        'FROM Account WHERE BillingCountry = \'USA\'');
        
    }
    
    Public void execute(Database.BatchableContext bc, List<Account> accList){
        //process each batch of records
        List<Contact> contacts = new List<Contact>();
        For(Account acc : accList){
            for(Contact con : Account.contacts){
                con.MailingCity = acc.BillingCity;
                con.MailingStreet = acc.BillingStreet;
                con.MailingState = acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                
                contacts.add(con);
                //increment the records memeber counter
                recordsProcessed = recordsProcessed+1;
            }
        }
        update contacts;
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug('Record processed '+ recordsProcessed);
    }
}
