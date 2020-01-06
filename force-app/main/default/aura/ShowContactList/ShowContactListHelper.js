({
	helperMethod : function()
    {
		
	},
  deleteAccount : function(component, event) {
        console.log('in delete accocontactunt helper method.');
        var action = component.get("c.delteContactById");
        action.setParams({conId:event.target.id});
        action.setCallback(this, function(response) {
        	component.set("v.contactList",response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})