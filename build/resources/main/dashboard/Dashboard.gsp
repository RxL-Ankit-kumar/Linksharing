<%@ page import="com.rxlogix.LinkResource; com.rxlogix.Subscription; com.rxlogix.Topic" %>
<!DOCTYPE html>
<html>

<head>
    <title> DashBoard </title>
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <asset:stylesheet src="css/Dashboard.css"></asset:stylesheet>
    <asset:javascript src="js/changeSubscriptionType.js"></asset:javascript>

</head>

<body>
%{--nav bar --}%
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
            <!-- create topic icon -->
            <li class="nav-item active " id="icon1" >
                <a  class="nav-link icons" data-toggle="modal" data-target="#myModal" href="#">

                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-chat-fill"
                         viewBox="0 0 16 16">
                        <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"
                        />
                    </svg>
                </a>
            </li>
            <!-- send invitation icon -->
            <li class="nav-item">
                <a class="nav-link icons" data-toggle="modal" data-target="#sendInvitation" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white " class="bi bi-envelope"
                         viewBox="0 0 16 16">
                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"
                        />
                    </svg>
                </a>
            </li>
            <!-- create  link resource icon -->
            <li class="nav-item">
                <a class="nav-link icons" data-toggle="modal" data-target="#createResource" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-link-45deg"
                         viewBox="0 0 16 16">
                        <path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.002 1.002 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"
                        />
                        <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243L6.586 4.672z"
                        />
                    </svg>
                </a>
            </li>
            <!-- create  document resource icon -->
            <li class="nav-item">
                <a class="nav-link icons" data-toggle="modal" data-target="#documentResoure" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-file-earmark-plus"
                         viewBox="0 0 16 16">
                        <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"
                        />
                        <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"
                        />
                    </svg>
                </a>
            </li>
            <li class="nav-itm">
                <g:link controller="userProfile" action="index">
           %{--<asset:image id="profileImage" src="profile/${user.userName}.jpeg"></asset:image>--}%
                    <asset:image id="profileImage" src="${user.photo}"></asset:image>
                </g:link>
            </li>
            <li>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle bg-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${user.firstName}
                        <g:if test="${user.admin == true}">
                            <span>- Admin</span>
                        </g:if>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="${createLink(controller: 'profile' ,  action: 'profile')}">Profile</a>
                        <g:if test="${user.admin == true}">
                            <a class="dropdown-item" href="${createLink(controller: 'admin' ,  action: 'usersInfo')}">Users</a>
                            <a class="dropdown-item" href="${createLink(controller: 'admin' ,  action: 'topicsInfo')}">Topics</a>
                            <a class="dropdown-item" href="${createLink(controller: 'admin' ,  action: 'postsInfo')}">Posts</a>
                        </g:if>
                        <a class="dropdown-item" href="${createLink(controller: 'profile' , action: 'editProfile')}">Edit Profile</a>

                        <a class="dropdown-item" href="${createLink( controller: 'logoutUser'  , action: 'logout')}">logout</a>

                    </div>
                </div>

            </li>
        </ul>

    </div>
</nav>

<p>${flash.message}</p>

%{--modals of nav bar --}%

<!-- modal  for crete topic-->
<g:form controller="dashboard" action="createTopic">
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- header -->
                            <h2>Create Topic</h2>
                        </div>
                        <div class="modal-body">
                            <!--body  -->
                            <form action="index.html" method="post">
                                <label for="">Name *</label>
                                <input type="text" name="topicName" value="" placeholder="Enter Topic Name Here">
                                <br>
                                <br>

                                <label for="">Visibility *</label>
                                <select class="" name="vis">
                                    %{--<option value="">    Select  </option>--}%
                                    <option value="Private" name="Private" >Private</option>
                                    <option value="Public" name="Public" >Public</option>
                                </select>

                            </form>
                        </div>
                        <div class="modal-footer">
                            %{--<button type="submit" class="btn btn-success "  >Save</button>--}%
                            %{--<button type="button" class="btn btn-danger" data-dismiss="modal" type="text" >Cancel</button>--}%

                            <input class="btn btn-success" type="submit" name="" value="Save">
                            <input class="btn btn-danger" data-dismiss="modal" type="text" name="" value="close">
                            <!-- footer -->
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</g:form>
<!-- modal for create topic -->

<!-- modal for send invitation   -->
<g:form controller="dashboard" action="sendInvitation">
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="modal fade" id="sendInvitation">
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
                            <g:select name="topicSelected" from="${user.topics.topicName}" value="" noSelection="['':'-Choose your topic-']"/>
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
<!-- modal for send invitation -->

