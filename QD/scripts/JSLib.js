var xmlhttp;
var formatforprint;
$(document).ready(function () {
    $("#imgformatforprint").click(function () {
        formatforprint("1");
    });

    $("#submittoar").click(function () {
        $('#action').val('submittoar');
        showstickymessage("#submittoar", "Please wait. Do not interrupt the page during this process...", 10000);
        document.forms[0].submit();
    });
 
    $('#qdshowdetail').click(function(){
        $('.backdrop, .qddetail').animate({ 'opacity': '.50' }, 300, 'linear');
        $('.qddetail').animate({'opacity':'1.00'}, 300, 'linear');
        $('.backdrop, .qddetail').css('display', 'block');
        $('#qdshowdetail').hide();
        return false;

    });

    $('.close').click(function(){
        close_box();
    });

    $('.backdrop').click(function () {
        close_box();
    });

    function close_box(){
        $('.backdrop, .qddetail').animate({'opacity':'0'}, 300, 'linear', function(){
            $('.backdrop, .qddetail,.trackingeditform').css('display', 'none');
            $('#qdshowdetail').show();
        });
    }
    function cmdsavetd(){
        alert("here");
    }


    $('.trackingeditbutton').click(function () {
        var xo = window.pageXOffset+50;
        var yo = window.pageYOffset+50;
        $('.backdrop').css('height', '2000px');
        $(this).parents("td:first").append($(".trackingeditform"));
        //$(".trackingeditform").scrollTop(200);
        // $('.trackingeditform').css('left',xo+'px');
        // $('.trackingeditform').css('top', yo)+'px';
        
        $('.trackingeditform').animate({ 'opacity': '.50' }, 300, 'linear');
        $('.trackingeditform').animate({ 'opacity': '1.00' }, 300, 'linear');
        $('.trackingeditform').css('display', 'block');
        return false;
    });
    $('#cmdtrackingexcel').click(function () {
        if(confirm("This will open an Excel spreadsheet based on the current filter options. Continue?")==false){return}
        var svars = "status:" + $("input[type='radio'][name='data_statusoption']:checked").val()+";";
        if ($('#data_distname').val() > " ") { svars += "dist:" + $('#data_distname').val() + ";" }
        if ($('#data_custname').val() > " ") { svars += "cust:" + $('#data_custname').val() + ";" }
        if ($('#data_spname').val() > " ") { svars += "sp:" + $('#data_spname').val() + ";" }
        if ($('#data_partno').val() > " ") { svars += "partno:" + $('#data_partno').val() + ";" }
        var surl = "qdpricemetricsexcel.aspx?vars=" + svars;
        var nwin = window.open(surl,
            'trackingexcel', 'menubar=1,toolbar=1,scrollbars=1,height=680,width=540,left=30,top=30,resizable=yes');
        nwin.focus();
    });
 
})

formatforprint = function (nprompt) {
    $('.site--nav').toggle();
    $('.languages').toggle();
    $('.divlanglist').toggle();
    $('.qdsummary').toggle();
    $('#adminsection').toggle();
    $('#imgformatforprint').toggle();
    if (nprompt == "1") {
        alert("Send to print, then refresh the page.")
        window.print();
    }
}
function savetd() {
    var squoteid = $('#tefquoteid').val();
    var sofferdate = $('#data_offerdate').val();
    var sfollowdate = $('#data_followdate').val();
    var sstatusid = $('#data_pricemetricsstatusid').val();
    var sstatusname = $('#data_pricemetricsstatusid :selected').text();
    var scomments = $('#data_pricecomments').text();
    var sparm = "quoteid:"
    sparm = sparm + $('#tefquoteid').val()+";";
    sparm = sparm + "offerdate:" + sofferdate + ";";
    sparm = sparm + "followdate:" + sfollowdate + ";";
    sparm = sparm + "statusid:" + sstatusid + ";";
    sparm = sparm + "comments:" + scomments + ";";
    sparm = sparm.replace("'", "");
    $('#spanstatus' + squoteid).text(sstatusname);
    $('#spanod' + squoteid).text(sofferdate);
    $('#spanfd' + squoteid).text(sfollowdate);
    $('#spancomm' + squoteid).text(scomments);
    //$('#td' + squoteid).html("<span class='trackinggridline2'>Updated. Changes will display with next refresh.</span>");
    $('.backdrop, .qddetail').animate({ 'opacity': '0' }, 300, 'linear', function () {
        $('.backdrop, .qddetail,.trackingeditform').css('display', 'none');
        $('#qdshowdetail').show();
    });
    loadXMLDoc("qd_savetrackingdata", sparm);
}


