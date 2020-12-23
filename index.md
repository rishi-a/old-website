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
	   		 border-radius: 50%
	  	}

  	}

	@media only screen and (min-width: 501px) {
	  	.pad-1 {
	   		 padding-left: :10px;
	  	}
	  	.pad-2 {
	   		 padding-left:10px; padding-right: 10px;
	   		 border-radius: 50%
	  	}
  	
	}

	#about-me, #teaching, #updates, #past-roles{
		border-bottom: 1px solid black;

	}
</style>

##### **About Me**

<img class="pad-2" align="right" width="110" height="110" src="/images/RISHIRAJ.jpg">
<!--<img class="pad-1" align="right" width="200" height="170" src="/images/IMG-20190202-WA0001.jpg">
-->I'm a Ph.D. student  at  IIT Gandhinagar, and I'm supervised by **[Prof. Nipun Batra](http://nipunbatra.github.io)**. I'm interested in developing computational tools for Air Pollution using Machine Learning and IoT. I did my schooling from Shillong and grew up there, although I was born in Assam.



<div style="margin-top: 50px"></div>

##### **Updates**
**2020**
- **23rd December**: Journal paper titled, "Vartalaap: What Drives #AirQuality Discussions: Politics,Pollution or Pseudo-science?" accepted in CSCW 2021
- **20th October**: Deployment paper got accepted in the 3rd workshop on [DATA'20](https://workshopdata.github.io/DATA2020/)
- **14th October**: Poster abstract got accepted in [Sensys 2020](http://sensys.acm.org/2020/)
- **28th July**: Two posters/short papers got accepted in [Ubicomp/ISWC 2020](http://ubicomp.org/ubicomp2020).
- **25th July**: Position Paper got accepted for presentation in [Ubicomp/ISWC 2020](http://ubicomp.org/ubicomp2020)
- **4th January**: Attended CoDS COMAD 2020 in ISB Hyderabad with ACM travel grant.

**2019**
- **5th December**: Joined [CEEW](https://www.ceew.in) as a Visiting Fellow
- **1st December**: Attended workshop on "Priorities for Advancing Research on Health Effects of Air Pollution in India" in AIIMS, New Delhi. [Poster Presented][4]
- **4th November**: Attended [AI For Social Good](https://sites.google.com/view/aiforsocialgoodworkshop/home) Workshop in Google Research Bangalore.
- **22nd August**: Attended India Clean Air Summit (ICAS) 2019 organised by CSTEP.
- **29th July**: Joined IIT Gandhinagar as a Ph.D. student
- **24th July**: Received ACM travel grant to attend Expanding the Horizons of Human-Centered AI in Delhi. 
- **1st March**: Joined IIT Gandhinagar as a Research Assistant.

<div style="margin-top: 80px"></div>


<div style="margin-top: 80px"></div>
##### **Teaching**

- Teaching Assistant and Guest Lecturer For [Operating Systems](https://nipunbatra.github.io/os2020/) (Fall 2020 CS301)
	- Lecture Slides: [Begineers Guide To Assembly, Clang, Debugger and GDB][3] (co-taught with Tom Glint)
- Teaching Assistant and Guest Lecturer For [Operating Systems](https://nipunbatra.github.io/os2019/) (Fall 2019 CS301)
	- Lecture Slides: [Free Space Management][1]
	- Lecture Slides: [Begineers Guide To Assembly][2] (for someone with a C background)
<div style="margin-top: 50px"></div>

##### **Past Roles**

- <span class="cat">**August'15**: Intern. Bisect Online Solutions, Guwahati,Assam</span>
- <span class="cat">**January'16**: Front End Web Dev. For, [EODB](http://eodbassam.in), Guwahati, Assam</span>
- <span class="cat">**July'16**: Contract Worker for front-end web technologies. *Multiple Organizations*</span>
- <span class="cat">**August'18**: Research and Teaching Assistant, IIIT- Sricity</span>
- <span class="cat">**March'19**: Junior Research Fellow, IIT-GN</span>

[1]:{{ site.url }}/downloads/free-space-management-1.pdf
[2]:{{ site.url }}/downloads/machine-language-c.pdf
[3]:{{ site.url }}/downloads/machine-language-c-2020.pdf
[4]:{{ site.url }}/downloads/poster-aiims.pdf
[5]:{{ site.url }}/downloads/publications/2020_Ubicomp_Breathe_Poster.pdf
[6]:{{ site.url }}/downloads/publications/2020_Ubicomp_Breathe_Poster.pdf
[7]:{{ site.url }}/downloads/publications/Ubicomp-DC2020_Revised.pdf


<script>
	document.getElementsByTagName("body")[0].setAttribute("id", "background"); 
</script>