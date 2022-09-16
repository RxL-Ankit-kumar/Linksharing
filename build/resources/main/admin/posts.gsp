<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Topic list</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
%{--table-dark   --}%


<table  class="table table-striped  ">

    <thead>
    <tr>

        <th scope="col">S.no</th>
        <th scope="col">Id</th>
        <th scope="col"> By User</th>
        <th scope="col">Of Topic </th>
        <th scope="col">Link Resource</th>
        <th scope="col">Document Resource</th>

    </tr>
    </thead>

    <g:set var="i" value="1">  </g:set>
    <g:each in="${allreadingitems}">
        <tbody>
        <tr>
            <th scope="row">${i++}</th>
            <td>${it.id}</td>
            <td>${it.user.userName}</td>
            <td>${it.resource.topic.topicName}</td>
            <td>
            <g:if test="${com.rxlogix.LinkResource.findByTopic(it.resource.topic)}">
               Yes
            </g:if>
                <g:else>
                    No
                </g:else>
            </td>
            <td>
                <g:if test="${com.rxlogix.DocumentResource.findByTopic(it.resource.topic)}">
                   Yes
                </g:if>
                <g:else>
                    No
                </g:else>
            </td>
        </tr>
        </tbody>
    </g:each>

</table>

</body>
</html>
