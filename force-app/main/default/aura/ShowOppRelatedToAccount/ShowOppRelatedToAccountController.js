({
	doInit : function(component, event, helper) 
    {
		var recId= component.get("v.recordId");
        var action =component.get("c.getOpportunities");
        action.setParams({"accId" : recId});
        //alert(recId);
        action.setCallback(this,function(data){component.set("v.oppList",data.getReturnValue());});
        $A.enqueueAction(action)
	},
})