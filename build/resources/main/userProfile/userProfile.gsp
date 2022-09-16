<%@ page import="com.rxlogix.Subscription; com.rxlogix.Topic" %>
<!DOCTYPE html>
<html>

<head>
    <title> DashBoard </title>

    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   <asset:stylesheet src="css/userProfile.css"></asset:stylesheet>
    <asset:javascript src="changeSubscriptionType.js"></asset:javascript>

</head>

<body>

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
            <li class="nav-itm">
                <asset:image id="profileImage" src="profile/${user.userName}.jpeg"></asset:image>
            </li>

            <li>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle bg-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${user?.firstName}
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Topic</a>
                        <a class="dropdown-item" href="../Dashboard/logout">logout</a>
                    </div>
                </div>

            </li>
        </ul>

    </div>
</nav>
<!-- modal for send invitation of topics  -->
<g:form controller="dashboard" action="sendInvitation">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="modal fade" id="sendInvitation1">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- header -->
                                <h2>Send Invitation</h2>
                            </div>
                            <div class="modal-body">
                                <!--body  -->
                                <form action="index.html" method="post">
                                    <label for="">Email *</label>
                                    <input type="email" name="email" value="" placeholder="Enter Topic Name Here" required>
                                    <br>
                                    <br>
                                    <label for="" style=" margin-right: 20px;">Topic *</label>

                                    <g:select name="topicSelected" from="${user.topics.topicName}" value="${com.rxlogix.Topic.findByUserAndTopicName(user , topic.topicName).topicName}" />

                                </form>

                            </div>
                            <div class="modal-footer">
                                <!-- footer -->
                                %{--<button type="submit" class="btn btn-success">Invite</button>--}%
                                %{--<button type="button" class="btn btn-danger" data-dismiss="modal" type="text" >Cancel</button>--}%

                                <input class="btn btn-success" type="submit" name="" value="Invite">
                                <input class="btn btn-danger" data-dismiss="modal" type="text" name="" value="close">
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</g:form>
<!-- modal for send invitation of topics -->
<br>
%{--user details--}%

%{--write dvi boxes here--}%
<div class="container">
    <div class="row">
        <div class="col">
            %{--l1 --}%
            <div class="subs">
                <div class="mg"  >
                    <asset:image id="pic"  src="profile/${user.userName}.jpeg"></asset:image>
                </div>
                <div class="heading">
                    <span>${user.firstName} ${user.lastName}</span>
                    <span>( @${user.userName} )</span>
                </div>
                <div class="content">
                    <div id="heads">
                        <span>subscriptions</span>
                        <span>Topics</span>
                    </div>
                    <div id="vals">
                        <a href="../Dashboard/subscribedTopicList"> ${user.subscriptions.size()} </a>
                        <a href="../Dashboard/topicList">${user.topics.size()}</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="w-100"></div>
        <div  class="col ">
            <br>
           <h5>Topics</h5>

        %{--l2--}%
        %{--subscriptions  of particular user --}%
            <g:set var="k" value="1"></g:set>
            <g:each in="${user.topics}">

                <g:if test="${k++ < "6"}">
                    <div id="subscribedTopics" class="subs">
                        <div class="content">
                            <div class="sub_heads">
                                <span > <g:link controller="topicShowPage" action="index" params="${[id:it.id]}"> ${it.topicName} </g:link></span>
                                <span id="tp-2" >subscriptions</span>
                                <span  >posts</span>
                            </div>
                            <div class="sub_vals">

                                <span>
                                    <a data-toggle="modal" data-target="#sendInvitation1" href="#" style=" padding-top: 20px; padding-left: 20px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                            <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                                        </svg>
                                    </a>
                                </span>
                                <a   id="tp-3" href="#"> ${user.subscriptions.size()} </a>
                                <a  id="tp-32" class="tp-3" href="#">${com.rxlogix.Topic.countByTopicName(it.topicName)}</a>
                            </div>
                        </div>
                        <div class="footer">
                            <span>
                                <g:form  controller="subscription" action="updateSubscription">
                                    <g:select onChange="submit()" name="seriousnessSelected" from="${com.rxlogix.Subscription.Seriousness.values()}" value="${com.rxlogix.Subscription.findByUserAndTopic(it.user , it).seriousness}" />
                                    <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                                </g:form>
                            </span>

                        </div>
                    </div>

                </g:if>
            %{--subscriptions  of particular user --}%
            </g:each>
            <br>
            %{--subscriptions  of particular user --}%
           <h5>Subscriptions </h5>

            <g:set var="k" value="1"></g:set>
            <g:each in="${com.rxlogix.Subscription.findAllByUser(user).topic}">

                <g:if test="${k++ < "6"}">
                    <div id="subscribedTopics" class="subs">
                        <div class="content">
                            <div class="sub_heads">
                                <span > <g:link controller="topicShowPage" action="index" params="${[id:it.id]}"> ${it.topicName} </g:link></span>
                                <span id="tp-2" >subscriptions</span>
                                <span  >posts</span>
                            </div>
                            <div class="sub_vals">
                                <span>
                                    <a data-toggle="modal" data-target="#sendInvitation1" href="#" style=" padding-top: 20px; padding-left: 20px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                            <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                                        </svg>
                                    </a>
                                </span>
                                <a   id="tp-3" href="#"> ${user.subscriptions.size()} </a>
                                <a  id="tp-32" class="tp-3" href="#">${com.rxlogix.Topic.countByTopicName(it.topicName)}</a>
                            </div>
                        </div>
                        <div class="footer">
                            <span>
                                <g:form  controller="subscription" action="updateSubscription">
                                    <g:select onChange="submit()" name="seriousnessSelected" from="${com.rxlogix.Subscription.Seriousness.values()}" value="${com.rxlogix.Subscription.findByUserAndTopic(it.user , it).seriousness}" />
                                    <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                                </g:form>
                            </span>

                        </div>
                    </div>

                </g:if>
            </g:each>
        %{--subscriptions  of particular user --}%

        </div>
        <div class="col">
        %{--r2--}%
            <g:set var="i" value="1"></g:set>
            <g:each in="${user.topics}">
                <div id="inboxDiv" class="subs">
                    <div class="mg"  >
                        <asset:image id="pic"  src="profile/${user.userName}.jpeg"></asset:image>
                    </div>
                    <div class="heading">
                        <span>${user.firstName} ${user.lastName}</span>
                        <span>@${user.userName}</span>
                        <span><g:link controller="topicShowPage" action="index" params="${[id:it.id]}"> ${topic.topicName}</g:link></span>
                    </div>
                    <div class="content">
                        <p>write text here</p>
                    </div>
                    <br>
                    <div class="footer">
                        <span ><g:link  >download</g:link> </span>
                        <span id="tp-2" > <g:link  >view full site</g:link> </span>
                        <span  ><g:link  >Mark as read</g:link> </span>
                        <span><g:link >View post</g:link> </span>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</div>
%{--write dvi boxes here--}%


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>

</html>
