
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>lpic</title>
	<link href="http://r-forge.r-project.org/themes/rforge/styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="http://r-forge.r-project.org/"><img src="http://r-forge.r-project.org/themes/rforge//imagesrf/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>

        <div style="margin-left:5%; margin-right:5%"><br>
        <table cellspacing="0" class="msmGrid">
                <tr>
                        <td class="msmGridContent">
                                <div class="msmGridUpperPanel">
                                        <div style="font-size:x-small;">
                                                <table>
                                                        <tr>
                                                                <td style="width:500px;">
                                                                <span style="font-size:18px;"><b>MatchImage package</b></span><br>
                                                                
                                                                <br><span style="font-size:12px;">
                                                                <b>Likelihood-based photograph identification: application with photographs of free-ranging bison</b><br>
                                                                <span style="font-size:9px;">Jerod A. Merkle<sup>1,2</sup>, Daniel Fortin<sup>1</sup><br>
                                                                <sup>1</sup>D�partement de Biologie, Universit� Laval, Qu�bec, Canada<br>
                                                                <sup>2</sup>Email: <a href="mailto:jerod.merkle.1@ulaval.ca">jerod.merkle.1@ulaval.ca</a>, Web: <a href="http://www.cef-cfr.ca/">http://www.cef-cfr.ca/</a><br><br>
                                                                </span>
                                                                <br>
                                                                Assigns animal ids to a database of photographs using phenotypic measurements of each photograph.   
                                                                <br>
                                                                <br>
                                                                <span style="color:green; font-size=12pt">MatchImage now works correctly with R 2.15.2 and current versions of ReadImages.</span>
                                                                <br>
                                                                <br>
                                                                <a href="MatchImage.pdf" target="_blank">Manual</a> (PDF)<br>
                                                                <a href="https://r-forge.r-project.org/projects/lpic/" target="_blank">R-Forge project page</a><br><br>
                                                                </span>
                                                                </td>
                                                        </tr>
                                                </table>
                                        </div>
                                </div>
                        </td>
                </tr>
        </table>
        <br>
        <br>
        <span class="msmGridUpperPanel"><b><span style="font-size:18px;">Installation</span></b></span>
        <br>
        <br>
        <table cellspacing="0" class="msmGrid">
                <tr>
                        <td class="msmGridContent">
                                <div class="msmGridUpperPanel">
                                        <span style="font-size:small;">STEP 1:  Install package dependencies</span>
                                </div>
                                <div class="msmGridMiddlePanel">
                                        <table cellspacing="0" class="msmTable msmTableSeparate">
                                                
                                                <tr>
                                                        
                                                        <td width=500><span style="font-size:12px"><br>At the R prompt:<br>
                                                        <strong><code>install.packages("ReadImages")<br>
                                                                      </code></strong></span><br><br></td>
                                                       
                                                </tr>
                                                <tr>
                                                        <td width=500>ReadImages is required.  <br>
                                                        </td>
                                                </tr>
                                            
                                        </table>
                                </div>
                        </td>
                </tr>
        </table>
        <br>
        <br>
        <table cellspacing="0" class="msmGrid">
                <tr>
                        <td class="msmGridContent">
                                <div class="msmGridUpperPanel">
                                        <span style="font-size:small;">STEP 2:  Install MatchImage<br>...If you are using the most recent version of R...</span>
                                </div>
                                <div class="msmGridMiddlePanel">
                                        <table cellspacing="0" class="msmTable msmTableSeparate">
                                                
                                                <tr>
                                                        
                                                        <td width=500><span style="font-size:12px"><br>At the R prompt:<br>
                                                        <strong><code>install.packages("MatchImage", repos="http://R-Forge.R-project.org")</code></strong><br><br></span></td>
                                                       
                                                </tr>
                                                <tr>
                                                        <td width=500>R will download and install MatchImage from the R-forge repository.</td>
                                                </tr>
                                            
                                        </table>
                                </div>
                        </td>
                </tr>
        </table>
        <br>
        <br>
        <table cellspacing="0" class="msmGrid">
                <tr>
                        <td class="msmGridContent">
                                <div class="msmGridUpperPanel">
                                        <span style="font-size:small;">STEP 3:  Get started</span>
                                </div>
                                <div class="msmGridMiddlePanel">
                                        <table cellspacing="0" class="msmTable msmTableSeparate">
                                                
                                               <tr>
                                                        
                                                    <td width=500><span style="font-size:12px"><br>1. At the R prompt:<br> 
                                                    <strong><code>library(MatchImage)<br>
                                                    ?MatchImage</code></span><br><br>
                                                       
                                                </tr>
                                                <tr>
                                                        <td width=500>Review the manual</td>
                                                </tr>
                                            
                                        </table>
                                </div>
                        </td>
                </tr>
        </table>
        <br>
        <br>
        </div>
</body>
</html>
