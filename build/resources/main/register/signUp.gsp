<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>signUp</title>

    <g:if env="development"><asset:stylesheet src="css/signUp.css"/></g:if>
    <asset:javascript src="js/signUp.js"></asset:javascript>


</head>
<body>

<g:uploadForm controller="register" action="registerUser">
%{--<g:form controller="register" action="registerUser">--}%
    <div class="signUp-form">
        <h1 id="linksharing" >Link Sharing</h1>
        <p>First Name *</p>
        <input type="text" name="firstName" placeholder="    Enter First Name " value="" required>
        <p>Last Name *</p>
        <input type="text" name="lastName" placeholder="   Enter Last Name " value=""required>
        <p>email *</p>
        <input type="email" name="email"  placeholder="   Enter Email" value="">
        <p>Username *</p>
        <input type="text" name="userName"  placeholder="   Enter your username" value="" required>
        <p>Password *</p>
        <input type="password" class="passwordMatch" name="password"  id="pass1" placeholder="    Password" value="" required>
        <p>Confirm Password *</p>
        <input type="password"  class="passwordMatch" name="confirmPassword" id="pass2" placeholder="    Confirm Password" value="" required>
        <p>Photo</p>
        <input type="file" name="image" value="">
        <button type="submit" name="register"  onclick = "matchPassword()" > Register </button>
    </div>
%{--</g:form>--}%
</g:uploadForm>

</body>
</html>
