var selectedPhotoTitle;
var selectedPhotoTime;
var selectedPhotoFstop;								
var selectedPhotoExposure;								
var selectedPhotoISO;		
var selectedGeoTag;
var selectedAlbumId;
var selectedUserId;
var selectedToken;
var selectedPhotoId;
var selectedAlbumTitle;
var selectedTime;
var selectedModel;
var selectedTags;
var selectedPeople;
var selectedDescription;
var selectedIndex;


/***Clients Slider    */
 /*jQuery(function($){
	$('#carousel').elastislide({
				imageW 		: 110,
				margin		: 20,
				border		: 4,
				easing		: 'easeInBack'
			});
	  });	*/
/**  Twitter  Ticker**/
  /*  jQuery(function($){
        $("#ticker").tweet({
          username: "icanbeCreative",
          page: 1,
          avatar_size: 32,
          count: 20,
          loading_text: "loading ..."
        }).bind("loaded", function() {
          var ul = $(this).find(".tweet_list");
          var ticker = function() {
            setTimeout(function() {
              ul.find('li:first').animate( {marginTop: '-4em'}, 500, function() {
                $(this).detach().appendTo(ul).removeAttr('style');
              });
              ticker();
            }, 15000);
          };
          ticker();
        });
      });	*/
//Portfolio Gallery Image Hover
jQuery(document).ready(function(){
jQuery(function() {
	jQuery('ul.da-thumbs > li').hoverdir();
});
});

///Services  Blocks
/*$(function() {
				$('#sti-menu').iconmenu();
			});*/
			
//About img overlays
$(document).ready(function() 
{    
    $('.img-thumb').on('mouseover', function()
    {
        var overlay = $(this).find('.overlay-wrp');
        var content = $(this).find('.overlay-content');
        var top = parseInt(overlay.height() * 0.5 - 4);
        overlay.stop(true,true).fadeIn(200);
        content.stop().animate({'top': top}, 400);        
    }).on('mouseleave', function()
    {
        var overlay = $(this).find('.overlay-wrp');
        var content = $(this).find('.overlay-content');
        var top = parseInt(overlay.height() * 0.2);        
        content.stop().animate({'top': top}, 100);
        overlay.fadeOut(100);
    });
	 });
	
/*******Sticky Nav*******/
 $(window).load(function(){
	  /*   $("#navbar").sticky({ topSpacing: 0, className: 'sticky', wrapperClassName: 'my-wrapper' });*/
	    });
		
