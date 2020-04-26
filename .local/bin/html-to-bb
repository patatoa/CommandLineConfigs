#!/bin/sh
vim -c  "%s/\S\zs\n/ /g" -c "%s/<\/p> $/<\/p\r/g" -c "wq" $1 &&
sed -r "1,2d;
	s/(<p.*\">|<\/p>)//g;
	s/<h1.*\">/<b>/g;
	s/<\/h1>/<\/b>/g;
	s/<\/?body>//g;
	s/<\/?html>//g;
	s/<hr>//g;
	s/</[/g;
	s/>/]/g;
	s/&quot;/\"/g;
	s/&rsquo;/'/g" $1
