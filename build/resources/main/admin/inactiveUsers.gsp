<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Topic list</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
%{--table-dark   --}%

<span>Users</span>
<span>
    <select>
        <option>
            <g:link controller="admin" action="usersInfo">    All Users</g:link>
        </option>
        <option>
            <g:link controller="admin" action="activeUsersInfo">Active</g:link>

        </option>
        <option>
            <g:link controller="admin" action="inactiveUsersInfo">Inactive</g:link>
        </option>
    </select>

</span>

<table  class="table table-striped  ">

    <thead>
    <tr>

        <th scope="col">S.no</th>
        <th scope="col">Id</th>
        <th scope="col">User Name</th>
        <th scope="col">Email</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Active</th>
        <th scope="col">Manage</th>

    </tr>
    </thead>

    <g:set var="i" value="1">  </g:set>
    <g:each in="${users}">

        <tbody>
        <g:if test="${it.active == false}">


        <tr>

            <th scope="row">${i++}</th>
            <td>${it.id}</td>
            <td>${it.userName}</td>
            <td>${it.email}</td>
            <td>${it.firstName}</td>
            <td>${it.lastName}</td>
            <td>${it.active}</td>
            <td><g:link controller="admin" action="changeActive" params="${[uId:it.id ]}">
                <g:if test="${it.active == true}">
                    DeActivate
                </g:if>
                <g:else>
                    Activate
                </g:else>
            </g:link>
            </td>

        </tr>
        </g:if>
        </tbody>
    </g:each>

</table>

</body>
</html>
