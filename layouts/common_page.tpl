<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.langauage_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>

<body>
	
	<div id="wrap">
   
   {% include "Mainmenu" %}
   
   <div id="container">
     <div id="container-left">
       
       <div id="header" class="clearfix">
         {% editable site.header %}
         <div class="clearer"></div>
       </div> <!-- //header -->
       
       <div id="container-left-inner">
         <div id="container-left-inner2" class="clearfix">
         {% include "Submenu" %}
         <div class=" content-hyphenate" data-search-indexing-allowed="true">{% content %}</div>
         </div>
       </div> <!-- //container-left-inner -->
       
     </div> <!-- //container-left -->
     
     <div id="container-right" class="clearfix">
       
             {% include "Langmenu" %}
       
       <div id="container-right-inner">
         
         {% include "News" %}
          
       </div> <!-- //container-right-inner -->
     </div> <!-- //container-right -->
     
     <div class="clearer"></div>
     
   </div> <!-- //container -->
   
   <div id="footer" class="clearfix content-hyphenate">
            <div id="edicy" style="padding-top: 8px;">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
     {% content name="footer" xpage="true" %}
   </div> <!-- //footer -->
   
    
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>