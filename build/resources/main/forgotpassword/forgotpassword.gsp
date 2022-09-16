<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>forgot password</title>
    <asset:stylesheet src="css/forgotpassword.css"></asset:stylesheet>
</head>
<body>

<g:form controller="forgotpassword" action="resetPassword">
    <div class="login-form">
        <h2>Change Passowrd</h2>
        <form class="" action="index.html" method="post">

            <label for="">User Name </label>
            <input type="text" name="username" value="" placeholder="User Name">

            <label for="">Password *</label>
            <input type="text" name="password" value="" placeholder="Passowrd">

            <label for="">Confirm Password *</label>
            <input type="text" name="confirmpassword" value="" placeholder="Confirm Password">
            <button type="submit" name="button">Update</button>
        </form>
    </div>
</g:form>
</body>
</html>
