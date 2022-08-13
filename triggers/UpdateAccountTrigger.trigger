trigger UpdateAccountTrigger on Account (after insert) {
	if(Trigger.isAfter && Trigger.isInsert){
        	//this kind of coding is called bulkification of trigger as it can work with one record or multiple records
        	List<Contact> conListInsert = new List<Contact>(); 
        	for(Account acc: Trigger.new){
            		Contact con = new Contact();  //Create Contact instance
            		con.LastName = acc.Name;
            		con.AccountId = acc.Id;	// for linking Account and Contact object so same Account Id need to pass to Contact.AccountId
            		conListInsert.add(con);
		}
        
       		 //Whenever you are inserting a list you definitely need to check size
       		 if(conListInsert.size() > 0){
            		INSERT conListInsert;  //Actual insert process of
                 //actual insert action in the condition to check
                 INSERT conListInsert;
        	}
    	}
}