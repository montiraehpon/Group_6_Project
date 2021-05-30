<?php
session_start();

require_once '../../BusinessServicesLayer/medController/medController.php';

$med = new medController();

if(!isset($_SESSION["loggedin"])){
  header("location: ../../ApplicationLayer/Home/Homepage.php");
  exit;
}

if(isset($_POST["variation"])){
  $med->med_getVariation();  
}

if(isset($_POST['getData'])){
  $output = $med->med_viewAll();
  echo $output;
  exit;
}

?>
<html>
<head>
  <title>Medicine Variation</title>
  <link href="../../css/design.css" rel="stylesheet" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
    $("#cus_button").click(function() {
    $(".cus_form").show();
      });
    });

    $(document).mouseup(function (e) { 
      if ($(e.target).closest(".cus_form").length 
            === 0) { 
        $(".cus_form").hide(); 
      } 
    }); 

  </script>
</head>
<body bgcolor="#ffcccc">
  <table id="top" height="9%" width="100%">
    <tr>
      <th align="left" height="5%" valign="top" width="25%"> <img src="../../images/GUIImages/courier.png" width="25" height="25"> Speeda</th>
      <th align="center" colspan="2" width="50%"> 100% Guaranteed Dispatch </th>
      <th align="right"> <button type="button" id="cus_button" style="border:transparent;background:none;">
                <img src="../../images/GUIImages/user.png" style="width:20px;height:20px;border:0"/></button> 
      </th>

      <div class="cus_form">
        <form action="/action_page.php" class="form-container">
          <a href="../ManageUser/CustomerProfile.php"> <img src="../../images/GUIImages/gear.png" style="width:20px;border:0;vertical-align: middle;"/> My Account </a> <br>
          <a href="../ManagePayment/ViewCart.php"> <img src="../../images/GUIImages/supermarket.png" style="width:20px;border:0;vertical-align: middle;"/> My Cart </a> <br>
          <a href="../ProvideTrackingAndAnalysis/MyPurchase.php"> <img src="../../images/GUIImages/sales.png" style="width:20px;border:0;vertical-align: middle;"/> My Purchase </a> <br>
          <a href="../ProvideTrackingAndAnalysis/TrackOrder.php"> <img src="../../images/GUIImages/road.png" style="width:20px;border:0;vertical-align: middle;"/> Track Order </a> <br>
          <a href="../ManageUser/Logout.php"> <img src="../../images/GUIImages/logout.png" style="width:20px;border:0;vertical-align: middle;"/> Logout </a> <br>
        </form>
      </div>

    </tr>
    <tr>
      <td></td>
      <td colspan="2" align="center"> <a href="../ManageUser/CustomerHomepage.php" style="margin-right: 40px">Home</a> <a href="../ManagePayment/ViewCart.php" style="margin-right: 40px">My Cart</a> <a href="../ProvideTrackingAndAnalysis/MyPurchase.php" style="margin-right: 40px">My Purchase</a> <a href="../ProvideTrackingAndAnalysis/TrackOrder.php" style="margin-right: 40px">Track Order</a></td></td>
      <td align="center">Welcome <?=$_SESSION['name']?>! (Customer)</td>
    </tr>
  </table>
  <form action="" method="POST">
  <table id="detail" width="100%" height="70%" align="center">
    <tr>
      <td colspan="4" align="center" style="height: 1%"><h3>Medicine Variation</h3></td>
    </tr>
    <tr align="center" style="height: 20%"> <hr>
      <td colspan="2">
        /Perfective maintenance - Add new function
        <button type="submit" name="variation" value="Vitamin" style="width: 200px;height: 100px"> Vitamin<br> <br> <img src="../../images/GUIImages/vitamin.png" style="width:50px;height:50px;border:0"/>  </button>

        <button type="submit" name="variation" value="Personal" style="width: 200px;height: 100px"> Personal Care <br> <br> <img src="../../images/GUIImages/toiletries.png" style="width:50px;height:50px;border:0"/>  </button>

        <button type="submit" name="variation" value="Food" style="width: 200px;height: 100px"> Health Food<br> <br> <img src="../../images/GUIImages/protein-shake.png" style="width:50px;height:50px;border:0"/>  </button>

        <button type="submit" name="variation" value="Tool" style="width: 200px;height: 100px"> Health Tool<br> <br> <img src="../../images/GUIImages/aid.png" style="width:50px;height:50px;border:0"/>  </button>
      </td>
    </tr>
    <tr>
      /Perfective Maintenance - Add new function
      <td align="right" style="height: 1%" >Price: <select id="price">
          <option value="none">None</option>
          <option value="asc">Low to High</option>
          <option value="desc">High to low</option>
          </select>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
          Search: <input type="text" size="20" id="search_box" placeholder="Search In Medicine">
        </td>
    </tr>
    <tr>
      <td colspan="3" style="height: auto">
        <div id="med_Allproduct"></div>
      </td>
    </tr>
    <tr>
      <td colspan="4" style="height: 1%"><button type="button" name="back" onclick="window.location.href='../ManageUser/CustomerHomepage.php'"> Back </button></td>
    </tr>
  </table>
  </form>
  <table id="bottom" height="15%" width="100%">
    <tr> <hr>
      <td valign="center" rowspan="2" width="10%">
        <ul style="list-style-type:none;">
        <li><a href="../../ApplicationLayer/Home/Homepage.php">Home</a></li>
        <li><a href="../../ApplicationLayer/Home/CustomerSignup.php">Sign up</a></li>
        <li><a href="../../ApplicationLayer/Home/Login.php">Login</a></li>
        <li><a href="../../ApplicationLayer/Home/Faq.php">FAQ</a></li>
        </ul>
      </td>
      <td valign="center" rowspan="2">
        <ul style="list-style-type:none;">
        <li><a href="../../ApplicationLayer/Home/About.php">About us</a></li>
        <li><a href="../../ApplicationLayer/Home/RunnerSignup.php">Become a Runner</a></li>
        <li><a href="../../ApplicationLayer/Home/SPSignup.php">Become a Service Provider</a></li>
        <li><a href="../../ApplicationLayer/Home/Terms.php">Terms & Conditions</a></li>
        </ul>
      </td>
      <td align="center" width="25%" valign="bottom"> Follow us in </td>
    </tr>
    <tr>
      <td align="center" width="25%">
        <button type="button" style="border:transparent;background:none;" onclick="location.href='http://www.facebook.com'">
        <img src="../../images/GUIImages/facebook.png" style="width:25px;height:25px;border:0"/>
        </button>
        <button type="button" style="border:transparent;background:none;" onclick="location.href='http://www.twitter.com'">
        <img src="../../images/GUIImages/twitter.png" style="width:25px;height:25px;border:0"/>
        </button> 
        <button type="button" style="border:transparent;background:none;" onclick="location.href='http://www.instagram.com'">
        <img src="../../images/GUIImages/instagram.png" style="width:25px;height:25px;border:0"/>
        </button> </td>
    </tr>
    <tr>
      <td align="center" colspan="4"> Speeda Sdn.Bhd (1234567-T) &#169; All Rights Reserved</td> 
    </tr>
  </table>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

    $("#cus_button").click(function() {
    $(".cus_form").show();
      });
    });

    $(document).mouseup(function (e) { 
      if ($(e.target).closest(".cus_form").length 
            === 0) { 
        $(".cus_form").hide(); 
      } 
    }); 

    $(document).ready(function(){
    load_data(2, 1, "none");

    function load_data(getData, page, sortPrice = '', search = ''){
      $.ajax({
        url:'MedVariation.php',
        method:"POST",
        data:{getData:getData, page:page, sortPrice:sortPrice, search:search},
        success:function(data){
        $('#med_Allproduct').html(data);

        }
      });
    }

    $(document).on('click', '.page-link', function(){
      var page = $(this).data('page_number');
      var search = $('#search_box').val();
      var sortPrice = $('#price').val();
      load_data(2, page, sortPrice, search);
    });

    $('#search_box').keyup(function(){
      var search = $('#search_box').val();
      var sortPrice = $('#price').val();
      load_data(2, 1, sortPrice,search);
    });

    $(document).on('change', '#price', function(){
      var search = $('#search_box').val();
      var sortPrice = $('#price').val();
      load_data(2, 1, sortPrice, search);  
    });

    });

  </script>
