<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sign-Up</title>
  <link rel="stylesheet" href="./index.css" />
  <link rel="icon" href="../../assets/images/drops.png" />
  <script>
    function validateForm() {
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;
      var name = document.getElementById("name").value;
      var bloodGroup = document.getElementById("blood_selector").value;
      var rh = document.getElementById("rh-selector").value;
      var address = document.getElementById("address").value;

      if (
        email.trim() === "" ||
        password.trim() === "" ||
        name.trim() === "" ||
        bloodGroup.trim() === "" ||
        rh.trim() === "" ||
        address.trim() === ""
      ) {
        alert("Please fill in all required fields marked with a red star (*).");
        return false; // Prevent form submission
      }

      return true; // Allow form submission
    }
  </script>
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
      <a href="../signin/index.jsp" id="login">
        <button>LOGIN</button>
      </a>
      <a href="./index.jsp" id="signup">
        <button>SIGNUP</button>
      </a>
    </div>
  </nav>
  <div class="page">
    <div class="container">
      <div class="left">
        <div class="login">Register User</div>
        <div class="eula">
          By Registering You also join the Team of our Heroes.
        </div>
      </div>
      <div class="right">
        <form action="Registration.jsp" method="POST" onsubmit="return validateForm();">
          <div class="form" id="signup-form">
            <div class="remain">
              <label for="email">Email<span class="red-star">*</span></label>
              <input type="email" id="email" name="email" />
              <label for="password">Password<span class="red-star">*</span></label>
              <input type="password" id="password" name="password" />
              <label for="name">Name<span class="red-star">*</span></label>
              <input type="text" id="name" name="name" />
              <div class="blood_div">
                <label for="blood-group">Blood-Group<span class="red-star">*</span>
                  <select id="blood_selector" name="blood_selector">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="AB">AB</option>
                    <option value="O">O</option>
                  </select>
                  <select id="rh-selector" name="rh-selector">
                    <option value="pos">+ (positive)</option>
                    <option value="neg">- (negative)</option>
                  </select>
                </label>
              </div>
              <br /><br />
              <label for="address">Address<span class="red-star">*</span></label>
              <input type="text" id="address" name="address"/>
              <div class="image-block"></div>
            </div>
            <input type="submit" id="submit" value="Register" />
          
          </div>
        </form>
        <div id="final_reference_div"></div>
      </div>
    </div>
  </div>
  <script src="./index.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js"></script>
</body>
</html>
