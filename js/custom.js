$(function(){
			$('.slides').slides({
				preload: true,
				preloadImage: 'images/loading.gif',
			});
			$.getJSON('http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=ddaan&api_key=a8aae085abe13b9a0f2b606255c56bb4&format=json&limit=5', function(data){
										
			  var artist = new Array();
			  var track = new Array();
			  var url = new Array();
			  
	          $.each(data.recenttracks.track, function(i, item){
		          
		          artist.push(item.artist["#text"]);
		          track.push(item.name);
		          url.push(item.url);
		          
	          });
		      $("#muziek #nowplaying").append("<a href='http://last.fm/user/ddaan'>" + artist[0] + " - " + track[0] + "</a>");
		    
		     
        	}); 
        	
        	
        	
        	$(function () {

		// scroll body to 0px on click
		$('a#top').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 300);
			return false;
		});
	});
		});

