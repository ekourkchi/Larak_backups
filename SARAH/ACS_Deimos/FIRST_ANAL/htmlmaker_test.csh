#!/usr/bin/csh

setenv output $argv[1]
setenv quot '\042'


more header.ht > $output

echo "<CENTER>"    >> $output
echo "<TABLE WIDTH=100% BORDER=1 CELLPADDING=4 CELLSPACING=3 STYLE=${quot}page-break-inside: avoid${quot}>"    >> $output
echo "	<COL WIDTH=256*>"    >> $output
echo "	<TR>"    >> $output
echo "		<TD WIDTH=100% HEIGHT=15 VALIGN=TOP BGCOLOR=${quot}#355e00${quot}>"    >> $output
echo "			<P ALIGN=CENTER><FONT COLOR=${quot}#ffffff${quot}><FONT SIZE=7><B>DEIMOS (Ehsan et al."    >> $output
echo "			2010)</B></FONT></FONT></P>"    >> $output
echo "		</TD>"    >> $output
echo "	</TR>"    >> $output
echo "</TABLE>"    >> $output
echo "</CENTER>"    >> $output

#./htmlmaker.csh	23	427	2.5	2736	13:00:21.70	27:53:54.80	typ   	35	7	>> $output
#./htmlmaker.csh	24	1	2.5	2877	13:00:11.40	27:54:36.40	typ   	29	8	>> $output
#./htmlmaker.csh	25	638	2.5	3131	12:59:50.20	27:54:45.50	typ   	19	9	>> $output

./htmlmaker.csh	03	1738	2.5	"2879	"	13:00:11.10	28:03:55	"	...	"	"	46	"	"	3	"	 32 >> $output
./htmlmaker.csh	15	479	2.5	2516	13:00:42.85	27:58:14.90	...	176.2	4.6   32 >>  $output


more footer.ht >>  $output
