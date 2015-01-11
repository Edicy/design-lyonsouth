{% for article in site.latest_articles limit:1 %}
<h3>{{ "latest_news" |lc}}</h3>
         <table class="newstable">
{% for article in site.latest_5_articles %}
           <tr>
             <td class="first">{{ article.created_at | date:"%d.%m" }}</td>
             <td><a href="{{ article.url }}">{{ article.title }}</a></td>
           </tr>
           {% endfor %}
          </table>


           {% endfor %}