List<Account> accList = [SELECT ID FROM Account];
List<ID> accID = new List<ID>();

for(Account acc : accList){
    accID.add(acc.ID);
}

ContactCounterFutureMethod.countContact(accID);
