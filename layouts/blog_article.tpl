<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{article.title}} &laquo; {{page.title}} | {{site.name}}</title>
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
              <div class="blog{% if article.new_record? %} blog-last{% endif %}">
<div style="width: 512px; overflow: hidden;">
         <h1>{% editable article.title plain="true" %}</h1>
</div>
                <span class="date">{{ article.created_at | format_date:"short" }}</span>&nbsp;&nbsp;<span class="blog-info">{{ article.author.name }}. {{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></span>
          
          <div class="blog-inner clearfix content-hyphenate" data-search-indexing-allowed="true">
            
            {% editable article.excerpt %}
            <div id="articlebody">
              {% editable article.body %}
            </div>
            
          </div>
        </div> <!-- //blog -->
        {% unless article.new_record? %}
        <div class="comments">
          <a name="comments"></a>
          
          <table>
            {% for comment in article.comments %}
            <tr class="edy-site-blog-comment content-hyphenate">
              <td class="first">{{ comment.author }} {% removebutton %}</td>
              <td{% if forloop.last == true %} class="noborder"{% endif %}>{{ comment.body }} <span class="date">{{ comment.created_at | format_date:"long" }}</span></td>
            </tr>
            {% endfor %}
          </table>
          
          <div id="commentform">

                {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
                  <h3>{{"add_a_comment"|lc}}</h3>
                 <table>
                   <tr>
                     <td>{{"name"|lc}}:</td>
                     <td class="comment_label"><input type="text" class="textbox" name="comment[author]" value="{{comment.author}}" /></td>
                   </tr>
                   <tr>
                     <td>{{"email"|lc}}:</td>
                     <td class="comment_label"><input type="text" class="textbox" name="comment[author_email]" value="{{comment.author_email}}" /></td>
                   </tr>
                   <tr>
                     <td>{{"comment"|lc}}:</td>
                     <td class="comment_label"><textarea cols="20" class="textbox" name="comment[body]" rows="5">{{comment.body}}</textarea></td>
                   </tr>
                   <tr>
                     <td colspan="2" class="comment_label"><input type="submit" class="submit" value="{{"submit"|lc}}" /></td>
                      </tr>
                 </table>
               {% endcommentform %}
              
          </div> <!-- //commentform -->
          
        </div> <!-- //comments -->
{% endunless %}
       
</div>
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
            <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
     {% content name="footer" xpage="true" %}
   </div> <!-- //footer -->
   

    
  </div> <!-- //wrap -->
{% unless editmode %}{{ site.analytics }}{% endunless %}
                {% include "JS" %}
</body>
</html>