<!-- modal for send invitation of subscriptions  -->
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
                                %{--${com.rxlogix.Topic.findByUserAndTopicName(user ,topic.topicName).topicName}--}%

                                    <g:select name="topicSelected" from="${com.rxlogix.Subscription.findAllByUser(user).topic.topicName}" value="" />
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
<!-- modal for send invitation of subscriptions -->

<!-- modal for create  link resource -->
<g:form controller="dashboard" action="shareLinkResource">
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="modal fade" id="createResource">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- header -->
                            <h2>Share Link</h2>
                        </div>
                        <div class="modal-body">
                            <!--body  -->
                            <form action="index.html" method="post">
                                <label for="">Link *</label>
                                <input type="text" name="linkRes" value="">
                                <br>
                                <br>
                                <label for="">Description *</label>
                                <textarea name="desc" rows="3" cols="30" placeholder="write your description here">
                                </textarea>
                                <br>
                                <label for="">Topic *</label>

                            <g:select name="topicSelected" from="${user.topics.topicName}" value="" noSelection="['':'-Choose your topic-']"/>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <!-- footer -->
                            %{--<button type="submit" class="btn btn-success">Share</button>--}%
                            %{--<button type="button" class="btn btn-danger" data-dismiss="modal" type="text" >Cancel</button>--}%

                            <input class="btn btn-success" type="submit" name="" value="Share">
                            <input class="btn btn-danger" data-dismiss="modal" type="text" name="" value="close">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</g:form>
<!-- modal for create  link resource -->

<!-- modal for create  document resource -->
<g:form controller="dashboard" action="shareDocumentResource">
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <div class="modal fade" id="documentResoure">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- header -->
                            <h2>Share Document</h2>
                        </div>
                        <div class="modal-body">
                            <!--body  -->
                            <g:uploadForm controller="dashboard" action="shareDocumentResource" method="post">
                            %{--<form action="index.html" method="post">--}%
                                <label for="">Document *</label> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                                <input type="file" name="dRes" value="" placeholder="">
                                <br>
                                <br>
                                <label for="">Description *</label>
                                <textarea name="desc" rows="3" cols="30" placeholder="write your description here">
                                </textarea>
                                <br>
                                <label for="">Topic *</label>
                            <g:select  name="topicSelected" from="${user.topics.topicName}" value="" optionKey=""  noSelection="['':'-  Choose your topic  -']" />
                            %{--</form>--}%

                        </div>
                        <div class="modal-footer">
                            <!-- footer -->
                            %{--<button type="submit" class="btn btn-success">Share</button>--}%
                            %{--<button type="button" class="btn btn-danger" data-dismiss="modal" type="text" >Cancel</button>--}%

                               <input class="btn btn-success" type="submit" name="" value="Share">
                              <input class="btn btn-danger" data-dismiss="modal" type="text" name="" value="close">
                        </div>
                            </g:uploadForm>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</g:form>
<!-- modal for create  document resource -->
<!-- modal for edit  -->
<g:form controller="admin" action="editTopic">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="modal fade" id="edit1">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!-- header -->
                                <h2>Edit Topic </h2>
                            </div>
                            <div class="modal-body">
                                <!--body  -->
                                <form action="index.html" method="post">
                                    <label for="">Topic Name  *</label>
                                    <input type="text" name="topicNameEdited" value="" placeholder="Enter Topic Name Here" required>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-success" type="submit" name="" value="Edit">
                                <input class="btn btn-danger" data-dismiss="modal" type="text" name="" value="close">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
<!-- modal for edit-->

<br>
%{--user details--}%

%{--write div boxes here--}%

