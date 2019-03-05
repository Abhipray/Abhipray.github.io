{% extends 'markdown.tpl' %}

<!-- Tell Hugo not to render HTML output blocks as markdown -->
{% block data_html %}
<div markdown="0">
{{ output.data['text/html'] }}
</div>
{% endblock data_html %}