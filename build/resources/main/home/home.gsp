<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Link Sharing Home Page</title>
    %{--<link rel="stylesheet" href="home.css">--}%
    <asset:stylesheet src="css/home.css"/>
</head>

<body>

<div class="main">
    <div class="navbar">

        <div class="icon">
            <h2 class="logo">Linksharing</h2>
        </div>

        <div class="menu">
            <ul>
                <li>
                    %{--<a href="#">Home</a>--}%
                    <g:link controller="home" action="index">Home</g:link>

                </li>
                %{--<li>--}%
                    %{--<a href="/home/rxlogix/Desktop/UI pages/login.html">Login</a>--}%
                %{--</li>--}%
                <li>
                    %{--<a href="#">Register</a>--}%
                    <g:link controller="register" action="index">Register</g:link>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>

        <div class="search">
            <input class="srch" type="search" name="" value="" placeholder="type to text">
            <a href="#">
                <button class="btn" type="button" name="button">Search</button>
            </a>
        </div>

    </div>

    <div class="content">
        <h1>Link <span> Sharing</span> Site </h1>
        <p class="par"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            <br> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            <br> quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat.
        </p>

        <button type="button" name="button" class="cn">
            <a href="#"> JOIN US </a>
        </button>

        <g:form controller="login" action="loggedInUser">

        <div class="form">
            <h2>Login Here</h2>
            <input type="text" name="username" value="" placeholder="Enter user name Here" required>
            <input type="password" name="password" value="" placeholder="Enter Password Here" required>

            <button class="btnn" type="submit" name="">
                %{--<a href="#"> Login </a>--}%
                <p>Login</p>
            </button>
            %{--<g:link  controller="forgotpassword" action="index">--}%
            <a  id="forgot" href="${createLink(controller: 'emailsender' , action: 'index')}">
                Forgot Password
            </a>

            %{--</g:link>--}%

            <p class="link"> Don't have an account
                <br>
                <g:link controller="register" action="index">SignUp</g:link>
                </a>Here</a>
            </p>

        </div>
</g:form>

    </div>

</div>

</body>

</html>
