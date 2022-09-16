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
            <th scope="col">Edit</th>
        </tr>
        </thead>

         <g:set var="i" value="1">  </g:set>
        <g:each in="${user.topics}">

                <tbody>
                <tr>
                    <th scope="row">${i++}</th>
                    <td>
                    <g:link controller="topicShowPage" action="index" params="${[id:it.id]}"> ${it.topicName} </g:link>
                   </td>
                    <td>${it.subscriptions.size()}</td>
                    <td>${com.rxlogix.Topic.findAllByTopicName(it.topicName).size()}</td>
                    <td>${it.dateCreated.dateString}</td>

                   <td>
                        <g:link controller="admin" action="deleteTopic" params="${[delId:it.id]}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </g:link>
                   </td>
                </tr>
                </tbody>
        </g:each>

            </table>


</body>
</html>
