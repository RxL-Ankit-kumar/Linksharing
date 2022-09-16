<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title></title>
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <asset:stylesheet src="css/topicShow.css"></asset:stylesheet>
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
                <asset:image id="profileImage" src="profile/${topic.user.userName}.jpeg"/>
            </li>

            <li>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle bg-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${topic.user.firstName}
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
<br>

%{--place divs here --}%

<div class="container">
    <div class="row">

        %{--left 1st div l1 --}%
        <div class="col">

            <div class="subs">
                <div class="mg"  >
                    <span><asset:image id="pic"  src="profile/${topic.user.userName}.jpeg"></asset:image></span>
                </div>
                <div class="heading">
                    <span> <a href="../Dashboard/topicShowPage">${topic.topicName}</a></span>
                    <span>  (${topic.visibility})</span>
                </div>
                <div class="content">
                    <div class="sub_heads">
                        <span >@${topic.user.userName}</span>
                        <span id="tp-2" >subscriptions</span>
                        <span  >posts</span>
                    </div>
                    <div class="sub_vals">
                        <g:if test="${com.rxlogix.Subscription.findByTopicAndUser(topic, topic.user) == null}">
                            <g:link controller="dashboard" action="changeSubscriptionType" params="[id:topic.id, userid: topic.user.id, isSubscribed:false]">
                                Subscribe
                            </g:link>
                        </g:if>
                        <g:else>
                            <g:link controller="dashboard" action="changeSubscriptionType" params="[id: topic.id, userid: topic.user.id, isSubscribed: true]">
                                Unsubscribe
                            </g:link>
                        </g:else>

                        <a   id="tp-3" href="#"> ${com.rxlogix.Subscription.countByTopic(topic)} </a>
                        <a  id="tp-32" class="tp-3" href="#">${com.rxlogix.Topic.countByTopicName(topic.topicName)}</a>
                    </div>
                </div>
                <div class="footer">
                    <span>
                        <g:form class="mt-2 ml-2" controller="subscription" action="updateSubscription">
                            <g:select onChange="submit()" name="seriousnessSelected" from="${com.rxlogix.Subscription.Seriousness.values()}" value="${com.rxlogix.Subscription.findByUserAndTopic(topic.user ,topic ).seriousness}" />
                            <g:hiddenField name="topicId" value="${topic.id}"></g:hiddenField>
                        </g:form>
                    </span>
                    <span>
                        <a data-toggle="modal" data-target="#sendInvitation2" href="#" style=" padding-top: 20px; padding-left: 20px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="white" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                            </svg>
                        </a>
                    </span>
                </div>
            </div>

        <br>
        %{--start your below user details here --}%
        <g:each in="${com.rxlogix.Topic.findAllByTopicName(topic.topicName)}">
            <div id="usersOftopic" class="subs">
                <div class="mg"  >
                    <asset:image id="pic"  src="profile/${it.user.userName}.jpeg"></asset:image>
                </div>
                <div class="heading">
                    <h4>${it.user.firstName} ${it.user.lastName}</h4>
                    <h6>@${it.user.userName}</h6>
                </div>
                <div class="content">
                    <div id="heads">
                        <span>subscriptions</span>
                        <span>Topics</span>
                    </div>
                    <div id="vals">
                        <a href="../Dashboard/subscribedTopicList"> ${com.rxlogix.Subscription.countByUser(it.user)} </a>
                        <a href="../Dashboard/topicList">${it.user.topics.size()}</a>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
        %{--right 1st div  r1--}%
        <div class="col">

               <span>Posts : ${topic.topicName} </span>
               <span>
                   <input type="search" placeholder="search here" >
               </span>
       <br><br>
        <g:each in="${com.rxlogix.ReadingItem.findAllByUser(topic.user)}">
            <div id="postsOfTopic" class="subs">
                <div class="mg"  >
                    <asset:image id="pic"  src="profile/${it.user.userName}.jpeg"></asset:image>
                </div>
                <div class="heading">
                    <p> write some text here</p>
                </div>
                <div class="content">
                    <div id="vals">

                        %{--<span><a href="../Dashboard/subscribedTopicList">download</a></span>--}%
                        %{--<span><a href="../Dashboard/topicList">view_full_site</a></span>--}%
                        %{--<span> <a href="../Dashboard/subscribedTopicList">mark_as_read</a></span>--}%
                        %{--<span><g:link controller="post" action="index" params="${[id:it.id]}" >view_post</g:link></span>--}%
                    </div>
                </div>
                <div>
                    <span id="footer">
                        <g:if test="${com.rxlogix.Resources.findByTopicAndUser(it.resource.topic , it.user)}">
                            <span  ><g:link controller="dashboard" action="viewFullSite" params="${[readId: it.id]}"  >View full site</g:link> </span>
                        </g:if>
                        <g:else>
                            <span  ><g:link  >Download</g:link> </span>
                        </g:else>
                    </span>
                    <span  ><g:link controller="dashboard" action="markAsread" params="${[readId:it.id]}" >Mark as read</g:link> </span>
                    <span><g:link controller="post" action="index" params="${[id:it.resource.topic.id]}"  >View post</g:link> </span>
               </div>
            </div>
        </g:each>



        %{--<div class="w-100"></div>--}%

        %{--<div class="col">--}%
       %{--</div>--}%
        %{--<div class="col">--}%
       %{--</div>--}%
</div>


<!-- modal for send invitation   -->
    <g:form controller="dashboard" action="sendInvitation">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="modal fade" id="sendInvitation2">
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


                                        <g:select name="topicSelected" from="${topic.user.topics.topicName}" value="${topic.topicName}" />

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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>

