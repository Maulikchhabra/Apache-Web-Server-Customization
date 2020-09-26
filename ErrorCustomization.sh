#! /bin/bash

# This shell script provides error customization for apache web server


DIR="/etc/apache2"
if [ -d "$DIR" ] #if apache is installed on the system
then
    echo "Directory exists..."
    #checking if the desired modules are up or not
    en1='proxy (enabled by site administrator)'
    en2='proxy_http (enabled by site administrator)'
    proxystatus=`sudo a2query -m proxy`
    proxyhttpstatus=`sudo a2query -m proxy_http`
    
    #checking if the modules are up or not
    if [ "$proxystatus" == "$en1" ] && [ "$proxyhttpstatus" == "$en2" ]
    then
        echo "both the modules proxy and proxy_http are already running"
    elif [ "$proxyhhtpstatus" != "$en1" ] && [ "$proxystatus" == "$en1" ]
    then
        echo "mod proxy_http is not running"
        echo "starting mod proxy_http now...."
        sudo a2enmod proxy_http
    else
        echo "both the modules proxy and proxy_http are not running"
        echo "starting mod proxy and mod proxy_http now...."
        sudo a2enmod proxy
        sudo a2enmod proxy_http
    fi

else #apche is not installed
    echo "Apache Directory Not found !"
    exit 1
fi

#creating file for handling 404 error
echo "Creating file for handling 404 errors"
sudo sh -c 'echo "<html>
<head>
    <link href=\"https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">


 <style type=\"text/css\">
  	
body {
background-color: white;
}
/*
#0A0A0A
*/
hr {
    
    margin-bottom: 1rem;
    border: 0;
    border-top: 2px solid rgba(255, 255, 255, 0.1);
}


input {
	width: 300px;
	height: 45px;
	padding: 10px;
	border: 4px solid #B4100B;
	border-radius:1px;
	font-size:0.9rem;
}

input::hover {
	border: 4px solid black;
}




span.err-error {
    text-transform: uppercase;
    font-size: 7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    letter-spacing: 25px;

}

span.err-status {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: black;
    letter-spacing: 10px;
}
/*
#CECECE
*/

span.err-statuscode {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #696969;
    letter-spacing: 10px;
}
span.err-junk {
    text-transform: uppercase;
    font-size: 1em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #CECECE;
    letter-spacing: 10px;
}

span.err-boxed {
	font-size: 1.3rem;
    border: 2px solid rgba(255, 255, 255, 0.1);
    text-transform: uppercase;
    font-family: 'Rajdhani';
    font-weight: 600;
    letter-spacing: 7px;
    padding: 0px 6px 0px 6px;
    margin: 0px 25px 0px 0px;
}
span.err-boxed.wht{
    color: #000;
    background-color:#CECECE;
}
span.err-boxed.red{
    border: 0px solid rgba(255, 255, 255, 0.1);
    color: #000;
    background-color:#B4100B;
    margin-left: -20px;
}
.err-container {
        margin: 5% 50% 0 25%;
        width: 50%;
        display: block;
        padding: 80px 0;

      
}

a.err-link {
    text-align: center;
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;

}

