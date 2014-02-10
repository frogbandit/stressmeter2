// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var starsFunction = function(){
	var star = $(this);
	var ratingNum = $(this).attr('id');
	var stars = $(this).attr('data-stars');
	for(i=1; i<=5; i++){
		if(i <= stars){
			$('#rating' + '-' + i).addClass('on');
		}else {
			$('#rating' + '-' + i).removeClass('on');
		}
	}
}

var descriptionsOfStress = ["   ", "Easy peasy lemon squeezy", "Just easy", "Normal stress", "A lotta stress", "I wanna kill myself"];
var descriptionsOfValue = ["   ", "Don't take this class", "I'll remember maybe one thing about this class...", "This class was decent", 
							"I liked this class; I would recommend it to my friends", "LIFE CHANGER"];


$(document).ready(function() {
	var starsClickedFirstSet = 0;
	var starsClickedFirstSet2 = 0;
	$('.rating_star').click(function() {
		var star = $(this);
		var ratingNum = $(this).attr('id');
		var stars = $(this).attr('data-stars');
		starsClickedFirstSet = stars;
		for(i=1; i<=5; i++){
			if(i <= stars){
				$('#rating' + '-' + i).addClass('on');
			}else {
				$('#rating' + '-' + i).removeClass('on');
			}
		}
		$('#descriptionForStress').text(descriptionsOfStress[stars]);
	});
	$('.rating_star').hover(function() {
		var star = $(this);
		var ratingNum = $(this).attr('id');
		var stars = $(this).attr('data-stars');
		for(i=1; i<=5; i++){
			if(i <= stars){
				$('#rating' + '-' + i).addClass('on');
			}else {
				$('#rating' + '-' + i).removeClass('on');
			}
		}
		$('#descriptionForStress').text(descriptionsOfStress[stars]);
	}, function() {
		for(i=1; i<=5; i++){
			if(i <= starsClickedFirstSet){
				$('#rating' + '-' + i).addClass('on');
			}else {
				$('#rating' + '-' + i).removeClass('on');
			}
		}
		$('#descriptionForStress').text(descriptionsOfStress[starsClickedFirstSet]);
	});
	$('.rating_star2').click(function() {
		var star = $(this);
		var ratingNum = $(this).attr('id');
		var stars = $(this).attr('data-stars');
		starsClickedFirstSet2 = stars;
		for(i=1; i<=5; i++){
			if(i <= stars){
				$('#rating2' + '-' + i).addClass('on');
			}else {
				$('#rating2' + '-' + i).removeClass('on');
			}
		}		
		$('#descriptionForValue').text(descriptionsOfValue[stars]);
	});
	$('.rating_star2').hover(function() {
		var star = $(this);
		var ratingNum = $(this).attr('id');
		var stars = $(this).attr('data-stars');
		for(i=1; i<=5; i++){
			if(i <= stars){
				$('#rating2' + '-' + i).addClass('on');
			}else {
				$('#rating2' + '-' + i).removeClass('on');
			}
		}
		$('#descriptionForValue').text(descriptionsOfValue[stars]);
	}, function() {
		for(i=1; i<=5; i++){
			if(i <= starsClickedFirstSet2){
				$('#rating2' + '-' + i).addClass('on');
			}else {
				$('#rating2' + '-' + i).removeClass('on');
			}
		}
		$('#descriptionForValue').text(descriptionsOfValue[starsClickedFirstSet2]);
	});

	var data_stress = $('#stressLevelDescription').attr('data-stress');
	$('#stressLevelDescription').text(descriptionsOfStress[data_stress]);
	var data_value = $('#valueLevelDescription').attr('data-value');
	$('#valueLevelDescription').text(descriptionsOfValue[data_value]);
});