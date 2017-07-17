/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function validateNull(x){
    //    alert("Validating for Null");
    if(x.value.length<=0||x.value==""||x.value==null){
        alert("Value required");
        x.select();
        return false;
    }
    return true;
}
function validateSelect(x,msg){
    if(x.value==-1){
        alert(msg);
        x.focus();
        return false;
    }
    return true;
}
function validateRadio(x){
    if(!x.checked){
        return false;
    }
    return true;
}
function validateNumber(x){
    var patt = /\D/g;
    if(!validateNull(x)){
        return false;
    }
    else if(patt.test(x.value)){
        alert("Number required");
        x.select();
        return false;
    }
    return true;
}
function validate_email(field,alerttxt)
{
    with (field)
    {
        apos=value.indexOf("@");
        dotpos=value.lastIndexOf(".");
        if (apos<1||dotpos-apos<3) 
        {
            alert(alerttxt);
            return false;
        }
        else {
            return true;
        }
        }
}
function validate_name(x){
    var str=x.value;
    var pat=/\W/g;
    var pat1=/\d/g;
    var pat2=/_/g;
    if(!validateNull(x)){
        return false;
    }else if(pat.test(str))  {
        x.select();
        alert("Special Characters Found...!");
        return false;
    }else if(pat1.test(str))    {
        x.select();
        alert("Numbers Not Allowed...!")
        return false;
    }else if(pat2.test(str))    {
        x.select();
        alert("Underscores not allowed...!")
        return false;
    }
    else {
        return true;
    }
}