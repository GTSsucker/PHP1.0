
<?php

// Define your product categories and their corresponding search terms
$productCategories = array(
    'watch' => array('watch', 'watch'),
    'shirts' => array('shirts', 'shirt'),
    'shoes' => array('shoes', 'shoes'),
    'headphones' => array('headphones', 'headphone', 'speakers', 'speaker')
);

// Get the search term from the GET request
$searchTerm = isset($_GET['term']) ? strtolower($_GET['term']) : '';

// Check if the search term matches any product category
$categoryMatch = null;
foreach ($productCategories as $category => $terms) {
    if (in_array($searchTerm, $terms)) {
        $categoryMatch = $category;
        break;
    }
}

// Return the product category as the response
echo $categoryMatch;

?>
