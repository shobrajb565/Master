public class MedlienMergeContactServerController{


    public static void mergeContact(List<String> lstOfPreset,List<String> lstOfMedlien){
        if(!Test.isRunningTest()){ System.enqueueJob(new PresetServerMergeContactQueuebleJob (lstOfPreset)); }
        
        if(lstOfMedlien.size()>0 && !Test.isRunningTest()){ System.enqueueJob(new MedlienMergeContactsQueuebleJob (lstOfMedlien)); }
           
        
    }
}