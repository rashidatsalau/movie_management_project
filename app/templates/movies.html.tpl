####<p>This is my rendered template</p>
<table>
<tr>
    <th>Title</th>
    <th>Year</th>
</tr>
{% for movie in movies_data %}
<tr>
    <td>{{movie[1]}}</td>
    <td>{{movie[2]}}</td>
</tr>
{% endfor %}
</table>
