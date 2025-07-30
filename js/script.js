/**
 * WEBSITE: https://themefisher.com
 * TWITTER: https://twitter.com/themefisher
 * FACEBOOK: https://www.facebook.com/themefisher
 * GITHUB: https://github.com/themefisher/
 */

(function ($) {
	'use strict';

	$(window).scroll(function () {
		if ($('.navigation').offset().top > 100) {
			$('.navigation').addClass('fixed-nav');
		} else {
			$('.navigation').removeClass('fixed-nav');
		}
	});


	$('.portfolio-gallery').each(function () {
		$(this).find('.popup-gallery').magnificPopup({
			type: 'image',
			gallery: {
				enabled: true
			}
		});
	});


	$('#contact-form').validate({
		rules: {
			user_name: {
				required: true,
				minlength: 2
			},
			user_email: {
				required: true,
				email: true
			},
			user_subject: {
			 	required: true
			},
			user_message: {
				required: true
			}
		},
		messages: {
			user_name: {
				required: 'Entrer un nom',
				minlength: 'Le nom doit être au minimum de 2 caractères'
			},
			user_email: {
				required: 'Entrer une adresse email'
			},
			user_subject: {
				required: 'Renseigner un objet du message'
			},
			user_message: {
				required: 'Message vide',
			}

		},
		submitHandler: function (form) {
			$(form).ajaxSubmit({
				type: 'POST',
				data: $(form).serialize(),
				url: 'sendmail.php',
				success: function () {
					$('#contact-form #success').fadeIn();
				},
				error: function () {

					$('#contact-form #error').fadeIn();
				}
			});
		}
	});



	$('.testimonial-slider').slick({
		slidesToShow: 1,
		infinite: true,
		arrows: false,
		autoplay: true,
		autoplaySpeed: 5000,
		dots: true
	});




	// Init Magnific Popup
	$('.portfolio-popup').magnificPopup({
		delegate: 'a',
		type: 'image',
		gallery: {
			enabled: true
		},
		mainClass: 'mfp-with-zoom',
		navigateByImgClick: true,
		arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
		tPrev: 'Previous (Left arrow key)',
		tNext: 'Next (Right arrow key)',
		tCounter: '<span class="mfp-counter">%curr% of %total%</span>',
		zoom: {
			enabled: true,
			duration: 300,
			easing: 'ease-in-out',
			opener: function (openerElement) {
				return openerElement.is('img') ? openerElement : openerElement.find('img');
			}
		}
	});

})(jQuery);