/***grid slidShow***/
            $(function() {
			
				var $ibWrapper	= $('#ib-main-wrapper'),
				 
					Template	= (function() {
							
							// true if dragging the container
						var kinetic_moving				= false,
							// current index of the opened item
							current						= -1,
							// true if the item is being opened / closed
							isAnimating					= false,
							// items on the grid
							$ibItems					= $ibWrapper.find('div.ib-main > a'),
							// image items on the grid
							$ibImgItems					= $ibItems.not('.ib-content'),
							// total image items on the grid
							imgItemsCount				= $ibImgItems.length,
							init						= function() {
								
								// add a class ib-image to the image items
								$ibImgItems.addClass('ib-image');
								// apply the kinetic plugin to the wrapper
								loadKinetic();
								// load some events
								initEvents();
						
							},
							
							loadKinetic					= function() {
								
								setWrapperSize();
								
								$ibWrapper.kinetic({
									moved	: function() {
										
										kinetic_moving = true;
										
									},
									stopped	: function() {
										
										kinetic_moving = false;
										
									}
								});
								
							},
							
							setWrapperSize				= function() {
								
								var containerMargins	= $('#ib-top').outerHeight(true) + $('#header').outerHeight(true) + parseFloat( $ibItems.css('margin-top') );
								$ibWrapper.css( 'height', $(window).height() - containerMargins )
								
							},
							
							initEvents					= function() {
							
								// open the item only if not dragging the container
								$ibItems.bind('click.ibTemplate', function( event ) {
									
									if( !kinetic_moving )
										openItem( $(this) );
								
									return false;	
								
								});
								
								// on window resize, set the wrapper and preview size accordingly
								$(window).bind('resize.ibTemplate', function( event ) {
									
									setWrapperSize();
									
									$('#ib-img-preview, #ib-content-preview').css({
										width	: $(window).width(),
										height	: $(window).height()
									})
									
								});
							
							},
							openItem					= function( $item ) {
								
								if( isAnimating ) return false;
								
								// if content item
								if( $item.hasClass('ib-content') ) {
									
									isAnimating	= true;
									current	= $item.index('.ib-content');
									loadContentItem( $item, function() { isAnimating = false; } );
									
								}
								// if image item
								else {
								
									isAnimating	= true;
									current	= $item.index('.ib-image');
									loadImgPreview( $item, function() { isAnimating = false; } );
									
								}
								
							},
							// opens one image item (fullscreen)
							loadImgPreview				= function( $item, callback ) {
								
								selectedPhotoTitle = $item.children('img').attr('data-photoTitle');
								selectedPhotoTime = $item.children('img').attr('data-photoTime');
								selectedPhotoFstop = $item.children('img').attr('data-photoFstop');
								selectedPhotoExposure = $item.children('img').attr('data-photoExposure');
								selectedPhotoISO = $item.children('img').attr('data-photoISO');
								selectedGeoTag = $item.children('img').attr('data-geoTag');
								selectedPhotoId = $item.children('img').attr('data-photoId');
								selectedAlbumId = $item.children('img').attr('data-albumId');
								selectedAlbumTitle =$item.children('img').attr('data-photoAlbumTitle');
								selectedTime =$item.children('img').attr('data-photoTime');
								selectedModel =$item.children('img').attr('data-photoModel');
								selectedTags =$item.children('img').attr('data-photoTags');
								selectedPeople =$item.children('img').attr('data-photoPeople');
								selectedDescription =$item.children('img').attr('data-photoDescription');
								selectedIndex =$item.children('img').attr('data-index');
								var largeSrc		= $item.children('img').data('largesrc'),
									description		= $item.children('span').text(),
									largeImageData	= {
										src			: largeSrc,
										description	: description
									};
								
//								showingTokenText(selectedIndex);
								
								$('.form-control').tokenfield('destroy');
								createTagToken();
								$('.form-control').tokenfield('setTokens', selectedTags);
								$('.form-control2').tokenfield('setTokens', selectedPeople);
								
//								if (selectedTags == "") {
//									console.log("1-1");
//									$('.form-control').tokenfield('destroy');
//									$('.form-control').val("");
//									createTagToken();
//								} else {
//									console.log("1-2");
//									$('.form-control').tokenfield('setTokens', selectedTags);
//								}
//								if (selectedPeople == "") {
//									console.log("2-1");
//									$('.form-control2').tokenfield('destroy');
//									$('.form-control2').val("");
//									createPeopleToken();
//								} else {
//									console.log("2-2");
//									$('.form-control2').tokenfield('setTokens', selectedPeople);
//								}
								
								// preload large image
								$item.addClass('ib-loading');
								
								preloadImage( largeSrc, function() {
									
									$item.removeClass('ib-loading');
									
									var hasImgPreview	= ( $('#ib-img-preview').length > 0 );
									
									if( !hasImgPreview ){
										largeImageData.src = largeSrc;
								
										$('#previewTmpl').tmpl( largeImageData ).insertAfter( $ibWrapper );
										
										$('#ib-img-preview').children('img.ib-preview-img')
										.attr( 'src', largeSrc )
										.end()
										.find('span.ib-preview-descr')
										.text( description );
	
									}else{

										$('#ib-img-preview').children('img.ib-preview-img')
															.attr( 'src', largeSrc )
															.end()
															.find('span.ib-preview-descr')
															.text( description );
									}	
									//get dimentions for the image, based on the windows size
									var	dim	= getImageDim( largeSrc );
									
									$item.removeClass('ib-img-loading');
									
									//set the returned values and show/animate preview
									$('#ib-img-preview').css({
										width	: $item.width(),
										height	: $item.height(),
										left	: $item.offset().left,
										top		: $item.offset().top
									}).children('img.ib-preview-img').hide().css({
										width	: dim.width,
										height	: dim.height,
										left	: dim.left,
										top		: dim.top
									}).fadeIn( 300 ).end().show().animate({
										width	: $(window).width(),
										left	: 0
									}, 500, 'easeOutExpo', function() {
									
										$(this).animate({
											height	: $(window).height(),
											top		: 0
										}, 400, function() {
										
											var $this	= $(this);
											$this.find('span.ib-preview-descr, span.ib-close, span.ib-modify', 'span.ib-delete').show()
											if( imgItemsCount > 1 )
												$this.find('div.ib-nav').show();
												
											if( callback ) callback.call();
										
										});
									
									});
									
									if( !hasImgPreview )
										initImgPreviewEvents();
									
								} );
								
							},
							// opens one content item (fullscreen)
							loadContentItem				= function( $item, callback ) {
								
								var hasContentPreview	= ( $('#ib-content-preview').length > 0 ),
									teaser				= $item.children('div.ib-teaser').html(),
									content				= $item.children('div.ib-content-full').html(),
									contentData			= {
										teaser		: teaser,
										content		: content
									};
									
								if( !hasContentPreview )
									$('#contentTmpl').tmpl( contentData ).insertAfter( $ibWrapper );
									
								//set the returned values and show/animate preview
								$('#ib-content-preview').css({
									width	: $item.width(),
									height	: $item.height(),
									left	: $item.offset().left,
									top		: $item.offset().top
								}).show().animate({
									width	: $(window).width(),
									left	: 0
								}, 500, 'easeOutExpo', function() {
								
									$(this).animate({
										height	: $(window).height(),
										top		: 0
									}, 400, function() {
										
										var $this	= $(this),
											$teaser	= $this.find('div.ib-teaser'),
											$content= $this.find('div.ib-content-full'),
											$close	= $this.find('span.ib-close'),
											$modify	= $this.find('span.ib-modify');
											$delete = $this.find('span.ib-delete');
											
										if( hasContentPreview ) {
											$teaser.html( teaser )
											$content.html( content )
											
										}
									
										$teaser.show();
										$content.show();
										$close.show();
										$modify.show();
										$delete.show();
										if( callback ) callback.call();
									
									});
								
								});
								
								if( !hasContentPreview )
									initContentPreviewEvents();	
								
							},
							// preloads an image
							preloadImage				= function( src, callback ) {
							
								$('<img/>').load(function(){
								
									if( callback ) callback.call();
								
								}).attr( 'src', src );
							
							},
							// load the events for the image preview : navigation ,close button, and window resize
							initImgPreviewEvents		= function() {
							
								var $preview	= $('#ib-img-preview');
								var $previewimg = $('.ib-preview-img');
								
								$previewimg.click(function(){
									closeImgPreview();
								})
								
								$preview.find('span.ib-nav-prev').bind('click.ibTemplate', function( event ) {
									
									navigate( 'prev' );
									
								}).end().find('span.ib-nav-next').bind('click.ibTemplate', function( event ) {
									
									navigate( 'next' );
									
								}).end().find('span.ib-modify').bind('click.ibTemplate', function( event ) {
									
									yoyo();
									
								}).end().find('span.ib-close').bind('click.ibTemplate', function( event ) {
									
									closeImgPreview();
									
								}).end().find('span.ib-delete').bind('click.ibTemplate', function( event ) {
									
									deleteImage();
									
								});
								
								//resizing the window resizes the preview image
								$(window).bind('resize.ibTemplate', function( event ) {
									
									var $largeImg	= $preview.children('img.ib-preview-img'),
										dim			= getImageDim( $largeImg.attr('src') );
									
									$largeImg.css({
										width	: dim.width,
										height	: dim.height,
										left	: dim.left,
										top		: dim.top
									})
									
								});
								
							},
							// load the events for the content preview : close button
							initContentPreviewEvents	= function() {
							
								$('#ib-content-preview').find('span.ib-close').bind('click.ibTemplate', function( event ) {
									
									closeContentPreview();
								});
								
								$('#ib-content-preview').find('span.ib-modify').bind('click.ibTemplate', function( event ) {
										
										yoyo();
						
								});
								
							},
							// navigate the image items in fullscreen mode
							navigate					= function( dir ) {
								
								if( isAnimating ) return false;
								
								isAnimating		= true;
								
								var $preview	= $('#ib-img-preview'),
									$loading	= $preview.find('div.ib-loading-large');
								
								$loading.show();
								
								if( dir === 'next' ) {
									
									( current === imgItemsCount - 1 ) ? current	= 0 : ++current;
									
								}
								else if( dir === 'prev' ) {
									
									( current === 0 ) ? current	= imgItemsCount - 1 : --current;
									
								}
								
								var $item		= $ibImgItems.eq( current ),
									largeSrc	= $item.children('img').data('largesrc'),
									description	= $item.children('span').text();
									
								preloadImage( largeSrc, function() {
									
									$loading.hide();
									
									//get dimentions for the image, based on the windows size
									var	dim	= getImageDim( largeSrc );
									
									$preview.children('img.ib-preview-img')
												    .attr( 'src', largeSrc )
													.css({
										width	: dim.width,
										height	: dim.height,
										left	: dim.left,
										top		: dim.top
													})
													.end()
													.find('span.ib-preview-descr')
													.text( description );
									
									$ibWrapper.scrollTop( $item.offset().top )
											  .scrollLeft( $item.offset().left );
									
									selectedPhotoTitle = $item.children('img').attr('data-photoTitle');
									selectedPhotoTime = $item.children('img').attr('data-photoTime');
									selectedPhotoFstop = $item.children('img').attr('data-photoFstop');
									selectedPhotoExposure = $item.children('img').attr('data-photoExposure');
									selectedPhotoISO = $item.children('img').attr('data-photoISO');
									
									selectedPhotoId = $item.children('img').attr('data-photoId');
									
									selectedAlbumTitle =$item.children('img').attr('data-photoAlbumTitle');
									selectedTime =$item.children('img').attr('data-photoTime');
									selectedGeoTag =$item.children('img').attr('data-photoGeoTag');
									selectedModel =$item.children('img').attr('data-photoModel');
									selectedTags =$item.children('img').attr('data-photoTags');
									selectedPeople =$item.children('img').attr('data-photoPeople');
									selectedDescription =$item.children('img').attr('data-photoDescription');
									selectedIndex =$item.children('img').attr('data-index');
									
									$("#photoTitle").text("File-Name : "+selectedPhotoTitle);
									$("#photoTime").text("Time : "+selectedPhotoTime);								
									$("#photoFstop").text("F-Stop : "+selectedPhotoFstop);								
									$("#photoExposure").text("Exp : "+selectedPhotoExposure);								
									$("#photoISO").text("ISO : "+selectedPhotoISO);	
									
									$("#pAlbumTitle").val(selectedAlbumTitle);	
									$("#pTime").val(selectedTime);	
									$("#pGeoTag").val(selectedGeoTag);	
									$("#pModel").val(selectedModel);	
									$("#pTags").val(selectedTags);	
									$("#pPeople").val(selectedPeople);	
									$("#pDescription").val(selectedDescription);	
									
									isAnimating	= false;
									
//									showingTokenText(selectedIndex);
									
									$('.form-control').tokenfield('destroy');
									createTagToken();
									$('.form-control').tokenfield('setTokens', selectedTags);
									$('.form-control2').tokenfield('setTokens', selectedPeople);
									
//									$('.form-control').tokenfield('setTokens', selectedTags);
//									$('.form-control2').tokenfield('setTokens', selectedPeople);
//
//									if (selectedTags == "") {
//										console.log("1-1");
//										$('.form-control').tokenfield('destroy');
//										$('.form-control').val("");
//										createTagToken();
//									} else {
//										console.log("1-2");
//										$('.form-control').tokenfield('setTokens', selectedTags);
//									}
//									if (selectedPeople == "") {
//										console.log("2-1");
//										$('.form-control2').tokenfield('destroy');
//										$('.form-control2').val("");
//										createPeopleToken();
//									} else {
//										console.log("2-2");
//										$('.form-control2').tokenfield('setTokens', selectedPeople);
//									}
									
								});
								
							},
							
							
							yoyo				= function() {
								/*	if($("#wrapper").)
										wrapper.toggled {
									    padding-left: 250px;*/
								$("#wrapper").toggleClass("toggled");
								$("#photoTitle").text("File-Name : "+selectedPhotoTitle);								
								$("#photoTime").text("Time : "+selectedPhotoTime);								
								$("#photoFstop").text("F-Stop : "+selectedPhotoFstop);								
								$("#photoExposure").text("Exp : "+selectedPhotoExposure);								
								$("#photoISO").text("ISO : "+selectedPhotoISO);		
								
								$("#pAlbumTitle").val(selectedAlbumTitle);	
								$("#pTime").val(selectedTime);	
								$("#pGeoTag").val(selectedGeoTag);	
								$("#pModel").val(selectedModel);	
								$("#pTags").val = selectedTags;	
								$("#pPeople").val = selectedPeople;	
								
								console.log(selectedTags);
								console.log($("#pTags"));
								console.log($("#pTags").val());
//								showingTokenText(selectedIndex);
								
								$('.form-control').tokenfield('destroy');
								createTagToken();
								$('.form-control').tokenfield('setTokens', selectedTags);
								$('.form-control2').tokenfield('setTokens', selectedPeople);
								
//								$('.form-control').tokenfield('setTokens', selectedTags);
//								$('.form-control2').tokenfield('setTokens', selectedPeople);
//
//								if (selectedTags == "") {
//									console.log("1-1");
//									$('.form-control').tokenfield('destroy');
//									$('.form-control').val("");
//									createTagToken();
//								} else {
//									console.log("1-2");
//									$('.form-control').tokenfield('setTokens', selectedTags);
//								}
//								if (selectedPeople == "") {
//									console.log("2-1");
//									$('.form-control2').tokenfield('destroy');
//									$('.form-control2').val("");
//									createPeopleToken();
//								} else {
//									console.log("2-2");
//									$('.form-control2').tokenfield('setTokens', selectedPeople);
//								}
								
								
								$("#pDescription").val(selectedDescription);	
								},

								deleteImage = function(){

									 if(confirm("사진을 삭제하시겠습니까?")) {
										
										 $.ajax({
												type : "get",
												url : "delete.do",
												data : {
													photoId : selectedPhotoId,
													albumId : selectedAlbumId
												},
												contentType : "application/json;charset=utf-8",
												dataType : "text",
												error : function(xhr, status, message) {
													
													alert("status : " + status + "error : " + message);
												},
												success : function(data) {
							
													location.href="./albumView.do?albumId="+data;
												}
											});
								        } else {
								            return false;
								        }
									
									}	
								
									
								
								
							// closes the fullscreen image item
								
							closeImgPreview				= function() {
								
								if($("#wrapper").css('padding-left')=='250px'){
										yoyo();}
									
								if( isAnimating ) return false;
								
								isAnimating	= true;
								
								var $item	= $ibImgItems.eq( current );
								
								$('#ib-img-preview').find('span.ib-preview-descr, div.ib-nav, span.ib-close')
												.hide()
												.end()
												.animate({
													height	: $item.height(),
													top		: $item.offset().top
													}, 500, 'easeOutExpo', function() {
													
													$(this).animate({
														width	: $item.width(),
														left	: $item.offset().left
														}, 400, function() {
														
															$(this).fadeOut(function() {isAnimating	= false;});
														
													} );
												
												});
							
							},
							// closes the fullscreen content item
							closeContentPreview			= function() {
								
								if( isAnimating ) return false;
								
								isAnimating	= true;
								
								var $item	= $ibItems.not('.ib-image').eq( current );
								
								$('#ib-content-preview').find('div.ib-teaser, div.ib-content-full, span.ib-close')
														.hide()
														.end()
														.animate({
															height	: $item.height(),
															top		: $item.offset().top
														}, 500, 'easeOutExpo', function() {
															
															$(this).animate({
																width	: $item.width(),
																left	: $item.offset().left
															}, 400, function() {
																
																$(this).fadeOut(function() {isAnimating	= false;});
																
															} );
														
														});
							
							},
							// get the size of one image to make it full size and centered
							getImageDim					= function( src ) {
								
								var img     	= new Image();
								img.src     	= src;
								
								var w_w	= $(window).width(),
									w_h	= $(window).height(),
									r_w	= w_h / w_w,
									i_w	= img.width,
									i_h	= img.height,
									r_i	= i_h / i_w,
									new_w, new_h,
									new_left, new_top;
								
								if( r_w > r_i ) {
								
									new_h	= w_h;
									new_w	= w_h / r_i;
								
								}	
								else {
								
									new_h	= w_h;
									new_w	= w_h / r_i;
								
								}
								
								return {
									width	: new_w,
									height	: new_h,
									left	: (w_w - new_w) / 2,
									top		: (w_h - new_h) / 2
								};
							
							};
						
						return { init : init };
						
					})();
				
				Template.init();
				
            });

