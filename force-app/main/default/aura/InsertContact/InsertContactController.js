({
    handleClick : function (cmp, event, helper)
    {
        //alert("You clicked: " + event.getSource().get("v.label"));
        var newCon=cmp.get("v.newContact");
        var action = cmp.get("c.insertContact");
        action.setParams({
        "con": newCon
    });

    action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
               alert("hello from here"+name);
            }
        });
    $A.enqueueAction(action)

       // console.log('newContact:'+newContact);
    }
});