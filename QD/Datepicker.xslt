<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/" name="datepicker">
    <html lang="en">
      <head>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script>
          <xsl:comment>
            $(function() {
            $("#sdatepicker").datepicker();
            $("#edatepicker").datepicker();
            });
          </xsl:comment>
        </script>
      </head>
      <body>
      <p><input type="text" id="sdatepicker"/> to
        <input type="text" id="edatepicker"/></p>    
      </body>
    </html>
 </xsl:template>
</xsl:stylesheet>