/* back to top */
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() != 0) {
            $('#toTop').fadeIn();
            
        } else {
            $('#toTop').fadeOut();
        }
    });

    $('#toTop').click(function() {
        $('body,html').animate({
            scrollTop: 0
        }, 2000);
    });
    
    
});

$(function() {
	
	$('.ib-teaser').click(function(){
		if($("#selectModeYo").css("display")=='none'){
			$("#viewModeYo").css("display",'none');
			$("#selectModeYo").show(400);
			
		}else{
			$("#selectModeYo").css("display",'none');
			$("#viewModeYo").css("display",'block');
			var chk = $(this).is(":checked");//.attr('checked');
		    $(".checkMan").attr('checked', false); 
		    if($("#wrapper").css('padding-left')=='250px'){
	    		$("#wrapper").toggleClass("toggled");
					}		    
		}
	});
	
	
    $('.checkMan').click(function() {
    	
    	if($("#wrapper").css('padding-left')!='250px'){
    		$("#wrapper").toggleClass("toggled");
				}
		 
		 if($('.checkMan').is(':checked')==false){
			 $("#wrapper").toggleClass("toggled");
			}
    });
    
	
	
	$("#check_all").click(function(){
        var chk = $(this).is(":checked");//.attr('checked');
        if(chk) {$(".checkMan").attr('checked', true);}
        else  {$(".checkMan").attr('checked', false); 
        $("#wrapper").toggleClass("toggled");
        }
    });
	
});

