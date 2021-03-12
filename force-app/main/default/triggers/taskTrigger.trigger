trigger taskTrigger on Task (After Insert) {
     //Activitys preset callout
    if(Trigger.isafter && Trigger.isInsert){
         TaskTriggerHandler.crmActivitysPreset(Trigger.newMap);
    }
    if(Trigger.isAfter && Trigger.isInsert){ 
        set<string> huntIds = new set<string>();
        set<string> tskIds = new set<string>();
        
        for(task tsk : trigger.new){
            if(tsk.WhatId !=Null){
                if(tsk.WhatId.getSObjectType().getDescribe().getName()=='Hunt_List__c')
                {
                    tskIds.add(tsk.id);
                    huntIds.add(tsk.whatId);    
                }
            }
        }
        
        if(tskIds.size() > 0){
        
            TaskTriggerHandler.linkContactFutureMethod(tskIds,huntIds);
        }       
       // activityTriggerHandler.taskApi(trigger.new);    
        
        
        
    }

}