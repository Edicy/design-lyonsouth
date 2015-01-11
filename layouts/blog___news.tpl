<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>

<body id="blogandnews">
	
	<div id="wrap">
   
   {% include "Mainmenu" %}
   
   <div id="container">
     <div id="container-left">
       
       <div id="header" class="clearfix">
         {% editable site.header %}
         <div class="clearer"></div>
       </div> <!-- //header -->
<div id="container-left-inner">
{% include "Submenu" %}
  
  {% addbutton class="add-article" %}
              {% for article in articles %}
        <div class="blog{% if forloop.last == true %} blog-last{% endif %} clearfix">
         <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>
          <span class="date">{{ article.created_at | format_date:"short" }}</span>&nbsp;&nbsp;<span class="blog-info">{{ article.author.name }}. <a href="{{ article.url }}#comments">{{ "comments_for_count"|lc}}: {{article.comments_count}}</a></span>
          
                <div class="blog-inner">
                 {{ article.excerpt }} <a href="{{ article.url }}">{{"read_more"|lc}}</a>
                </div>
              </div> <!-- //blog -->

              {% endfor %}
       
</div>
     </div> <!-- //container-left -->
     
     <div id="container-right">
       
             {% include "Langmenu" %}
       
       <div id="container-right-inner">
         
         {% include "Sidebar" %}
          
       </div> <!-- //container-right-inner -->
     </div> <!-- //container-right -->
     
     <div class="clearer"></div>
     
   </div> <!-- //container -->
   
   <div id="footer" class="clearfix">
            <div id="edicy" style="padding-top: 8px;">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
     {% content name="footer" xpage="true" %}
   </div> <!-- //footer -->
   
    
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>