/** tooltip ***/
$(document).ready(function() {
    $("[rel=tooltip]").tooltip();
});
/** About Slider ***/
$(document).ready(function() {
    var slider = $('#slider').leanSlider({
        directionNav: '#slider-direction-nav',
        controlNav: '#slider-control-nav'
    });
});

/**parallax **/
$(document).ready(function(){
	//.parallax(xPosition, speedFactor, outerHeight) options:
	//xPosition - Horizontal position of the element
	//inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
	//outerHeight (true/false) - Whether or not jQuery should use it's outerHeight option to determine when a section is in the viewport
	var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    };

	var testMobile = isMobile.any();
	
	if (testMobile == null)
	{
		$('#intro').parallax("50%", 0.1);
	$('#second').parallax("50%", 0.1);
	$('#third').parallax("50%", 0.1);
	$('#fourth').parallax("50%", 0.1);
	$('#fifth').parallax("50%", 0.4);
	}
})

/**form validate**/
$(document).ready(function() {
    $('#registerHere input').hover(function() {
        $(this).popover('show')
        });
    $("#registerHere").validate({
        rules: {
            user_name: "required",
            user_email: {
                required: true,
                email: true
            },
            pwd: {
                required: true,
                minlength: 30
            },
            cpwd: {
                required: false,
                equalTo: "#pwd"
            },
            gender: "required"
        },
        messages: {
            user_name: "Enter your first and last name",
            user_email: {
                required: "Enter your email address",
                email: "Enter valid email address"
            },
            pwd: {
                required: "Enter your Your Subject",
                minlength: "Your Subject must be minimum 30 characters"
            },
            cpwd: {
                required: "Send Message",
                equalTo: "Type Your Message"
            },
            gender: "Select Gender"
        },
        errorClass: "help-inline",
        errorElement: "span",
        highlight: function(element, errorClass, validClass) {
            $(element).parents('.control-group').addClass('error');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).parents('.control-group').removeClass('error');
            $(element).parents('.control-group').addClass('success');
        }
    });
});

