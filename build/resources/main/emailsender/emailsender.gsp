<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Email Sender </title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<div id="content" role="main">
    <section class="row colset-2-its">
        <g:if test="${flash.message}">
            <div class="message" role="alert">
                ${flash.message}
            </div>
        </g:if>
        <h2> Please enter your e-mail to reset your password. </h2>

        <g:form controller = "Emailsender" action="send">
            <br>
            <br>
            <div class="fieldcontain">
                <g:textField name="address" placeholder=" Enter your  e-mail Address " required="" />
            </div>
            %{--<div class="fieldcontain">--}%
                %{--<g:textField name="subject" placeholder="Your Subject" required="" />--}%
            %{--</div>--}%
            %{--<div class="fieldcontain">--}%
                %{--<g:textArea name="body" rows="5" cols="80" placeholder="Your message" required="" />--}%
            %{--</div>--}%
            <fieldset>
                <g:submitButton  name="send" value="Send" />
            </fieldset>
        </g:form>
    </section>
</div>

</body>
</html>