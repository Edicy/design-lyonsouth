	{% for item in site.all_menuitems %}{% if item.selected? %}
{% if editmode %}
<div id="submenu"><p>{% for level2 in item.visible_children %}
	<a href="{{ level2.url }}"{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a>
	{% endfor %}
  <span>{% menubtn item.hidden_children %}</span>
	<span>{% menuadd parent="item" %}</span>
	</p></div>
{% else %}
{% if item.children? %}
<div id="submenu"><p>{% for level2 in item.children %}
	<a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a>
	{% endfor %}
	</p></div>
{% endif %}
{% endif %}
{% endif %}{% endfor %}