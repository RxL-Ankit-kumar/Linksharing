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
        <th scope="col">Topic Name </th>

        <th scope="col">Subscriptions</th>
        <th scope="col">Posts</th>
        <th scope="col">Created On</th>
    </tr>
    </thead>

    <g:set var="i" value="1">  </g:set>
    <g:each in="${com.rxlogix.Subscription.findAllByUser(user)}">

        <tbody>
        <tr>
            <th scope="row">${i++}</th>
            <td><g:link controller="topicShowPage" action="index" params="${[id:it.topic.id]}"> ${it.topic.topicName} </g:link></td>

            <td>${com.rxlogix.Subscription.countByTopic(it.topic)}</td>
            <td>${com.rxlogix.Topic.countByTopicName(it.topic.topicName)}</td>
            <td>${it.dateCreated.dateString}</td>
        </tr>
        </tbody>
    </g:each>

</table>


</body>
</html>