p {
	
    text-transform: uppercase;
    font-size: 1.2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

a.err-link:hover{
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    
    color: black;
    letter-spacing: 10px;
    font-weight: 700;
    text-decoration: line-through;
}
  </style>
</head>
<body>
<div class=\"err-container\">
<br>
<br>
<span class=\"err-status\">Status </span><span class=\"err-statuscode\"> not found</span>
<hr>
<span class=\"err-error\">error-404</span> 

<hr>
<!--<span class=\"err-boxed\" style=\"color: #B4100B; letter-spacing: normal;\"><b>E</b>--></span><span class=\"err-boxed wht\">The page you are looking for does not exist</span>
<hr>
<hr>

<a href=\"index.html\" class=\"err-link\">[go back]</a>
<p>OR just</p>
<div class=\"search-box\">
<form id=\"sarchform\" class=\"search2\" method=\"get\" action=\"index.html\">
<input type=\"search\" id=\"test\" placeholder=\"Search for the page you are looking...\">
</form>
</div>

</div>

</body>

</html>" > /var/www/html/custom_404.html'

#creating file for handling 403 errors
echo "Creating file for handling 403 errors"
sudo sh -c 'echo "<html>
<head>
    <link href=\"https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">


 <style type=\"text/css\">
  	
body {
background-color: white;
}
/*
#0A0A0A
*/
hr {
    
    margin-bottom: 1rem;
    border: 0;
    border-top: 2px solid rgba(255, 255, 255, 0.1);
}


input {
	width: 300px;
	height: 45px;
	padding: 10px;
	border: 4px solid #B4100B;
	border-radius:1px;
	font-size:0.9rem;
}

input::hover {
	border: 4px solid black;
}


span.err-error {
    text-transform: uppercase;
    font-size: 7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    letter-spacing: 25px;

}

span.err-status {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: black;
    letter-spacing: 10px;
}
/*
#CECECE
*/

span.err-statuscode {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #696969;
    letter-spacing: 10px;
}
span.err-junk {
    text-transform: uppercase;
    font-size: 1em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #CECECE;
    letter-spacing: 10px;
}

span.err-boxed {
	font-size: 1.3rem;
    border: 2px solid rgba(255, 255, 255, 0.1);
    text-transform: uppercase;
    font-family: 'Rajdhani';
    font-weight: 600;
    letter-spacing: 7px;
    padding: 0px 6px 0px 6px;
    margin: 0px 25px 0px 0px;
}
span.err-boxed.wht{
    color: #000;
    background-color:#CECECE;
}
span.err-boxed.red{
    border: 0px solid rgba(255, 255, 255, 0.1);
    color: #000;
    background-color:#B4100B;
    margin-left: -20px;
}
.err-container {
        margin: 5% 50% 0 25%;
        width: 50%;
        display: block;
        padding: 80px 0;
}

a.err-link {
    text-align: center;
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

p {
	
    text-transform: uppercase;
    font-size: 1.2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

a.err-link:hover{
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    color: black;
    letter-spacing: 10px;
    font-weight: 700;
    text-decoration: line-through;
}
  </style>
</head>
<body>
<div class=\"err-container\">
<br>
<br>
<span class=\"err-status\">Status </span><span class=\"err-statuscode\"> forbidden</span>
<hr>
<span class=\"err-error\">error-403</span> 

<hr>
<!--<span class=\"err-boxed\" style=\"color: #B4100B; letter-spacing: normal;\"><b>E</b>--></span><span class=\"err-boxed wht\">You do not have permission to view this page</span>
<hr>
<hr>

<a href=\"index.html\" class=\"err-link\">[go back]</a>
<p>OR just</p>
<div class=\"search-box\">
<input type=\"text\" placeholder=\"Search for the page you are looking...\">
</div>
</div>
</body>
</html>" > /var/www/html/custom_403.html'

#creting file for handling 500 errors
echo "Creating file for handling 500 errors"
sudo sh -c 'echo "<html>
<head>
    <link href=\"https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">


 <style type=\"text/css\">
  	
body {
background-color: white;
}
/*
#0A0A0A
*/
hr {
    
    margin-bottom: 1rem;
    border: 0;
    border-top: 2px solid rgba(255, 255, 255, 0.1);
}
input {
	width: 300px;
	height: 45px;
	padding: 10px;
	border: 4px solid #B4100B;
	border-radius:1px;
	font-size:0.9rem;
}

input::hover {
	border: 4px solid black;
}

span.err-error {
    text-transform: uppercase;
    font-size: 7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    letter-spacing: 25px;

}

span.err-status {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: black;
    letter-spacing: 10px;
}
/*
#CECECE
*/

span.err-statuscode {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #696969;
    letter-spacing: 10px;
}
span.err-junk {
    text-transform: uppercase;
    font-size: 1em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #CECECE;
    letter-spacing: 10px;
}

span.err-boxed {
	font-size: 1.3rem;
    border: 2px solid rgba(255, 255, 255, 0.1);
    text-transform: uppercase;
    font-family: 'Rajdhani';
    font-weight: 600;
    letter-spacing: 7px;
    padding: 0px 6px 0px 6px;
    margin: 0px 25px 0px 0px;
}
span.err-boxed.wht{
    color: #000;
    background-color:#CECECE;
}
span.err-boxed.red{
    border: 0px solid rgba(255, 255, 255, 0.1);
    color: #000;
    background-color:#B4100B;
    margin-left: -20px;
}
.err-container {
        margin: 5% 50% 0 25%;
        width: 50%;
        display: block;
        padding: 80px 0;      
}

a.err-link {
    text-align: center;
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

p {
    text-transform: uppercase;
    font-size: 1.2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

a.err-link:hover{
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani'; 
    color: black;
    letter-spacing: 10px;
    font-weight: 700;
    text-decoration: line-through;
}
  </style>
</head>
<body>
<div class=\"err-container\">
<br>
<br>
<span class=\"err-status\">Status </span><span class=\"err-statuscode\"> internal server error</span>
<hr>
<span class=\"err-error\">error-500</span> 

<hr>
<!--<span class=\"err-boxed\" style=\"color: #B4100B; letter-spacing: normal;\"><b>E</b>--></span><span class=\"err-boxed wht\">server encountered an unexpected condition</span>
<hr>
<hr>
<a href=\"index.html\" class=\"err-link\">[go back]</a>
<p>OR just</p>
<div class=\"search-box\">
<input type=\"text\" placeholder=\"Search for the page you are looking...\">
</div>
</div>
</body>
</html>" > /var/www/html/custom_500.html'

#creating file for handling 501 errors
echo "Creating file for handling 501 errors"
sudo sh -c 'echo "<html>
<head>
    <link href=\"https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">
 <style type=\"text/css\">
body {
background-color: white;
}
/*
#0A0A0A
*/
hr {
    
    margin-bottom: 1rem;
    border: 0;
    border-top: 2px solid rgba(255, 255, 255, 0.1);
}
input {
	width: 300px;
	height: 45px;
	padding: 10px;
	border: 4px solid #B4100B;
	border-radius:1px;
	font-size:0.9rem;
}

input::hover {
	border: 4px solid black;
}
span.err-error {
    text-transform: uppercase;
    font-size: 7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    letter-spacing: 25px;
}

span.err-status {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: black;
    letter-spacing: 10px;
}
/*
#CECECE
*/

span.err-statuscode {
    text-transform: uppercase;
    font-size: 2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #696969;
    letter-spacing: 10px;
}
span.err-junk {
    text-transform: uppercase;
    font-size: 1em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #CECECE;
    letter-spacing: 10px;
}

span.err-boxed {
	font-size: 1.3rem;
    border: 2px solid rgba(255, 255, 255, 0.1);
    text-transform: uppercase;
    font-family: 'Rajdhani';
    font-weight: 600;
    letter-spacing: 7px;
    padding: 0px 6px 0px 6px;
    margin: 0px 25px 0px 0px;
}
span.err-boxed.wht{
    color: #000;
    background-color:#CECECE;
}
span.err-boxed.red{
    border: 0px solid rgba(255, 255, 255, 0.1);
    color: #000;
    background-color:#B4100B;
    margin-left: -20px;
}
.err-container {
        margin: 5% 50% 0 25%;
        width: 50%;
        display: block;
        padding: 80px 0;
}

a.err-link {
    text-align: center;
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

p {
	
    text-transform: uppercase;
    font-size: 1.2em;
    font-family: 'Rajdhani';
    font-weight: 500;
    color: #B4100B;
    font-weight: 700;
    letter-spacing: 10px;
    text-decoration: none;
}

a.err-link:hover{
    text-transform: uppercase;
    font-size: 1.7em;
    font-family: 'Rajdhani';
    color: black;
    letter-spacing: 10px;
    font-weight: 700;
    text-decoration: line-through;
}
  </style>
</head>
<body>
<div class=\"err-container\">
<br>
<br>
<span class=\"err-status\">Status </span><span class=\"err-statuscode\"> not implemented</span>
<hr>
<span class=\"err-error\">error-501</span> 
<hr>
<!--<span class=\"err-boxed\" style=\"color: #B4100B; letter-spacing: normal;\"><b>E</b>--></span><span class=\"err-boxed wht\">server cannot fulfil the request</span>
<hr>
<hr>

<a href=\"index.html\" class=\"err-link\">[go back]</a>
<p>OR just</p>
<div class=\"search-box\">
<input type=\"text\" placeholder=\"Search for the page you are looking...\">
</div>
</div>
</body>
</html>" > /var/www/html/custom_501.html'
