<?php

require get_template_directory() . '/includes/utils.php';
require get_template_directory() . '/includes/customizer/customizer.php';


function theme_scripts()
{
    /**
     * COMMON
     */

    wp_enqueue_style('style', get_stylesheet_uri(), null, microtime(), all);
    wp_enqueue_script('main', get_theme_file_uri('/js/main.js'), null, microtime(), true);

    /**
     * FOR EACH PAGE
     */

    global $post;
    if(is_page() || is_single()) {
        switch($post->post_name) {
            case 'example':
                wp_enqueue_script('page-example-js', get_theme_file_uri('/js/page-example.js'), null, microtime(), true);
                break;
        }
    }
}


add_action('wp_enqueue_scripts', 'theme_scripts');



function theme_head(){ ?>
<!-- <link rel="shortcut icon" href="<?php echo get_theme_file_uri();?>/assets/icon.png"> -->
<?php 
}

add_action('wp_head','theme_head');