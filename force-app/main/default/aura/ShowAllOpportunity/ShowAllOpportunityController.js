({
    doInit : function(component, event, helper) 
    {
        var action =component.get("c.getAllOpportunities");
        var recId= component.get("v.recordId");
        // alert(recId);
        action.setParams({"accId": recId});
        action.setCallback(this,function(data)
                           {
                               component.set("v.oppList",data.getReturnValue());
                           });
        $A.enqueueAction(action)
    },
    UpdateAccount : function(component,event,helper)
        {
        alert('I am In');
        var recId= component.get("v.recordId");
        component.set("v.oppId",event.target.id)
        var oppId=component.get("v.oppId");
        alert(oppId);
        var action =component.get("c.updateOppAccount");
        action.setParams({ "accId" :recId,
                          "oppId" : oppId});
        alert('after set parameteres');
        action.setCallback(this,function(data)
                           {
                               component.set("v.oppList",data.getReturnValue());
                           });       
        $A.enqueueAction(action)
        location.reload();
    },
})