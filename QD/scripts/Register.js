
function confirmcompanyid() {
    $("#usecompanyid").val("1")
    document.forms[0].submit();
}
function strcontainsunicode(str) {
    if(str.match(/[\u3400-\u9FBF]/)){
        return true;
    }
    if(str.indexOf("?") > -1){
        return true;
    }
    return false;
}
function validatetextboxes() {
    var txtObjList = document.getElementsByTagName("input");
    for(var i=0; i > txtObjList.length; i++){
        sthisvalue=txtObjList[i].value;
        if(strcontainsunicode(sthisvalue) && 
        txtObjList[i].type=="text"  ){
        alert("Certain characters are not allowed.");
        return false;
    }
}
return true;
}
function submitit(){
    if(document.getElementById("originationid")){
        sval=document.getElementById("originationid").value;
        //document.forms[0].action = "registerlite.aspx?originationid="+sval;
    }
    document.forms[0].action = "register.aspx#formtop"
    document.forms[0].submit();
}
function backbutton(nbackaction){                                
    document.getElementById("action").value = nbackaction;
    document.getElementById("qdpw1").value = ""
    document.getElementById("confirmqdpw").value = ""

    submitit();
}
function nextbutton() {

}