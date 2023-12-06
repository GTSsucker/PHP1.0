<?php
session_start();
include "admin/connect.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Planet Shopify | Online Shopping Site for Men</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
    <link href='https://fonts.googleapis.com/css?family=Delius Swash Caps' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Andika' rel='stylesheet'>
    <link rel="stylesheet" href="style.css">
    <script>
    function searchProducts() {
        var searchTerm = document.getElementById('searchInput').value;

        // Make sure the search term is not empty
        if (searchTerm.trim() !== '') {
            // Use AJAX to send the search term to the server
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'search.php?term=' + encodeURIComponent(searchTerm), true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // Redirect to the appropriate page based on the server response
                    var response = xhr.responseText.trim();
                    if (response === 'watch') {
                        window.location.href = 'watch.php';
                    } else if (response === 'shirts') {
                        window.location.href = 'shirts.php';
                    } else if (response === 'shoes') {
                        window.location.href = 'shoes.php';
                    } else if (response === 'headphones') {
                        window.location.href = 'headphones.php';
                    } else {
                        // Handle other cases or show an error message
                        console.log('Product not found');
                    }
                }
            };

            xhr.send();
        }
    }
</script>
</head>
<body>
<!--header -->
 <?php
include 'includes/header_menu.php';
include 'includes/check-if-added.php';
?>
<div class="container" style="margin-top:65px">
         <!--jumbutron start-->
        <div class="jumbotron text-center">
            <h1>Welcome to Planet Shopify!</h1>
            <p>We have wide range of products for you.No need to hunt around,we have all in one place</p>
        </div>
        <!--jumbutron ends-->
        <!--breadcrumb start-->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Products</li>
            </ol>
        </nav>
        <!--breadcrumb end-->
    <hr/>
    <div class="row text-center" id="shirt">
    <?php
                   
                   $req="SELECT * FROM `products` WHERE Designiation= 't-shirt' ";                   
                   $result=$pdo->query($req);
                  $rows = $result->fetchAll(PDO::FETCH_OBJ);
                  
                  $result->closeCursor();
                  foreach($rows as $row){
                   echo"<div class='col-md-3 col-6 py-2'>
                   <div class='card'>";
                   echo"<img src='images/$row->image' alt='' class='img-fluid pb-1' >";
                   echo"<div class='figure-caption'>";
                   echo"<h6>$row->name</h6>";
                   echo"<h6>Price :DT $row->price</h6>";
                  if (!isset($_SESSION['email'])) {?>
                    <p><a href="index.php#login" role="button" class="btn btn-warning  text-white ">Add To Cart</a></p>
                    <?php
                    } else {
                    if (check_if_added_to_cart($row->id)) {
                     echo '<p><a href="#" class="btn btn-warning  text-white" disabled>Added to cart</a></p>';
                    } else {
                        echo "<p><a href='cart-add.php?id=".$row->id ." 'name='add' value='add' class='btn btn-warning  text-white'>Add to cart</a><p>";
                        
                        }
                    }
                   
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                  }
                  ?>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
  $('[data-toggle="popover"]').popover();
});
</script>
<?php if (isset($_GET['error'])) {$z = $_GET['error'];
    echo "<script type='text/javascript'>
$(document).ready(function(){
$('#signup').modal('show');
});
</script>";
    echo "<script type='text/javascript'>alert('" . $z . "')</script>";}?>
<?php if (isset($_GET['errorl'])) {$z = $_GET['errorl'];
    echo "<script type='text/javascript'>
$(document).ready(function(){
$('#login').modal('show');
});
</script>";
    echo "<script type='text/javascript'>alert('" . $z . "')</script>";}?>
</html>