---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
output:
  html_document:
    css: style.css
    self_contained: no
layout: page

---

<style>

	@-webkit-keyframes slide {
	    from { background-position: 0 0; }
	    to { background-position: -400px 0; }
	}
	#background{
		background: gray url("/images/tiny-squares/tiny-square.jpg") repeat 0 0;
		-webkit-animation: slide 20s linear infinite;
		-moz-animation: slide 20s linear infinite;
	}
	p{text-align: justify;}
	li{text-align: justify;}

	@media only screen and (max-width: 500px) {
	  	.pad-1 {
	   		 padding: 10px;
	  	}
	  	.pad-2 {
	   		 padding:10px;
	  	}

  	}

	@media only screen and (min-width: 501px) {
	  	.pad-1 {
	   		 padding-left: :10px;
	  	}
	  	.pad-2 {
	   		 padding-left:10px; padding-right: 10px
	  	}
  	
	}

	#about-me, #teaching, #updates, #past-roles{
		border-bottom: 1px solid black;

	}
</style>

##### **About Me**

<img class="pad-1" align="right" width="200" height="170" src="/images/IMG-20190202-WA0001.jpg">
<img class="pad-2" align="right" width="200" height="170" src="/images/rsc_guwahati-3.jpeg">I'm a first-year Ph.D. student under **[Prof. Nipun Batra](http://nipunbatra.github.io)** in  IIT Gandhinagar. I'm interested in solving societal problems with Machine Learning and IoT. I did my schooling from Shillong and grew up there, although I was born in Assam.


<div style="margin-top: 100px"></div>

##### **Teaching**

- Teaching Assistant and Guest Lecturer For [Operating Systems](https://nipunbatra.github.io/teaching/os-fall-19/index.html) (Fall 2019, CS301)
	- Lecture Slides: [Free Space Management][1]
	- Lecture Slides: [Begineers Guide To Assembly][2] (for someone with a C background)



<div style="margin-top: 50px"></div>

##### **Updates**
- **04th January'20**: Attended CoDS COMAD 2020 in ISB Hyderabad 
- **05th December'19**: Joined [CEEW](https://www.ceew.in) as a Visiting Fellow
- **01st December'19**: Attended workshop on "Priorities for Advancing Research on Health Effects of Air Pollution in India" in AIIMS, New Delhi. [Poster Presented][3]
- **04th November'19**: Attended [AI For Social Good](https://sites.google.com/view/aiforsocialgoodworkshop/home) Workshop in Google Research Bangalore.
- **22nd August'19**: Attended India Clean Air Summit (ICAS) 2019 organised by CSTEP.
- **29th July'19** Joined IIT Gandhinagar as a Ph.D. student
- **24th July'19**: Received ACM travel grant to attend Expanding the Horizons of Human-Centered AI in Delhi. 
- Past updates are in the blog page. 

<div style="margin-top: 50px"></div>

##### **Past Roles**

- <span class="cat">**August'15**: Intern. Bisect Online Solutions, Guwahati,Assam</span>
- <span class="cat">**January'16**: Front End Web Dev. For, [EODB](http://eodbassam.in), Guwahati, Assam</span>
- <span class="cat">**July'16**: Contract Worker for front-end web technologies. *Multiple Organizations*</span>
- <span class="cat">**August'18**: Research and Teaching Assistant, IIIT- Sricity</span>
- <span class="cat">**March'19**: Junior Research Fellow, IIT-GN</span>

[1]:{{ site.url }}/downloads/free-space-management-1.pdf
[2]:{{ site.url }}/downloads/machine-language-c.pdf
[3]:{{ site.url }}/downloads/poster-aiims.pdf


<script>
	document.getElementsByTagName("body")[0].setAttribute("id", "background"); 
</script>