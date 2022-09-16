<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>signUp</title>

    <g:if env="development"><asset:stylesheet src="css/signUp.css"/></g:if>
   <asset:stylesheet src="css/editprofile.css"></asset:stylesheet>

</head>
<body>

<g:uploadForm controller="profile" action="editProfileInfo">
    <div class="signUp-form">
        <h2 id="linksharing" >Profile</h2>
        <p>First Name *</p>
        <input type="text" name="firstName" placeholder="    Enter First Name " value="" >
        <p>Last Name *</p>
        <input type="text" name="lastName" placeholder="   Enter Last Name " value="">
        <p>Username *</p>
        <input type="text" name="userName"  placeholder="   Enter your username" value="" >
        <p>Photo</p>
        <input type="file" name="image" value="">
        <button type="submit" name=""   > Register </button>
</g:uploadForm>

<g:uploadForm controller="profile" action="editPassword">
        <div>
            <h2 id="linksharing" >Change Password</h2>
            <p>Password *</p>
            <input type="password" class="passwordMatch" name="password"  id="pass1" placeholder="    Password" value="" >
            <p>Confirm Password *</p>
            <input type="password"  class="passwordMatch" name="confirmPassword" id="pass2" placeholder="    Confirm Password" value="" >
            <button type="submit" name=""   > Update </button>
        </div>
    </div>
</g:uploadForm>


%{--</g:form>--}%


</body>
</html>
