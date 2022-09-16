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
        <th scope="col">Topic Name</th>
        <th scope="col">Created By</th>
        <th scope="col">Subsciptions</th>
        <th scope="col">Posts</th>
        <th scope="col">Visibility</th>


    </tr>
    </thead>

    <g:set var="i" value="1">  </g:set>
    <g:each in="${allTopics}">

        <tbody>
        <tr>
            <th scope="row">${i++}</th>
            <td>${it.id}</td>
            <td>${it.topicName}</td>
            <td>${it.user.userName}</td>
            <td>${com.rxlogix.Subscription.countByTopic(it)}</td>
            <td>${com.rxlogix.Topic.countByTopicName(it.topicName)}</td>
            <td>${it.visibility}</td>
        </tr>
        </tbody>
    </g:each>

</table>

</body>
</html>
