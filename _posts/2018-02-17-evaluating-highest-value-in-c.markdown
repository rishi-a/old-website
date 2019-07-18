---
layout: post
title:  "Evaluating highest value of int in C language"
date:   2018-02-17 17:17:39 +0530
categories: 
---
<p>In this lesson, we will see how we can evaluate the highest/lowest value of an <strong>int</strong> in C language. Unlike C++ and Java, this is not as straight forward as it may seem. To understand the value of the discussion below one should have a preliminary knowledge of 2's compliment arithmetic. 2's compliment arithmetic will not be discussed here. The general idea is this. <!--more--></p>
<p> </p>
<p>Any numbers in a modern arithmetic is represented in 2's compliment form.  if a computer system is n bit wide then the highest number is $$2^{n-1}-1$$ and the lowest number is $$2^{n-1}$$</p>
<p> </p>
<p>Generally (not always), modern computers are 32 bit wide. So, highest positive number that <strong>int </strong>can represent or hold is $$2^{32-1}-1$$  Similarly the lowest negative number representable in <strong>int32</strong> is $$2^{32-1}$$</p>
<p> </p>
<p>Now, lets focus on representing this <em>highest positive number </em>in C. That should be simple as given below:</p>
<pre>[code language="C"]

int INT_MAX = (1&amp;lt;&amp;lt;31)-1;

[/code]</pre>
<p>But this code, results into an <em>-Woverflow </em>error. So what went wrong?</p>
<p>To evaluate (1&lt;&lt;31)-1, this is what the computer does: It takes the 1 and left shifts it by 31 bits.</p>
<pre>[code language="C"]

00000000 00000000 00000000 00000001

[/code]</pre>
<p> </p>
<p>on left shifting by 31 bits, we get</p>
<pre>[code language="C"]
10000000 00000000 00000000 00000000
[/code]</pre>
<p>and now subtract -1 from it. -1 in 2s compliment form is</p>
<pre>[code language="C"]
11111111 11111111 11111111 11111111
[/code]</pre>
<p>and now the following addition takes places</p>
<pre>[code language="C"]
10000000 00000000 00000000 00000000
11111111 11111111 11111111 11111111
[/code]</pre>
<p> </p>
<p>Now, clearly the addition above will result in a 33 bit number, hence a <strong>overflow</strong>.</p>
<p> </p>
<p>Now to evaluate the expression (1&lt;&lt;31)-1 correctly in C, we have to store the result in a data type bigger then 32 bits. For this, we use <strong>long</strong> data type.</p>
<p> </p>
<pre>[code language="C"]
long x = 1;
long INT_MAX = (x&amp;lt;&amp;lt;(sizeof(int)*8)-1)-1;

printf("%lu\n", INT_MAX); //outputs 2147483647 for 32 bit machine
[/code]</pre>
<p> </p>
<p>[latex]</p>