function loadXMLDoc(srequest, sparm1, sobj) {
    xmlhttp = null;
    if (typeof sparm1 === 'object') {
        sthistext = "objid:" + $(sparm1).attr("id") + ";";
        sthistext += "value:" + $(sparm1).val() + ";";
        sthistext += getqstring();
        sparm1 = sthistext;
    }
	if (window.XMLHttpRequest){   // code for IE7, Firefox, Opera, etc.
			xmlhttp=new XMLHttpRequest();
	}
	else if (window.ActiveXObject){   // code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
		if (xmlhttp != null) {  //xmlhttp.onreadystatechange=state_Change;
			xmlhttp.onreadystatechange = function () {
			    if (xmlhttp.readyState == 4) {// 4 = "loaded"
			        if (xmlhttp.status == 200) {// 200 = "OK"
			            sthistext = "";
			            sthistext = xmlhttp.responseText;
			            if (srequest == "qd_manifoldselect") {
			                configsubmitit();
			                return false;
			            }
			            if (srequest == "qd_mountinghole") {
			                submititanchor("mountingholeanchor");
			                return false;
			            } 
			            if (sthistext > " ") {
			                try {//Internet Explorer
			                    var xmlDoc = new ActiveXObject("microsoft.xmldom")
			                    xmlDoc.async = "false";
			                    xmlDoc.loadXML(sthistext);
			                }
			                catch (e) {
			                    try { //Firefox, Mozilla, Opera, etc.
			                        //window.alert("Failed due to the following problem:  " + e.description); 
			                        //if (window.alert(navigator.appName) == "Microsoft Internet Explorer") {
			                        //	serrortext = "Please report the following problem:  " + e.description;
			                        //	window.alert(serrortext);
			                        //	return;
			                        //}
			                        parser = new DOMParser();
			                        var xmlDoc = parser.parseFromString(sthistext, "text/xml");
			                    }
			                    catch (e) {
			                        alert(e.message);
			                        return;
			                    }
			                }

			                if (srequest == "getquoteid") {
			                    showmessage("Please wait...", 1)
			                    serror = xmlDoc.childNodes[0].getAttribute("error")
			                    if (serror == "0") {
			                        sid = xmlDoc.childNodes[0].getAttribute("id")
			                        if (sobj == "") { sobj = "quote.aspx" }
			                        document.getElementById("frmmain").action = sobj + "?page=2&quoteid=" + sid;
			                        document.getElementById("frmmain").submit();
			                    }
			                    if (serror == "1") {
			                        serrortext = xmlDoc.childNodes[0].getAttribute("text")
			                        showmessage(serrortext, 1)
			                    }
			                }
			                if (srequest == "getpricing") {
			                    document.getElementById("divpricingsection").style.display = "";

			                    document.getElementById("divpricingsection").innerHTML = sthistext;
			                    clearmessage();
			                }
			                if (srequest == "gethorse") {
			                    document.getElementById("divhorse").innerHTML = sthistext;
			                    clearmessage();
			                }
			                if (srequest == "showweights") {
			                    document.getElementById("divweights").innerHTML = sthistext;
			                    clearmessage();
			                }
			                if (srequest == "servermonitorstats") {
			                    document.getElementById("divservermonitorstats").innerHTML = sthistext;
			                    clearmessage();
			                }
			                if (srequest == "helpedit") {
			                    document.getElementById("divhelpedit").innerHTML = sthistext;
			                }
			                if (srequest == "qd_qdtrackingeditform") {
			                    document.getElementById("divqdtrackingeditform").innerHTML = sthistext;
			                }
			                if (srequest == "qd_findschematic") {
			                    document.getElementById("divrevlist").innerHTML = sthistext;
			                    document.getElementById("viewschematic").style.display = "none";
			                    document.getElementById("divcopyto").style.display = "none";
			                    if (sthistext.indexOf("<ok/") > 0) {
			                        document.getElementById("viewschematic").style.display = "block";
			                        document.getElementById("divcopyto").style.display = "block";
                                }
			                }
			                if (srequest == "showcontactinfo") {
			                    sthisobj = document.getElementById("divshowcontactinfo");
			                    sthisobj.style.display = "block";
			                    sthisobj.innerHTML = sthistext;

			                }
			                if (srequest == "getsundetail") {
			                    document.getElementById("divsundetail").style.display = "";
			                    document.getElementById("divsundetail").innerHTML = sthistext;
			                    clearmessage();
			                }
			                if (srequest == "getstatquotes") {
			                    document.getElementById("divquotesection").style.display = "";
			                    document.getElementById("divquotesection").innerHTML = sthistext;
			                    clearmessage();
			                }
			                if (srequest == "servermonitorstats") {
			                    document.getElementById("divservermonitorstats").style.display = "";
			                    document.getElementById("divservermonitorstats").innerHTML = sthistext;
			                }
			                if (srequest == "getorificeparts") {
			                    document.getElementById("roworificeparts").style.display = "block";
			                    nid = xmlDoc.childNodes[0].getAttribute("ncount");
			                    var intLength;
			                    slobj = document.getElementById("data_ppartid")
			                    slobj.options.length = 0;
			                    for (var x = 0; x < nid; x++) {
			                        intLength = slobj.options.length;
			                        sid = xmlDoc.childNodes[0].childNodes(x).getAttribute("id");
			                        spartno = xmlDoc.childNodes[0].childNodes(x).getAttribute("partno");
			                        slobj.options[x] = new Option(spartno, sid);
			                    }

			                    //sid = xmlDoc.childNodes[0].childNodes(1).getAttribute("partno");
			                    showmessage("Select an orifice part number. (Size is indicated by the final 3 characters of the part number.)");
			                }
			                if (srequest == "validatebasiccartridge") {
			                    document.getElementById("cmdapply").disabled = true;
			                    sstr = xmlDoc.childNodes[0].getAttribute("text")
			                    serror = xmlDoc.childNodes[0].getAttribute("error")
			                    if (serror == "0") {
			                        document.getElementById("cmdapply").disabled = false;
			                    }
			                    showmessage(sstr, serror);
			                }
			                if (srequest == "validatestamp") {
			                    sstr = xmlDoc.childNodes[0].getAttribute("text")
			                    serror = xmlDoc.childNodes[0].getAttribute("error")
			                    if (serror == "0") {
			                        document.getElementById("maysave").value = "1";
			                        document.getElementById("goback").value = "1";
			                    }
			                    if (serror == "1") {
			                        document.getElementById("maysave").value = "0";
			                    }
			                    showmessage(sstr, serror);
			                }

			                if (srequest == "validatecartridge") {
			                    document.getElementById("maysave").value = "1";
			                    serrmess = xmlDoc.childNodes[0].getAttribute("errortext");
			                    ssetting = xmlDoc.childNodes[0].getAttribute("setting");
			                    if (serrmess > " ") {
			                        document.getElementById("maysave").value = "0";
			                        document.getElementById("rowqty").style.display = "none";
			                        document.getElementById("rowcavity").style.display = "none";
			                        showmessage(serrmess, 1);
			                    }
			                    if (serrmess == null) {
			                        serrmess = "OK";
			                        document.getElementById("rowqty").style.display = "";
			                        document.getElementById("rowcavity").style.display = "";
			                        showmessage(serrmess, 0);
			                    }
			                    slobj = document.getElementById("data_unit")
			                    slobj.options.length = 0;
			                    sstd = xmlDoc.childNodes[0].getAttribute("stdunit")
			                    smet = xmlDoc.childNodes[0].getAttribute("metricunit")
			                    smissingsetting = xmlDoc.childNodes[0].getAttribute("missingsetting")
			                    slobj.options[0] = new Option('', '');
			                    slobj.options[1] = new Option(sstd, sstd);
			                    slobj.options[2] = new Option(smet, smet);
			                    slobj.value = xmlDoc.childNodes[0].getAttribute("unit")
			                    surange = xmlDoc.childNodes[0].getAttribute("unitrange");
			                    nmaybeset = xmlDoc.childNodes[0].getAttribute("maybeset");
			                    sstdsetting = xmlDoc.childNodes[0].getAttribute("stdsetting");
			                    settingrequired = xmlDoc.childNodes[0].getAttribute("issettingrequired")
			                    document.getElementById("rowsetting").style.display = "";
			                    //document.getElementById("rowsettingrange").style.display = "";
			                    document.getElementById("tblsymbol").style.display = "";
			                    ssymbol = xmlDoc.childNodes[0].getAttribute("symbol")
			                    document.getElementById("imgcartsymbol").src = ssymbol;
			                    if (serrmess == null) {
			                        if (ssetting == "") {
			                            document.getElementById("data_setting").value = "";
			                            document.getElementById("data_unit").value = "";
			                        }
			                    }
			                    if (nmaybeset == "0") {
			                        document.getElementById("data_setting").value = "";
			                        document.getElementById("data_unit").value = "";
			                        document.getElementById("rowsetting").style.display = "none";
			                        //document.getElementById("rowsettingrange").style.display = "none";
			                        document.getElementById("data_cqty").focus();
			                    }
			                    if (nmaybeset == "1") {
			                        document.getElementById("data_setting").focus();
			                        document.getElementById("divstandardtext").style.display = "";
			                    }
			                    if (smissingsetting == "1") {
			                        document.getElementById("cchangeflag").value = "1";
			                        //document.getElementById("data_setting").value=sstdsetting;
			                        showmessage("A setting is required", 1);
			                    }
			                    if (nmaybeset == "0" || settingrequired == "1") {
			                        document.getElementById("divstandardtext").style.display = "none";
			                        document.getElementById("spansettinglabel").innerHTML = ""
			                    }
			                    if (settingrequired == "0") {
			                        document.getElementById("spansettinglabel").innerHTML = "Special:"
			                    }
			                    document.getElementById("divcavityname").innerHTML = xmlDoc.childNodes[0].getAttribute("cavity");
			                    document.getElementById("divstdsetting").innerHTML = xmlDoc.childNodes[0].getAttribute("unitrange");
			                    document.getElementById("divmetricsetting").innerHTML = xmlDoc.childNodes[0].getAttribute("metricunitrange");
			                    document.getElementById("divreqmessage").innerHTML = xmlDoc.childNodes[0].getAttribute("reqmessage");
			                    document.getElementById("divstandardtext").innerHTML = xmlDoc.childNodes[0].getAttribute("standardtext");
			                    document.getElementById("divsettingtext1").innerHTML = xmlDoc.childNodes[0].getAttribute("settingtext1");
			                    document.getElementById("divsettingtext2").innerHTML = xmlDoc.childNodes[0].getAttribute("settingtext2");
			                    if (ssetting == "") {
			                        document.getElementById("divstandardtext").style.className = "settingselected";
			                        document.getElementById("divsettingbox").style.className = "settingnotselected";
			                    }
			                    else {
			                        document.getElementById("divstandardtext").className = "settingnotselected";
			                        document.getElementById("divsettingbox").className = "settingselected";
			                    }
			                }

			            }
			        }
			        else {
			            alert("Problem retrieving XML data:" + xmlhttp.statusText);
			        }
			    }
			}
			url = "xmlrequest.aspx?request=" + srequest + "&parm1=" + sparm1
			xmlhttp.open("GET", url, true);
		xmlhttp.send(null);
	}
	else{
		alert("Your browser does not support XMLHTTP.");
	}
}
function nthiskey(e)	{
	var keynum;
	var keychar;
	var numcheck;if(window.event) // IE
		{
			keynum = e.keyCode;
		}
	else if(e.which) // Netscape/Firefox/Opera
		{
			keynum = e.which;
		}
	return keynum;
}
function genericlogin()	{	
	document.getElementById("txtusername").value="testuser";
	document.getElementById("txtpassword").value="";
}
function clearmessage(){
    $("#screenmessage").hide();
}
function showmessage(smessage, isalert){
	with (document.getElementById("screenmessage")){
		innerHTML=smessage;
		style.background="#f2edfc";
		if(isalert=="1"){
			style.background="#ffff66";
		}
		style.display="";
	}	
}
function showstickymessage(sstickto,smessage,  nwait) {
    var pos = $(sstickto).position();
    var thisobj = $("#screenmessage");
    $("#screenmessage").css({ left: pos.left + "px", top: pos.top + "px" });
    $("#screenmessage").text(smessage);
    $("#screenmessage").show();
    var ndelay = 3000;
    if (nwait>ndelay){nwait=ndelay}
    if(sstickto=="#")
    $("#screenmessage").delay(ndelay).fadeOut("slow");
}

function autogrowtextarea(thisarea) {
	obox = document.getElementById(thisarea)
	if (typeof obox !== 'object') {return; }
	var adjustedHeight = obox.clientHeight;
	adjustedHeight = Math.max(obox.scrollHeight, adjustedHeight);
	if (adjustedHeight < 40) {adjustedHeight = 40;}
	obox.style.height = adjustedHeight + "px";
	obox.style.overflow = "hidden";
}
function showmovie(sobj, stitle){
	var scode = '<span class="title">'+stitle+'</span><br/>';
	var sagent=navigator.userAgent;
	var ismobile=sagent.match(/(iPad)|(iPhone)|(iPod)|(android)|(webOS)/i);
	var vtype=1;
	if(sobj.match(/.swf/gi)==".swf" ){
		vtype=0;
	}
	if(sagent.match(/firefox/gi)=="Firefox"){
		vtype=2;
	}
	if(ismobile > " "){
		vtype=3;
	}
 
	if (vtype==0){
		scode = scode + '<object> '+
		'<param name="movie" height="100%" width="100%" value="'+sobj+'"/> '+
		'<embed height="100%" width="100%" fullscreen="yes" src="'+sobj+'"/> '+
		'</object>' ;															
	}
	if (vtype==1){
		scode = scode + '<video autoplay> ' +
		'<source src="'+sobj+'" type="video/mp4"/> '+
		'<embed height="100%" width="100%" fullscreen="yes" src="'+sobj+'"/> '+
		'</video>' ;							
	}
	if (vtype==2){
			scode = scode + '<object> '+
			'<param name="movie" height="100%" width="100%" value="'+sobj+'"/> '+
			'<embed height="100%" width="100%" fullscreen="yes" src="'+sobj+'"/> '+
			'</object>' ;		
													
		}
	if (vtype==3){
			var nwin = window.open(sobj,
				'video' , 'menubar=1,toolbar=1,scrollbars=1,height=680,width=540,left=30,top=30,resizable=yes')
			nwin.focus();
			scode="";
													
		}
	document.getElementById("divmovie").style.display = "block";
	document.getElementById("divmovie").innerHTML = scode;
}

function showyoutubemovie(sid) {
	var ssrc = 'http://www.youtube.com/embed/'+sid;
	var shtml = '<iframe width="760" height="480" src="' + ssrc + '?rel=0" frameborder="0" allowfullscreen="true"></iframe>';
	vmobj = document.getElementById("divyoutubemovie")
	vmobj.innerHTML = shtml;

	vmobj.style.display = "";
}
function uli() {
    sun = document.getElementById("txtusername").value;
    spw = document.getElementById("txtpassword").value;
    if (document.getElementById("chkrememberme").checked == true) {
        setcookie("cusername", sun, 60);
        setcookie("cpwd", spw, 60);
    }
    else {
        setcookie("cusername", "", 60);
        setcookie("cpwd", "", 60);
    }
    if (sun == "" || spw == "") {
        alert("Enter your email address and password.")
        return
    }
    if (checkemail(sun) == false) {
        alert("That doesn't appear to be a valid email address.");
        return
    }
    document.getElementById("txtpassword").value = sha1Hash(spw);
    document.forms[0].submit();
}
function forgotpassword() {
    sun = document.getElementById("txtusername").value;
    if (sun == "") {

        alert("Enter your email address into the box, then click the Password link again.")
        return false;
    }
    if (checkemail(sun) == false) {
        alert("That doesn't appear to be a valid email address.");
        return
    }

    if (confirm("If you continue, an email will be sent to you with the information necessary to reset your password. Continue?") == false) {
        return
    }
    alert("Press OK, then close the Login page.");
    document.forms[0].action = "login.aspx?resetpwd=1&email=" + sun;
    document.forms[0].submit();
}
function setcookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getcookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}
function submitit(saction) {
    if (saction > " ") {
        document.forms[0].action = saction;
    }
    document.forms[0].submit();
}
function submititanchor(sanchor) {
    var surl = $(location).attr('href')
    var shash = $(location).attr('hash');
    surl = surl.replace(shash, "");
    surl += "#"+sanchor;

    document.forms[0].action = surl;
    document.forms[0].submit();
}

