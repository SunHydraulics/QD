$(document).ready(function(){
    $(".menusubitem3").click(function () {
        surl = $(this).attr("thisurl");
        $('#configiframe').attr('src', surl);
        $('#tablecartmenu').hide();
        $('.spancart').hide();
        $('#configiframe').show("slow");
    });
    $(".specmenuitem").click(function () {
        $('#specpopup').removeClass('active');
        $('.popup-overlay').removeClass('active');
        var specid = $(this).attr("id");
        $('#thisval').val(specid);
       // document.getElementById("thisval").value = newqty;
       // document.getElementById("thisid").value = itemid;
        document.getElementById("thisctypeid").value = '2';
        $('#action').val('newspec');
        configsubmitit();
    });
    $(".itemwrapper").click(function () {
        $(".menusubitem3").hide();
        $(this).children(".menusubitem3").show();
    });
   // $(".stampinput").blur(function () {
     //   if (this.value != this.defaultValue) {
       //     var thisid = $(this).attr("id");
         //   $('#sthisid').val(thisid);
      //      var thisval = $(this).val();
       //     $('#thisval').val(thisval);
       //     $('#action').val('editstamp');
        //    configsubmitit();
       // }
    //});
    $("#cartgo").click(function () {
        scart=$('#cartpartno').val();
        if(scart.length < 4){
            alert("Enter at least 4 letters");
            return;
        }
        if (isNaN(scart.substr(1, 1)) == false) {
            $('#thisval').val(scart);
            $('#action').val('newcustomcart');
            submitit();
            return;
        };

        surl = $(this).attr("thisurl")+scart;
        $('#configiframe').attr('src',surl);
        $('#tablecartmenu').hide();
        $('.spancart').hide();
        $('#configiframe').show("slow");

    });

    $(".qtyinput").focus(function () { $(this).select(); });


})
function editqty(othis, oldval, itemid, ctypeid) {
    var newqty = $(othis).val();
    if (newqty == '0') {
        if (confirm("This will remove the item from the configuration. Continue?") == false) {
            $(othis).val(oldval);
            return false;
        }
    }

    document.getElementById("thisval").value = newqty;
    document.getElementById("thisid").value = itemid;
    document.getElementById("thisctypeid").value = ctypeid;
    $('#action').val('editqty');
    configsubmitit();
}
function isAlphaKey(e) {
    clearmessage();
    var k;
    document.all ? k = e.keyCode : k = e.which;

    nok= ((k > 64 && k < 91) 
  ||(k > 96 && k < 123) 
  ||(k > 46 && k < 58) 
  || k == 45);
    if(k==" "){nok=false}
    if (nok == false) {
        showstickymessage("#configanchor", "Only use letters, numerals and dashes", 1);
    }
    return nok;
}
function configsubmitit() {
    var surl = window.location.href;
    if (surl.indexOf("configanchor")==-1){
        surl += "#configanchor";
    }
    document.forms[0].action = surl;
    document.forms[0].submit();
}
function validatestamping() {
    alert("All stamping must be unique before creating the schematic.")
    return false;
}
function finddupestamp(isnotify) {
    clearmessage();
    var isDuplicate = false;
    if (isnotify==""){isnotify='1'}
    $("input[id^='stamp']").each(function (i, el1) {
        var current_val = $(el1).val();
        $(el1).css("background-color", "white");
        if (current_val == "") {
            isDuplicate = true;
            $(el1).css("background-color", "yellow");
            return;
        }
        if (current_val != "") {
            $("input[id^='stamp']").each(function (i, el2) {
                if ($(el2).val() == current_val && $(el1).attr("id") != $(el2).attr("id")) {
                    isDuplicate = true;
                    $(el2).css("background-color", "yellow");
                    $(el1).css("background-color", "yellow");
                    return;
                }
            });
        }
    });

    if (isDuplicate) {
        if (isnotify == '1') {
            showstickymessage("#configanchor", "Repair the duplicate or missing stamping, then try again.", 1);

            return false
        }
        return true;
    } else {
        return true;
    }
}