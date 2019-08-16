<?php

function scripts_setup()
{
    wp_enqueue_style('style', get_stylesheet_uri(), null, microtime(), all);
    wp_enqueue_script('main', get_template_directory_uri('/js/main.js'), null, microtime(), true);
}


add_action('wp_enqueue_scripts', 'scripts_setup');



function head_setup(){ ?>
    <!-- <link rel="shortcut icon" href="<?php echo get_template_directory_uri();?>/assets/icon.png"> -->
    <?php 
}

add_action('wp_head','head_setup');

