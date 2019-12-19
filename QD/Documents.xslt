<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <input type="hidden" id="data_action" name="data_action"/>
    <xsl:if test="//page/qd/errormessage">
      <div id="errormessage" class="notecard">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
    <div class="container bg--white pad content--wrapper">
      <section class="block bottom-space grid">
        <!-- Add class "hidden" to "notifications-wrapper" to hide notifications -->
          <span id="spanhidenotification" class="hide-notifications right">
            <xsl:attribute name="onclick">
              //Show notifications
              sshow='<xsl:value-of select="//page/qd/screenlabels[@id=591]/@label"/> &#10006;'; 
              //Hide notifications
              shide='<xsl:value-of select="//page/qd/screenlabels[@id=592]/@label"/> &#10006;';	
              showhidewithtext(sshow, shide, ".notifications-wrapper","#spanhidenotification");

            </xsl:attribute>
            <xsl:value-of select="//page/qd/screenlabels[@id=592]/@label"/> &#10006;   
          </span>
          <div class="notifications-wrapper">
          <xsl:for-each select="//page/qd/usermessages">
            <a class="notification alert pad-half">
              <xsl:attribute name="href">
                <xsl:value-of select="@linkhref"/>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="@linklabel"/>
              </xsl:attribute>
              <xsl:if test="@linkclick">
                <xsl:attribute name="onclick">
                  <xsl:value-of select="@linkclick" disable-output-escaping="yes"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="not(@linkhref) and not(@linkclick)">
                <xsl:attribute name="onclick">
                 return false;
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="@smessage" disable-output-escaping="yes"/>
              <xsl:if test="@linkhref">
                <span class="arrow">
                  <xsl:value-of select="@linklabel"/> &#10141;
                </span>
                </xsl:if>
            </a>
          </xsl:for-each> 
          </div>
      </section>

      <section class="bg--light-grey pad block bottom-space grid lightborder">
        <div class="col-3-5">
          <xsl:if test="//page/qd/isproduction">
            <h2 class="block-title no-bottom-space">
              Sun Design 
              <span class="subtitle">
                (Rev <xsl:value-of select="//page/qd/qsummary/@rev"/>, <xsl:value-of select="//page/qd/qsummary/@status"/>)
              </span>
            </h2>
            <p class="grayitalic">This design has moved into Sun's production process.  
                        
            </p>
            <xsl:if test="//page/qd[adminlevel='1']">
              

                
              <p class="no-bottom-space">
                <b class="bottom-space">
                  Sun Design
                </b>
              </p>
              <p class="bottom-border">
                <xsl:for-each select="//page/qd/links[@ispdd='2']">
                  <a class="tx--orange underline">
                    <xsl:attribute name="href">
                      <xsl:value-of select="@link"/>
                    </xsl:attribute>
                    <xsl:if test="@question">
                      <xsl:attribute name="onclick">
                        if(confirm("<xsl:value-of select="@question"/>")==false){
                        return false;
                        }
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@target">
                      <xsl:attribute name="target">
                        <xsl:value-of select="@target"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="title">
                      <xsl:value-of select="@title"/>
                    </xsl:attribute>
                    <xsl:value-of select="@linktype"/>
                  </a>
                </xsl:for-each>               
              </p>
            </xsl:if>
          </xsl:if>
          <div>
            <xsl:if test="//page/qd/isproduction">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
          <h2 class="block-title">
            <xsl:if test="//page/qd[not(showproduction)]">
              <xsl:value-of select="//page/qd/screenlabels[@id='218']/@label"/>
              <!--Files and Links for the Current Version-->
            </xsl:if>
            <xsl:if test="//page/qd/showproduction">
              Files and Links for Revision A
              <span class="grayitalic">
                (<xsl:value-of select="//page/qd/events[@selected='1']/@revcomments"/>)
              </span>

            </xsl:if>
          </h2>

          <p class="no-bottom-space">
            <b class="bottom-space">
              <xsl:value-of select="//page/qd/screenlabels[@id='199']/@label"/>:
              <!--Config and Review-->
            </b>
          </p>
          <p class="bottom-border">
            <xsl:for-each select="//page/qd/links[@ispdd='0']">
              <a class="tx--orange underline">
                <xsl:attribute name="href">
                  <xsl:value-of select="@link"/>
                </xsl:attribute>
                <xsl:if test="@question">
                  <xsl:attribute name="onclick">
                    if(confirm("<xsl:value-of select="@question"/>")==false){
                    return false;
                    }
                  </xsl:attribute>
                </xsl:if>
                <xsl:if test="@target">
                  <xsl:attribute name="target">
                    <xsl:value-of select="@target"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="title">
                  <xsl:value-of select="@title"/>
                </xsl:attribute>
                <xsl:value-of select="@linktype"/>
              </a>
            </xsl:for-each>
          </p>

          <b>
            <xsl:value-of select="//page/qd/screenlabels[@id='643']/@label"/>:
            <!--Schematic Output-->
          </b>
          <p class="bottom-border">
            <xsl:for-each select="//page/qd/scfilelinks[@iscurrent='1' and @showlink='1']">
              <a class="tx--orange underline" href="#">
                <xsl:attribute name="onclick">
                  spage='<xsl:value-of select="@mappath"/><xsl:value-of select="@filename"/>'
                  var nwin = window.open(spage,
                  '<xsl:value-of select="@display"/>'+'_viewer' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                  nwin.focus();
                  return false;
                </xsl:attribute>
                <xsl:value-of select="@display"/>
              </a>
            </xsl:for-each>
          </p>
          </div>

          <b>
            <xsl:value-of select="//page/qd/screenlabels[@id='240']/@label"/>:
            <!--QuickDesign Results-->
          </b>
          <xsl:if test="//page/qd/isproduction">
            <p class="grayitalic">
              <xsl:value-of select="//page/qd/seehistorysection"/>
            </p>
          </xsl:if>
          <xsl:if test="//page/qd[not (isproduction)]">
					  <xsl:if test="//page/qd/events[@selected='1']/@mdtoolsstatus">
						  <p class="grayitalic">(Note: this version was updloaded or resubmitted)</p>
					  </xsl:if>
            <xsl:if test="//page/qd/iscurrentaranalysiserror">
              <p class="grayitalic">
                ATTN: See the BD Analysis report
              </p>
            </xsl:if>
            <xsl:if test="//page/qd/actions/@message">
              <p class="grayitalic">
                <xsl:value-of select="//page/qd/actions/@message"/>
              </p>
            </xsl:if>
            <div class="bottom-border">
              <xsl:for-each select="//page/qd/currentfiletypes[@filetype &gt; '19']">
                <table class="tablefiles">
                  <tr>
                 <td>
                  <xsl:value-of select="@name"/>:
                </td>                 
                <td>
                  <xsl:attribute name="id">
                    cellcurrent<xsl:value-of select="@filetype"/>
                  </xsl:attribute>
                  <xsl:for-each select="//page/qd/filelinks[@filetype = current()/@filetype
											            and @iscurrent='1']">
                    <xsl:if test="@fileitem !='2'">
                    <a class="tx--orange underline">
                        <xsl:attribute name="href"><xsl:value-of select="@mappath"/><xsl:value-of select="@filename"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank</xsl:attribute>
                        <xsl:value-of select="@display"/>
                      </a>
                      <!--
                      <a class="tx- -orange underline" href="#">
                        <xsl:attribute name="onclick">
                          var nwin = window.open('<xsl:value-of select="@mappath"/><xsl:value-of select="@filename"/>',
                          'fileviewer' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                          nwin.focus();
                          return false
                        </xsl:attribute>
                        <xsl:value-of select="@display"/>
                      </a>
                    -->
                    </xsl:if>
                  </xsl:for-each>

                </td>
                </tr>
                </table>

              </xsl:for-each>
            </div>
          </xsl:if>
          
            <b>
              <xsl:value-of select="//page/qd/screenlabels[@id=644]/@label"/>:          
              <!--Related Info-->
            </b>
          <p>
            <xsl:for-each select="//page/qd/links[@ispdd='1']">
              <a class="tx--orange underline" target="config">
                <xsl:if test="@question">
                  <xsl:attribute name="onclick">
                    if(confirm("<xsl:value-of select="@question"/>")==false){
                    return false;
                    }
                  </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="href">
                  <xsl:value-of select="@mappath"/>
                  <xsl:value-of select="@link"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="@title"/>
                </xsl:attribute>
                <xsl:value-of select="@linktype"/>
              </a> 
            </xsl:for-each>
            <a class="tx--orange underline" target="config" href="#">
              <xsl:attribute name="value"><xsl:value-of select="//page/qd/quoteid"/></xsl:attribute>
              <xsl:attribute name="onclick">
                loadXMLDoc("showweights", this);
               //clearTimeout(tovar); 
               $('#divweights').toggle("slow");

                return false;
              </xsl:attribute>
              <xsl:value-of select="//page/qd/screenlabels[@id='243']/@label"/><!--See Weights-->
            </a>
                       
              <div id="divweights" class="nodisplay"></div>   
            </p>
             <xsl:if test="//page/qd/sdjustification">
                <p class="no-bottom-space">
                  <b class="bottom-space">
                    SunDesign Justification                  
                  </b>
                </p>
            <p style="font-size:85%;padding-left:12px;">              
              <xsl:for-each select="//page/qd/sdjustification">
                <xsl:value-of select="@item"/>
                <br/>
              </xsl:for-each>
            </p>
          </xsl:if>
            <xsl:if test="//page/qd/retry/@retrycode">
              <div class="sunadminoptions">
                <xsl:value-of select="//page/qd/retry/@message"/>
                <br/>
                <input type="button" value="Retry">
                  <xsl:attribute name="onclick">
                    if(confirm("Are you sure you want to retry this step?")==false){
                    return false;
                    }
                    document.getElementById("data_action").value="processretry"+'<xsl:value-of select="//page/qd/retry/@retrycode"/>';
                    document.forms[0].submit();
                  </xsl:attribute>
                </input>
              </div>
            </xsl:if>    
        </div>

        <div class="col-2-5">
         <!-- <img src="images\schematic.png" alt=""/>-->
       </div>
      </section>
      <section class="bg--light-grey pad block bottom-space lightborder">
      <h3 class="block-title">
        <xsl:value-of select="//page/qd/screenlabels[@id='239']/@label"/>
        - <xsl:value-of select="//page/qd/qsummary/@partno"/>
        <!--QuickDesign History-->
        <xsl:if test="//page/qd/events">
        <div class="tx--orange dochisthide">
          <xsl:attribute name="onclick">
            sshow='<xsl:value-of select="//page/qd/screenlabels[@id=608]/@label"/>'
          <!--Expand All-->
            sitemshow='<xsl:value-of select="//page/qd/screenlabels[@id=593]/@label"/>';
            shide='<xsl:value-of select="//page/qd/screenlabels[@id=645]/@label"/>'

            <!--Collapse-->
            $(this).toggleClass("dochistshow dochisthide");
            $('.dochistitem').removeClass("dochistitemhide");
            $('.dochistitem').removeClass("dochistitemshow");
            if ($(this).hasClass('dochistshow')){
              this.innerHTML=shide;
              $('.dochistitem').addClass("dochistitemshow");
              $('.dochistitem').text(shide);
              $('.expandable').addClass("open");
            }
            else{
             this.innerHTML=sshow;
             $('.dochistitem').addClass("dochistitemhide");
             $('.dochistitem').text(sitemshow);
             $('.expandable').removeClass("open");
            }


          </xsl:attribute>
          <xsl:value-of select="//page/qd/screenlabels[@id=608]/@label"/>
        </div>
        </xsl:if>   
      </h3>    
         <xsl:if test="//page/qd[not(events)]">
          <div>
            (No history exists for this design)
          </div>
        </xsl:if>       
        <xsl:if test="//page/qd/missingfoldermessage">
          <span class="description">
            <xsl:value-of select="//page/qd/missingfoldermessage" disable-output-escaping="yes"/>
          </span>
        </xsl:if>
        
        <ul class="expandables-wrapper">
          <xsl:for-each select="//page/qd/events">
            <li class="expandable">
                <xsl:attribute name="id">histli<xsl:value-of select="@eventid"/></xsl:attribute>
              
              <div class="expandable-header">
                <div class="title">
                  <xsl:value-of select="@username"/>
                </div>
                <div class="date">
                  <xsl:value-of select="@submitdate"/>, <xsl:value-of select="@rev"/>
                </div>
                <div class="expander tx--orange dochistitem dochistitemhide">
                  <xsl:attribute name="onclick">
                    //Expand Details
                    sshow='<xsl:value-of select="//page/qd/screenlabels[@id=593]/@label"/>';
                    //Close
                    shide='<xsl:value-of select="//page/qd/screenlabels[@id=111]/@label"/>';
                    oli=document.getElementById('histli<xsl:value-of select="@eventid"/>');
                    $(this).toggleClass("dochistitemshow dochistitemhide");
                    if ($(this).hasClass('dochistitemshow')){
                      this.innerHTML=shide;
                      $(oli).addClass("open");
                      }
                    else{
                      this.innerHTML=sshow;
                      $(oli).removeClass("open"); 
                    }

                    //showhidedetails(this,oli,sshow, shide);
                  </xsl:attribute>
                  <xsl:value-of select="//page/qd/screenlabels[@id=593]/@label"/>
                </div>
              </div>
              <table class="table expandable-item">
                <thead>
                  <tr>
                    <th class="tx--center"><xsl:value-of select="//page/qd/screenlabels[@id=418]/@label"/>
					<!--Version-->
                    </th>
                    <th><xsl:value-of select="//page/qd/screenlabels[@id=419]/@label"/>
					<!--Status-->
                    </th>
                    <th><xsl:value-of select="//page/qd/screenlabels[@id=337]/@label"/>
					<!--Notes--></th>
                    <th><xsl:value-of select="//page/qd/screenlabels[@id=217]/@label"/>
					<!--Files--></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="tx--center version">
                      <xsl:value-of select="@rev"/>
                      <xsl:if test="@mayorder">
                      <br/>
                   
                        <a href="#" title="View the order form for this version...">
                          <xsl:attribute name="onclick">
                            javascript:
                            var nwin = window.open('pbx.aspx?arid=<xsl:value-of select="@eventid"/>&amp;filename=<xsl:value-of select="@ordername"/>',
                            '_self', 'menubar=1,toolbar=1,scrollbars=1,height=500,width=600,left=30,top=30,resizable=yes')
                            nwin.focus();
                            return false
                          </xsl:attribute>
                          Order
                        </a>
                      </xsl:if>
                    </td>

                    <td class="status">
                      <xsl:value-of select="@status"/>
                    </td>

                    <td class="notes">
                      <xsl:value-of select="@notes"/>
                      <xsl:if test="current()[@isaranalysiserror='1']">
                        <xsl:if test="//page/qd/filetypes[@eventid = current()/@eventid]">
                          <div class="alertbox">
                            See Body Design Analysis
                          </div>
                        </xsl:if>
                      </xsl:if>
                      <xsl:if test="@parthistid and //page/qd[adminlevel='1']">
                        <xsl:if test="@comments">
                          <div class="commenttext">
                            (<i>
                              <xsl:value-of select="@commentsby"/>
                            </i>) <xsl:value-of select="@comments"/>
                          </div>
                        </xsl:if>
                        <div>
                          <xsl:if test="@retrycode">
                            <div class="sunadminoptions">
                              <xsl:value-of select="//page/qd/arorderretry/@message"/>
                              <input type="button" value="Retry">
                                <xsl:attribute name="onclick">
                                  if(confirm("Are you sure you want to retry this step?")==false){
                                  return false;
                                  }
                                  document.getElementById("data_action").value="processretry"+'<xsl:value-of select="//page/qd/arorderretry/@retrycode"/>';
                                  document.forms[0].submit();
                                </xsl:attribute>
                              </input>
                            </div>
                          </xsl:if>
                          <div class="sunadminoptions">
                            <img src="images/plusbox.gif">
                              <xsl:attribute name="onclick">
                                sdiv=document.getElementById("a<xsl:value-of select='@parthistid'/>divcommentsby");
                                showhideimg(this,sdiv);
                              </xsl:attribute>
                              Sun Admin Options
                            </img>
                          </div>
                          <div class="sunadminoptions" style="display:none">
                            <xsl:attribute name="id">a<xsl:value-of select='@parthistid'/>divcommentsby</xsl:attribute>
                            Notes
                            <textarea style="width:200px">
                              <xsl:attribute name="id">t<xsl:value-of select='@parthistid'/>com</xsl:attribute>
                              <xsl:value-of select="@comments"/>
                            </textarea>
                            <xsl:if test="@mayorder">
                              <div class="sunadminoptions">
                              <input type="checkbox">
                                <xsl:attribute name="id">donotorder<xsl:value-of select='@parthistid'/></xsl:attribute>
                              </input>
                                This version may not be ordered.
                              </div>
                            </xsl:if>
                            <input type="button" value="Save">
                              <xsl:attribute name="onclick">
                                sparm='parthistid:<xsl:value-of select='@parthistid'/>;comments:';
                                scomm=document.getElementById("t<xsl:value-of select='@parthistid'/>com").value+";";
                                if(scomm.length &gt; 160){
                                alert("Note exceeds maximum length");
                                return 0;
                                }
                                if(scomm.length &lt; 5){
                                alert("A note is required.");
                                return 0;
                                }
                                sxmlcomm="savecomments";
                                <xsl:if test="@mayorder">
                                  if(document.getElementById("donotorder<xsl:value-of select='@parthistid'/>").checked==true){
                                    if(confirm("Doing this will permanently remove the Order button for this version. Continue?")==false){
                                      return 0;
                                    }
                                   sxmlcomm="savecommentsnoorder";
                                  }
                                </xsl:if>
 
                                sparm = sparm+scomm
                                loadXMLDoc(sxmlcomm,sparm);
                                document.getElementById("a<xsl:value-of select='@parthistid'/>divcommentsby").style.display="none";
                                document.getElementById("data_action").value="";
                                alert("Saved.")
                                document.forms[0].submit();
                              </xsl:attribute>
                            </input>
                            <br/>

                            <xsl:if test="@mayenternbprice">
                              NBOM Price  $<input maxlength="20">
                                <xsl:attribute name="id">nbp<xsl:value-of select='@parthistid'/>
                                </xsl:attribute>
                              </input>
                              <input type="button" value="Save NBOM Price">
                                <xsl:attribute name="onclick">
                                  sparm='nbhistid:<xsl:value-of select='@parthistid'/>;price:';
                                  sprice=document.getElementById("nbp<xsl:value-of select='@parthistid'/>").value;
                                  if(sprice=="" || isNaN(sprice)){
                                  alert("Enter a valid price");
                                  return
                                  }
                                  if(confirm("Are you sure you want to create this NBOM price? Once it is saved, it will be permanent.")==false){
                                  return
                                  }
                                  sparm = sparm+sprice+";"
                                  loadXMLDoc("saveversionnbprice",sparm);
                                  document.getElementById("data_action").value="";
                                  alert("Saved.")
                                  document.forms[0].submit();
                                </xsl:attribute>
                              </input>
                            </xsl:if>

                          </div>
                        </div>
                      </xsl:if>

                    </td>
                    <td class="files">
                      <xsl:if test="//page/qd/scfilelinks[@parthistid = current()/@parthistid and @showlink='1']">
                        <p>
                          <b>
                            <xsl:value-of select="//page/qd/screenlabels[@id='203']/@label"/>:
                            <!--Connections-->
                          </b>
                          <br/>
                            <xsl:for-each select="//page/qd/scfilelinks[@parthistid = current()/@parthistid and @showlink='1' and @norder]">
                              <a class="tx--orange" href="#">
                                <xsl:attribute name="onclick">
                                  var nwin = window.open('<xsl:value-of select="@mappath"/><xsl:value-of select="@filename"/>',
                                  'fileviewer' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                                  nwin.focus();
                                  return false
                                </xsl:attribute>
                                <xsl:value-of select="@display"/>
                              </a>
                            </xsl:for-each>
                        </p>
                      </xsl:if>              
 
                      <xsl:for-each select="//page/qd/filetypes[@eventid = current()/@eventid]">
                        <p>
                          <b>
                            <xsl:value-of select="@name"/>:
                          </b>
                          <br/>
                          <xsl:for-each select="//page/qd/filelinks[@filetype = current()/@filetype
											        and @eventid = current()/@eventid]">
                            <xsl:if test="@fileitem !='2'">
                              <a class="tx--orange underline">
                                <xsl:attribute name="href">
                                  <xsl:value-of select="@mappath"/><xsl:value-of select="@filename"/>
                                </xsl:attribute>
                                <xsl:attribute name="target">_blank</xsl:attribute>
                                <xsl:value-of select="@display"/>
                              </a>
                              <!-- 
                              <a class="tx- -orange" href="#">
                                <xsl:attribute name="onclick">
                                  var nwin = window.open('<xsl:value-of select="@mappath"/><xsl:value-of select="@filename"/>',
                                  'fileviewer' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                                  nwin.focus();
                                  return false
                                </xsl:attribute>
                                <xsl:value-of select="@display"/>
                              </a>-->
                            </xsl:if>
                          </xsl:for-each>
                        </p>
                      </xsl:for-each>
                    </td>
                  </tr>
                </tbody>
              </table>
            </li>
          </xsl:for-each>
        </ul>
      </section>
      <xsl:if test="//page/qd/arstats">
        <section class="bg--light-grey pad block bottom-space lightborder">
          <h3 class="block-title">QuickDesign Stats
          <div class="tx--orange docarstathide">
                <xsl:attribute name="onclick">
                  $("#divstats").toggle();
                  return false;
                </xsl:attribute>
                Toggle     
          </div>
        </h3>
            <div id="divstats" style="display:none;">
              <div class="graphcell">Mouse over the headings for more info</div>
              <table border="0" cellpadding='3' cellspacing='0' id="tablearstat">
                <tr>
                  <td>Rev</td>
                  <td title="Axes">Axes</td>
                  <td title="Vert">V</td>
                  <td title="Horiz">H</td>
                  <td title="Depth">D</td>
                  <td title="Volume in cu. in.">Vol</td>
                  <td title="Number of cavities">Cav</td>
                  <td title="Number of ports">Port</td>
                  <td title="Number of construction ports">CP</td>
                  <td title="Number of Connections">Con</td>
                  <td title="Number of Nets">Nets</td>
                  <xsl:if test="//page/qd[adminlevel='1']">
                    <td title="Time to complete">Time</td>
                    <td title="Percent constrained">%Const</td>
                    <td title="Max slenderness ratio">SR</td>
                    <td title="Plugs/features">P/F</td>
                  </xsl:if>
                </tr>
                <xsl:for-each select="//page/qd/arstats">
                  <tr>
                    <xsl:if test="@is1g">
                      <xsl:attribute name="style">background-color:silver;</xsl:attribute>
                    </xsl:if>
                    <td>
                      <xsl:value-of select="@rev"/>
                    </td>

                      <td>
                        <xsl:value-of select="@axes"/>
                      </td>

                    <td>
                      <xsl:value-of select="@vert"/>
                    </td>
                    <td>
                      <xsl:value-of select="@horiz"/>
                    </td>
                    <td>
                      <xsl:value-of select="@depth"/>
                    </td>
                    <td>
                      <xsl:value-of select="@volume"/>
                    </td>
                    <td>
                      <xsl:value-of select="@ncavities"/>
                    </td>
                    <td>
                      <xsl:value-of select="@nports"/>
                    </td>
                    <td>
                      <xsl:value-of select="@nplugs"/>
                    </td>
                    <td>
                      <xsl:value-of select="@nconn"/>
                    </td>
                    <td>
                      <xsl:value-of select="@nnets"/>
                    </td>
                    <xsl:if test="//page/qd[adminlevel='1']">
                      <td nowrap="true">
                        <xsl:value-of select="@elapsed"/>
                      </td>
                      <td nowrap="true">
                        <xsl:value-of select="@percconst"/>

                      </td>
                      <td nowrap="true">
                        <xsl:value-of select="@slender"/>

                      </td>
                      <td nowrap="true">
                        <xsl:value-of select="@rptof"/>

                      </td>

                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </table>
            </div>

        </section>

      </xsl:if>

      <xsl:if test="//page/qd/projectoptions">
        <section class="bg--light-grey pad block bottom-space lightborder">
          <h3 class="block-title">Project Options</h3>
          <div>
            <xsl:for-each select="//page/qd/projectoptions">
						<xsl:variable name="thisprojectoption" select="."/>
            <div style="margin-bottom:12px;">
              <xsl:value-of select="@label"/>
							
							<a style="cursor:pointer;">
								<xsl:attribute name="onclick">
									<xsl:if test="@helpid">
										var sthisdiv='#po'+'<xsl:value-of select="@helpid"/>'
										$(sthisdiv).show("slow");
									</xsl:if>
									<xsl:if test="not(@helpid)">
										alert("This topic is not yet available")
									</xsl:if>
								</xsl:attribute>
								<img src="images/helpbutton.png" title="See help for this topic"/>
							</a>							
							

              <a class="tx--orange" href="#" style="padding-left:12px;">
                <xsl:attribute name="onclick">
                  surl='<xsl:value-of select="@surl"/>';
									<xsl:if test="not(@ismdtoolsupload)">
										var nwin = window.open(surl,
										'poption', 'menubar=0,toolbar=0,scrollbars=1,left=30,top=30,resizable=yes')
										nwin.focus();
									</xsl:if>
									<xsl:if test="@ismdtoolsupload">
										$('#mdtoolspopup').addClass('active');
										$('.popup-overlay').addClass('active');
									</xsl:if>
                </xsl:attribute>
                Go...
              </a>
							<div class="popup faqdiv">
								<xsl:attribute name="id">po<xsl:value-of select="@helpid"/></xsl:attribute>
								<div class="close">
									<xsl:attribute name="onclick">
										sthisdiv='#po'+'<xsl:value-of select="@helpid"/>'
										$(sthisdiv).hide();
									</xsl:attribute>
									x
								</div>
								<div>
									<div class="faqq">
										
										<xsl:value-of select="//page/qd/helptext[@id=$thisprojectoption/@helpid]/@q"/>
									</div>
									<xsl:value-of select="//page/qd/helptext[@id=$thisprojectoption/@helpid]/@a" disable-output-escaping="yes"/>
								</div>
							</div>
            </div>
						
            </xsl:for-each>
          </div>
        </section>      
      </xsl:if>
      
      <xsl:if test="//page/qd/maydeleteschematic">
        <section class="bg--light-grey pad block bottom-space lightborder">
          <h3 class="block-title">Sun Admin</h3>
          <div style="font-size:80%;">
            <xsl:value-of select="//page/qd/scremovemsg/@msg"/>
            <a class="tx--orange underline" href="#">
              <xsl:attribute name="value"><xsl:value-of select="//page/qd/quoteid"/></xsl:attribute>
              <xsl:attribute name="onclick">
                  if(confirm("Are you sure you want to delete the schematic?")==false){
                    return false;
                  }
                  document.getElementById("data_action").value="removeschematic";
                  document.forms[0].submit();
              </xsl:attribute>
              Delete the Schematic
            </a>
          </div>
        </section>
      </xsl:if>      
    </div>
		<div id="mdtoolspopup" class="popup">
			<div>
				<input type="button" class="button bg--darker-grey smallbutton" style="width:100px;">
					<xsl:attribute name="value">Close
					</xsl:attribute>
					<xsl:attribute name="onclick">
						$('#mdtoolspopup').removeClass('active');
						$('.popup-overlay').removeClass('active');
						return false;
					</xsl:attribute>
				</input>
			</div>
			<xsl:for-each select="//page/qd/projectoptions[@ismdtoolsupload='1']">
				<h3>MDTools Upload Agreement</h3>
				<div class="mdtoolstext">
					<xsl:value-of select="//page/qd/mdtoolsagreement/@stext" disable-output-escaping="yes"/>
				</div>
				<div style="margin-bottom:12px;">
					<a class="button bg--blue" href="#" style="padding-left:20px;">
						<xsl:attribute name="onclick">
							$('#mdtoolspopup').removeClass('active');
							$('.popup-overlay').removeClass('active');
								surl='<xsl:value-of select="@surl"/>';
								var nwin = window.open(surl,
								'poption', 'menubar=0,toolbar=0,scrollbars=1,left=30,top=30,resizable=yes')
								nwin.focus();
						</xsl:attribute>
						Accept
					</a>
				</div>

			</xsl:for-each>
		</div>
    <!-- .container -->
		<div class="popup-overlay"></div>
  </xsl:template>
</xsl:stylesheet>