/****Scroll js for Nav****/
$(document).ready(function() {

    $(".nav a").click(function() {
        $("html, body").animate({
            scrollTop: $($(this).attr("href")).offset().top + "px"
        }, {
            duration: 1500,
            easing: "easeInOutQuint"
        });
        return false;
    });
});

function showingTokenText(selectedIndex) {
	
	var showId = 'tagLi' + selectedIndex;
	
	var size = $('#listSize').val();
	
	for (var int = 0; int <= size; int++) {
		var tagId = 'tagLi' + int;
		var peopleId = 'peopleLi' + int;

		var tagBox = document.getElementById(tagId);
		var peopleBox = document.getElementById(peopleId);
		
		if (tagId == showId) {
			tagBox.style.display = '';
			peopleBox.style.display = '';
		} else {
			tagBox.style.display = 'none';
			peopleBox.style.display = 'none';
		}
		
	}
	
}

function updatePhotos() {
	var tagId = 'pTags' + selectedIndex;
	var peopleId = 'pPeople' + selectedIndex;
	
	var method = "post"; // 전송 방식 기본값을 POST로
    
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", './update.do');
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "photoId");
    hiddenField.setAttribute("value", selectedPhotoId);
    
    form.appendChild(hiddenField);
 
    var hiddenField2 = document.createElement("input");
    hiddenField2.setAttribute("type", "hidden");
    hiddenField2.setAttribute("name", "albumTitle");
    hiddenField2.setAttribute("value", document.getElementById('pAlbumTitle').value);
    
    form.appendChild(hiddenField2);
    
    var hiddenField3 = document.createElement("input");
    hiddenField3.setAttribute("type", "hidden");
    hiddenField3.setAttribute("name", "oriAlbumId");
    hiddenField3.setAttribute("value", selectedAlbumId);
    
    form.appendChild(hiddenField3);
    
    var hiddenField4 = document.createElement("input");
    hiddenField4.setAttribute("type", "hidden");
    hiddenField4.setAttribute("name", "comments");
    hiddenField4.setAttribute("value", document.getElementById('pDescription').value);
    
    form.appendChild(hiddenField4);
    
    var hiddenField5 = document.createElement("input");
    hiddenField5.setAttribute("type", "hidden");
    hiddenField5.setAttribute("name", "tags");
    hiddenField5.setAttribute("value", document.getElementById(tagId).value);
    
    form.appendChild(hiddenField5);
    
    var hiddenField6 = document.createElement("input");
    hiddenField6.setAttribute("type", "hidden");
    hiddenField6.setAttribute("name", "time");
    hiddenField6.setAttribute("value", document.getElementById('pTime').value);
    
    form.appendChild(hiddenField6);
    
    var hiddenField7 = document.createElement("input");
    hiddenField7.setAttribute("type", "hidden");
    hiddenField7.setAttribute("name", "people");
    hiddenField7.setAttribute("value", document.getElementById(peopleId).value);
    
    form.appendChild(hiddenField7);
 
    document.body.appendChild(form);
    console.log(form);
    
    form.submit();
}