function showhideimg(sobj, sdiv){
    ssrc = sobj.src;
    if(ssrc.search("plus") > -1){
        ssrc=ssrc.replace("plus","minus")
        saction="";
    }
    else{
        saction="none";
        ssrc=ssrc.replace("minus","plus")
    }
    sobj.src = ssrc;
    sdiv.style.display=saction
}
function showhidediv(othis, sobj) {
    $(sobj).toggle();
    $(othis).removeClass();
    if ($(sobj).css('display') !== 'none') {
        $(othis).addClass("plusboxminus");
    }
    else {
        $(othis).addClass("plusbox");
    }
}
function showhidedetails(othis, odiv, sshow, shide) {
    var sdivclassname = odiv.className;
    if (sdivclassname.indexOf("open") > 0) {
        sdivclassname = sdivclassname.replace("open", "");
        sdivclassname = sdivclassname.trim();
        sthistext=sshow +" [+]";
    }
    else{
        sdivclassname += " open";
        sthistext = shide + " [-]";
    }
    odiv.className = sdivclassname;
    othis.innerText = sthistext;
    odiv.scrollIntoView();
}
function showhidewithtext(sshowtxt, shidetxt, nobj, ntxtobj) {
    $(nobj).toggle();
    var isVisible = $(nobj).is(":visible");
    $(ntxtobj).text(sshowtxt);
    if (isVisible == true) { $(ntxtobj).text(shidetxt); }
}
function searchtablepaginate(ndirection, nmax) {
    var nthispage = $("#thisrowgroup").prop("value");
    if ((ndirection == "-1" && nthispage == "1")
        ||
        (ndirection == "1" && nthispage >= (nmax*1))) {
        return;
    }
    var pobj = "#rowgroup" + nthispage;
    $(pobj).toggleClass("nodisplay");
    nthispage = (nthispage * 1) + ndirection;
    sdisplay = "Page " + nthispage + " of " + nmax;
    $("#pagemessage").text(sdisplay);
    $("#thisrowgroup").val(nthispage);
    pobj = "#rowgroup" + nthispage;
    $(pobj).toggleClass("nodisplay");
}
function getqstring() {
    return "querystring:"+
        window.location.href.slice(window.location.href.indexOf('?') + 1).split('&')+";";
}
function page1save(naction) {
    smessage="";
    clearmessage();
    var sstickto = "";
    if ($("#data_marketid").length) {
        if ($('#data_marketid').val() == '') {
            smessage = "Select a market code.";
            sstickto = '#data_marketid';
        }
    }
    if ($("#data_customerid").length) {
        if ($('#data_customerid').val() == '') {
            smessage = "Select a customer.";
            sstickto = '#data_customerid';
        }
    }
    if ($("#data_distributorid").length) {
        if ($('#data_distributorid').val() == '') {
            smessage = "Select a distributor.";
            sstickto = '#data_distributorid';
        }
    }
    if ($("#data_estannualusage").length) {
        if ($('#data_estannualusage').val() == '') {
            smessage = "Enter an estimated annual usage number.";
            sstickto = '#data_estannualusage';
        }
    }
    

    if (smessage > " ") {

        showstickymessage(sstickto, smessage, 1)
        $('html, body').animate({
            scrollTop: $('#formanchor').offset().top
        }, 400);

        return false;
    }
    if(naction==1){
        document.getElementById("data_action").value="createnewdesign";
    }
    if(naction==2){
        document.getElementById("data_action").value="page1save";
    }
    showmessage("Please wait...",1 );
    document.forms[0].submit();

}
function faceconadj(stype, nindex)
{
    if (stype == "c" || stype == 'p') {
         /* sobj = "#chkf" + stype + nindex;
        thisobj=$(sobj)
        if($("#lstmf").val() == nindex & stype == "c"){
            $(sobj).prop("checked", true);
        }
      
        childclass = ".facebox" + stype + nindex;
        childclasslabel = ".faceboxlabel" + stype + nindex;
        if ($(sobj).prop("checked")) {
            $(childclass).prop("checked", false);
            $(childclass).hide();
            $(childclasslabel).hide();
        }
        if ($(sobj).prop("checked")==false) {
            $(childclass).show();
            $(childclasslabel).show();
        }
        */
        $("#action").val("faceconst");
        submititanchor("facedesignationanchor");
    }
    if (stype == "m") {
       /* sobj = "#chkfc" + nindex;
        $(sobj).prop("checked", false);*/
        $("#action").val("faceconst");
        submititanchor("facedesignationanchor");
    }
}
function getplacementindex(circuitid) {
    var sum = 0;
    var arr = [ 1, 2, 4, 8, 16, 32 ];
    $.each(arr, function (index, value) {
        sindex = value;
        sobj = "#data_comp" + circuitid + "_" + sindex;
        if ($(sobj) != null) {
            if ($(sobj).prop("checked")) {
                sum += value;
            }
        }
    });

    $("#thisqcircuitid").val(sum);
    loadXMLDoc("qd_placementindex"+circuitid, $("#thisqcircuitid"));

}
function validateclearance(sobj,ndia){
    nid = sobj.id;
    if(isNaN(sobj.value)){
        sobj.value="";
        return true;
    }
    if(isNaN(ndia)){
        return false;
    }
    if(sobj.value==0){
        sobj.value="";
        return true;
    }
    if(sobj.value*1 > 7){
        alert("The max clearance diameter is currently 7.");
        sobj.value="";
        sobj.focus();
        return false;
    }
    if (sobj.value * 1 < (ndia * 1) + .001) {
        alert("The clearance must be larger than the standard clearance.");
       // smess='<xsl:value-of select="//page/quote/screenlabels[@id=401]/@label"/>';
        //"The clearance must be larger than the standard clearance."
        alert(smess);
        sobj.value="";
        sobj.focus();
        return false;
    }
    return true;
}