<div class="container">
    <div class="row">
        %{--l1 --}%
        <div class="col ">
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
                     <g:link controller="dashboard" action="subscribedTopicList">
                            ${com.rxlogix.Subscription.countByUser(user)}
                     </g:link>
                     <g:link controller="dashboard" action="topicList">
                        ${com.rxlogix.Topic.countByUser(user)}
                     </g:link>
                    </div>
                </div>
            </div>
        <br>
        %{--user details--}%

        %{--subscriptions of logged in user --}%
        <div id="topicDetails">
            <span id="sp1"> Subscriptions </span>
            <g:link controller="dashboard" action="subscribedTopicList">
                <span> View All</span>
            </g:link>
        </div>

        <g:set var="k" value="1"></g:set>
        <g:each in="${com.rxlogix.Subscription.findAllByUser(user).topic}">

            %{--<g:if test="${k++ < "6"}">--}%
                <div id="subscribedTopics" class="subs">
                    <div class="mg"  >
                        <asset:image id="pic"  src="profile/${it.user.userName}.jpeg"></asset:image>

                    </div>
                    <div class="heading">
                        <h5>
                            <g:link controller="topicShowPage" action="index" params="${[id:it.id]}"> ${it.topicName} </g:link>
                        </h5>
                    </div>
                    <div class="content">
                        <div class="sub_heads">
                            <span >@${it.user.userName}</span>
                            <span id="tp-2" >subscriptions</span>
                            <span  >posts</span>
                        </div>
                        <div class="sub_vals">
                            <g:if test="${com.rxlogix.Subscription.findByTopicAndUser(it , user) == null}">
                                <g:link controller="dashboard" action="changeSubscriptionType" params="[id: it.id, userid: user.id, isSubscribed:false]">
                                    Subscribe
                                </g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="dashboard" action="changeSubscriptionType" params="[id: it.id, userid: user.id, isSubscribed: true]">
                                    Unsubscribe
                                </g:link>
                            </g:else>
                            <a   id="tp-3" href="#"> ${com.rxlogix.Subscription.countByTopic(it)} </a>
                            <a  id="tp-32" class="tp-3" href="#">${com.rxlogix.Topic.countByTopicName(it.topicName)}</a>
                        </div>
                    </div>
                    <div class="footer">
                        <span>
                            <g:form  controller="subscription" action="updateSubscription">
                                <g:select onChange="submit()" name="seriousnessSelected" from="${com.rxlogix.Subscription.Seriousness.values()}" value="${com.rxlogix.Subscription.findByUserAndTopic(user , it).seriousness}" />
                                <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                            </g:form>
                        </span>

                            <g:if test="${user.admin == true}">
                              <span >
                                <g:form  controller="admin" action="updateVisibility">
                                    <g:select id="forVisibility" onChange="submit()" name="visibilitySelected" from="${com.rxlogix.Topic.Visibility.values()}" value="${com.rxlogix.Topic.findByUserAndTopicName(it.user , it.topicName).visibility}"></g:select>
                                    <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                                </g:form>

                              </span>
                             <span>
                                  <g:link controller="admin" action="deleteTopic" params="${[delId:it.id]}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                </svg>
                                  </g:link>
                             </span>
                             <span>
                                 <g:link  data-toggle="modal" data-target="#edit1" controller="admin" action="editTopic" params="${[editId:it.id]}">
                                 %{--<a data-toggle="modal" data-target="#edit1" href="#" style=" padding-top: 20px; padding-left: 20px;">--}%
                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                     <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                     <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                 </svg>
                                 %{--</a>--}%
                                 </g:link>
                             </span>
                            </g:if>

                        <span>
                            <a data-toggle="modal" data-target="#sendInvitation1" href="#" style=" padding-top: 20px; padding-left: 20px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                                </svg>
                            </a>
                        </span>
                    </div>
                </div>

            %{--</g:if>--}%

        </g:each>
        <br>

        %{-- trending topics based on no of posts  --}%
        <div id="l1Post">
            <span  > Trending Topics </span>
        </div>
    %{--top 5 trending tpics --}%

        %{--<g:set var="i" value="1"></g:set>--}%
        <g:each  in="${trending}" >
            %{--<g:if test="${i++ < "6"}">--}%
                <div id="trendingTopics" class="subs">
                    <div class="mg"  >
                        <asset:image id="pic"  src="profile/${it.user.userName}.jpeg"></asset:image>
                    </div>
                    <div class="heading">
                        <h5>
                            <g:link controller="topicShowPage" action="index" params="${[id:it.id]}"> ${it.topicName}</g:link>
                        </h5>
                    </div>
                    <div class="content">
                        <div class="sub_heads">
                            <span >@${it.user.userName}</span>
                            <span id="tp-2" >subscriptions</span>
                            <span  >posts</span>
                        </div>
                        <div class="sub_vals">
                            <g:if test="${com.rxlogix.Subscription.findByTopicAndUser(it , user) == null}">
                                <g:link controller="dashboard" action="changeSubscriptionType" params="[id: it.id, userid: user.id, isSubscribed:false]">
                                    Subscribe
                                </g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="dashboard" action="changeSubscriptionType" params="[id: it.id, userid: user.id, isSubscribed: true]">
                                    Unsubscribe
                                </g:link>
                            </g:else>

                            <a   id="tp-3" href="#"> ${com.rxlogix.Subscription.countByTopic(it)} </a>
                            <a  id="tp-32" class="tp-3" href="#">${com.rxlogix.Topic.countByTopicName(it.topicName)}</a>
                        </div>
                    </div>
                    <div class="footer">
                        <span>

                        <g:form  controller="subscription" action="updateSubscription">
                            %{--${com.rxlogix.Subscription.findByUserAndTopic(user , it).seriousness}--}%

                            <g:select onChange="submit()" name="seriousnessSelected" from="${com.rxlogix.Subscription.Seriousness.values()}" value="" />

                            <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                        </g:form>
                        </span>

                        <span>
                            <g:if test="${user.admin == true}">
                                <span >
                                    <g:form  controller="admin" action="updateVisibility">
                                        <g:select id="forVisibility" onChange="submit()" name="visibilitySelected" from="${com.rxlogix.Topic.Visibility.values()}" value="${com.rxlogix.Topic.findByUserAndTopicName(it.user , it.topicName).visibility}"></g:select>
                                        <g:hiddenField name="topicId" value="${it.id}"></g:hiddenField>
                                    </g:form>

                                </span>
                                <span>
                                    <g:link controller="admin" action="deleteTopic" params="${[delId:it.id]}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg>
                                    </g:link>
                                </span>
                                <span>
                                    <g:link  data-toggle="modal" data-target="#edit1" controller="admin" action="editTopic" params="${[editId:it.id]}">
                                    %{--<a data-toggle="modal" data-target="#edit1" href="#" style=" padding-top: 20px; padding-left: 20px;">--}%
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg>
                                    %{--</a>--}%
                                    </g:link>
                                </span>
                            </g:if>
                        </span>
                        <span>
                            <a data-toggle="modal" data-target="#sendInvitation1"  href="#" style=" padding-top: 20px; padding-left: 20px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                                </svg>
                            </a>
                        </span>
                    </div>
                </div>
            %{--</g:if>--}%
        </g:each>

        </div>

        %{--r1 --}%
        %{--reading items of resources--}%
        <div class="col">
            <span> Inbox</span>
            <span ><input  type="search" placeholder="search"></span>
            <span> <button type="button" class="btn btn-primary  ">Search</button></span>
        <br><br>
        %{--<g:set var="i" value="1"></g:set>--}%
        <g:each in="${notRead}">
            <g:if test="${it.isRead == false}">
            <div id="inboxDiv" class="subs">
                <div class="mg"  >
                    <asset:image id="pic"  src="profile/${it.user.userName}.jpeg"/>
                </div>
                <div class="heading">
                    <span>${it.user.firstName} ${it.user.lastName}</span>
                    <span>@${it.user.userName}</span>
                    <span><g:link controller="topicShowPage" action="index" params="${[id:it.resource.topic.id]}"> ${it.resource.topic.topicName} </g:link></span>
                </div>
                <div class="content">
                    <p>write text here</p>
                </div>
                <br>
                <div class="footer">
                    <g:if test="${com.rxlogix.Resources.findByTopicAndUser(it.resource.topic , it.user)}">
                        <span  ><g:link controller="dashboard" action="viewFullSite" params="${[readId: it.id]}"  >View full site</g:link> </span>
                    </g:if>
                    <g:else>
                        <span  ><g:link  >Download</g:link> </span>
                    </g:else>
                    %{--<g:if test="${com.rxlogix.DocumentResource.findByTopic(it.resource.topic)}">--}%
                        %{--<span  ><g:link  >Download</g:link> </span>--}%
                    %{--</g:if>--}%
                    %{--<g:if test="${com.rxlogix.LinkResource.findByTopic(it.resource.topic)}">--}%
                        %{--<span  ><g:link controller="dashboard" action="viewFullSite" params="${[readId: it.id]}"  >View full site</g:link> </span>--}%
                    %{--</g:if>--}%
                    <span  ><g:link controller="dashboard" action="markAsread" params="${[readId:it.id]}" >Mark as read</g:link> </span>
                    <span><g:link controller="post" action="index" params="${[id:it.resource.topic.id]}"  >View post</g:link> </span>
                </div>
            </div>
            </g:if>
        </g:each>
    </div>
  %{--</div>--}%
        <div class="w-100"></div>
        %{--<div class="col">Column</div>--}%
        %{--<div class="col">Column</div>--}%

</div>
%{--write dvi boxes here--}%



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


%{--<div class="container">--}%
    %{--<div class="row">--}%
        %{--<div class="col">Column</div>--}%
        %{--<div class="col">Column</div>--}%
        %{--<div class="w-100"></div>--}%
        %{--<div class="col">Column</div>--}%
        %{--<div class="col">Column</div>--}%
    %{--</div>--}%
%{--</div>--}%


</body>

</html>
