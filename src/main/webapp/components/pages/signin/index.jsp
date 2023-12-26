<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in</title>
    <link rel="stylesheet" href="./index.css" />
    <link rel="icon" href="../../assets/images/drops.png" />
    
</head>
<body>
    <nav>
        <div>
            <a href="">
                <img src="../../assets/images/logo.png" class="nav-img" alt="Error" />
            </a>
        </div>
        <div class="nav_container">
            <div class="borderCSS">
                <a href="../../../index.jsp#nav">HOME</a>
                <a href="../../../index.jsp#division-2">ARTICLES</a>
                <a href="../../../index.jsp#division-3">SUMMARY</a>
                <a href="../../../index.jsp#division-4">TEAM</a>
                <a href="../../../index.jsp#division-5">ABOUT</a>
            </div>
        </div>
        <div class="tools">
            <a href="../Donation_Form/index.jsp" id="Donate_now">
                <button id="donate">DONATE NOW</button>
            </a>
            <a href="./index.jsp" id="login">
                <button>LOGIN</button>
            </a>
            <a href="../signup/index.jsp" id="signup">
                <button>SIGNUP</button>
            </a>
        </div>
    </nav>
    <div class="page">
       
            
           
                
                 <form action="Signin.jsp" method="POST">
                    <div class="form">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email"/>
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password"/>
                        <input type="submit" id="submit" value="Log In" />
                    </div>
                </form>
 
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js"></script>
    <script src="./index.js"></script>
</body>
</html>