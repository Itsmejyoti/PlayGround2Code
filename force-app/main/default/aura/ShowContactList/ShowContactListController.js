({
    doInit : function(component, event, helper)
    {
        var action =component.get("c.getContacts");
        action.setCallback(this, function(data)
                           {component.set("v.contactList",data.getReturnValue());});       
        
        $A.enqueueAction(action);
    },
    delete : function(component, event, helper) {        
    if(confirm('Are you sure?'))
    helper.deleteAccount(component, event);        
},
 view : function(component, event, helper) {
    alert(event.target.id);
    component.set("v.isEdit",false);
    component.set("v.viewConId",event.target.id);
    // console.log('id:'+);
    component.set("v.isView",true);
    
},
    edit : function(component, event, helper) {
        alert(event.target.id);
        component.set("v.isView",false);
        component.set("v.isEdit",true);
        console.log('Edit record ID..'+event.target.id);
        component.set("v.editConId",event.target.id);
        component.set("v.viewConId",event.target.id);
        
        
    },
        save : function(component, event, helper) {
        try {
		component.find("edit").get("e.recordSave").fire();
        }catch (e) {
    		console.log(e);
  			}
        location.reload();// This will refresh the app to get the latest updated data.        
    },
})