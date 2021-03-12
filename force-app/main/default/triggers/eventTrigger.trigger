trigger eventTrigger on Event (before insert,after insert,after update) {
    
     // Activitys preset callout   
     if(Trigger.isafter && Trigger.isInsert){
         EventTriggerHandler.crmActivitysPreset(Trigger.newMap);
     }
     //End callout Activitys preset callout 
     
        if(Trigger.isBefore && Trigger.isInsert){
            eventTriggerHandler.beforeinsert(Trigger.new);
        }
        
       // if(Trigger.isAfter && Trigger.isInsert && RecursiveTriggerHandler.linkContact){
          if(Trigger.isAfter && Trigger.isInsert){ 
            set<string> evtIds = new set<string>();
            set<string> huntIds = new set<string>();
            
            for(event evt : trigger.new){
                if(evt.WhatId !=Null){
                    if(evt.WhatId.getSObjectType().getDescribe().getName()=='Hunt_List__c')
                    {
            
                        evtIds.add(evt.Id);
                        huntIds.add(evt.whatId);    
                    }
                }
            }
            
            if(evtIds.size() > 0){
            
                eventTriggerHandler.linkContactFutureMethod(evtIds,huntIds);
            }

        }
    

}