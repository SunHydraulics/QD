function sortsubmit(nsortby){
    ncursort=document.getElementById("data_sortby").value;
    if(ncursort == nsortby){
        nsortby = nsortby * -1
    }
    document.getElementById("data_sortby").value=nsortby;
    document.forms[0].submit();
}
function filtersubmitit(){
    document.getElementById("divviewsection").style.display="none";
    document.getElementById("data_viewoption").value="";
    document.getElementById("showviews").value="";
    document.forms[0].submit();
}
function partnosubmit(){
    sparm1 = document.getElementById("txtpartno").value;
    if (sparm1.indexOf(" ") > -1) {
        alert("No spaces are allowed.  Enter a whole or partial part number, distributor name, customer name or the first or last name of a person");
        return 0;
    }
    document.getElementById("data_partno").value=sparm1;
    filtersubmitit();
}
function filterdisplay(arrowobj, nitem){
    ssrc = arrowobj.src;
    saction="none";
    sopaction="block";
    sstr="filter"
    if(nitem=='2'){sstr="view"}

    if(ssrc.search("down") > -1){
        ssrc=ssrc.replace("down","up")
        arrowobj.alt="Hide"
        saction="block";
        sopaction="none"
        document.getElementById("show"+sstr+"s").value="1";
    }
    else
    {
    arrowobj.alt="Display"
        ssrc=ssrc.replace("up","down")
        document.getElementById("show"+sstr+"s").value="0";
    }
    arrowobj.src = ssrc;
    document.getElementById("div"+sstr+"section").style.display=saction;
    document.getElementById("div"+sstr+"str").style.display=sopaction;
    }
