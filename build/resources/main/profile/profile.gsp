<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>profile</title>
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <asset:stylesheet src="css/profile.css"></asset:stylesheet>

</head>
<body>
%{--  Nav bar --}%
<nav class="navbar navbar-expand-md navbar-dark bg-dark" id="mynav">
    <a class="navbar-brand" href="#">Linksharing</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-light my-sm-0" type="submit">Search</button>
        </form>

        <ul id="cr" class="navbar-nav mx-auto">
            <li>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle bg-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${user?.firstName}
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Profile</a>
                        <a class="dropdown-item" href="#">Edit Profile</a>
                        <a class="dropdown-item" href="../Dashboard/logout">logout</a>
                    </div>
                </div>

            </li>
        </ul>

    </div>
</nav>
<br>
%{-- user information--}%


%{--place divs here --}%


<div class="container">
    <div class="row">

        <div class="col">
            %{--left 1st div l1 --}%
            <div class="subs">
                <div class="mg"  >
                    <span><asset:image id="pic"  src="profile/${user.userName}.jpeg"></asset:image></span>
                </div>

                <div class="heading">
                    ${user.firstName} ${user.lastName}
                    <span > ( @${user.userName} )</span>
                </div>
                <div class="content">
                    <div class="sub_heads">

                        <span id="tp-2" >subscriptions</span>
                        <span  >Topics</span>
                    </div>
                    <div class="sub_vals">
                        <a   id="tp-3" href="#"> ${user.subscriptions.size()} </a>
                        <a  id="tp-32" class="tp-3" href="#">${user.topics.size()}</a>
                    </div>
                </div>
                <div class="footer">

                </div>
            </div>
        </div>

        <div class="w-100"></div>
        <br>

        <div class="col">
            <div>
                <span>Topics</span>
                <span> <input type="search" placeholder="search"></span>
            </div>
            <br>
        %{--left 2nd div  l2--}%
        %{--user details div for repeatation in loop--}%
            <g:set var="i" value="0"></g:set>
            <g:each in="${user.topics}">
                <g:if test="${i++ <= "9"}">

                <div id="usersOftopic" class="subs">
                    <div class="mg"  >
                        <asset:image id="pic"  src="profile/${user.userName}.jpeg"></asset:image>
                    </div>
                    <div class="heading">
                        <span>  ${it.topicName} </span>
                        <span> <input type="submit" value="save"> </span>

                    </div>
                    <div class="content">
                        <div id="heads">
                            <h6>@${it.user.userName}</h6>
                            <span>subscriptions</span>
                            <span>Posts</span>
                        </div>
                        <div id="vals">
                            <a href="../Dashboard/subscribedTopicList"> ${user.subscriptions.size()} </a>
                            <a href="../Dashboard/topicList">${com.rxlogix.Topic.findAllByTopicName(it.topicName).size()}</a>
                        </div>
                        <div class="footer">
                            <span>
                                <g:form  id="g1" controller="subscription" action="updateSubscription">
                                    <g:select onChange="submit()" name="seriousnessSelected" from="${com.rxlogix.Subscription.Seriousness.values()}" value="${com.rxlogix.Subscription.findByUserAndTopic(it.user , it).seriousness}" />
                                    <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                                </g:form>
                            </span>
                            <span>
                                <g:form   controller="profile" action="changeVisibility">
                                    <g:select id="g2" onChange="submit()" name="visibilitySelected" from="${com.rxlogix.Topic.Visibility.values()}" value="${it.visibility}" />
                                    <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                                </g:form>
                            </span>
                            <span>
                                <a data-toggle="modal" data-target="#sendInvitation2" href="#" style=" padding-top: 20px; padding-left: 20px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                                    </svg>
                                </a>
                            </span>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                </svg>
                            </span>
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                </svg>
                            </span>
                        </div>
                 </div>
                </div>
            </g:if>
            </g:each>





    %{--place divs here --}%


%{--topics of user --}%










<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>