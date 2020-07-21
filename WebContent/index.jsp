<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" style="background-image: url('img/beerbg_dark.jpg'); background-size: 100% 100%; "> 
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <title>KULKKEOK KULKKEOK</title>
 <link rel="icon" href="img/favicon.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

</head>
<body style="background-image: url('img/beerbg_dark2.jpg'); background-size: 100% 100%; ">
<div class="js">
<div class="container"> 
  <!-- AccessBox section -->
  <div id="accessbox"class="animated bounceInDown"> <img class="profile-img" src="img/logo.png" width="180px" style="filter: invert();"/>
    <h2 class="text-center">당신은 만 19세 이상입니까?</h2>
    <!-- Form section-->
    <div style="margin: 0 auto; text-align:center">
      <input type="button" name="yes"  class="btn btn-danger" value="네" style="width:150px" onclick="location.href='main.do?command=main'">
      <input type="button" name="no"  class="btn btn-danger" value="아니오" style="width:150px" onclick="location.href='index_failed.jsp'">
    <br>
  </div>
    <!-- Form section-->
  </div>
  <!-- AccessBox section --> 
</div>
<!-- /container --> 
<!-- JS files--> 
<script src="js/bootstrap.min.js"></script> 
</div>
</body>
</html>