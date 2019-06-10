var $form_modal = $('.cd-user-modal'),
$form_login = $form_modal.find('#cd-login'),
$form_signup = $form_modal.find('#cd-signup'),
$form_forgot_password = $form_modal.find('#cd-reset-password'),
$form_modal_tab = $('.cd-switcher'),
$tab_login = $form_modal_tab.children('li').eq(0).children('a'),
$tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
$forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
$back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),
$connect_item = $('.connect-item');

$('.cd-user-modal').addClass('is-visible'); 
$form_login.addClass('is-selected');
$form_signup.removeClass('is-selected');
$form_forgot_password.removeClass('is-selected');
$tab_login.addClass('selected');
$tab_signup.removeClass('selected');