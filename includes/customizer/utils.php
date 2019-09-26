<?php

function create_text_field($wp_customize, $section, $field, $label, $default){
    $wp_customize->add_setting($section . '__' . $field, array(
        'default'           =>          $default,
        'type'              =>          'theme_mod'
    ));
    
    $wp_customize->add_control($section . '__' . $field, array(
        'label'             =>          $label,
        'section'           =>          $section,
        'priority'          =>          1
    ));
}
function create_section($wp_customize, $section, $label, $description){
    $wp_customize->add_section($section, array(
        'title'             =>      $label,
        'description'       =>      $description,
        'priority'          =>      130 
    ));
}