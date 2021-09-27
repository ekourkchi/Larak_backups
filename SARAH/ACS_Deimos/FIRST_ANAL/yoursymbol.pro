;+
; NAME:
;       SYMCAT
;
; PURPOSE:
;
;       This function provides a symbol catalog for specifying a number of plotting symbols.
;
; AUTHOR:
;
;       FANNING SOFTWARE CONSULTING
;       David Fanning, Ph.D.
;       1645 Sheely Drive
;       Fort Collins, CO 80526 USA
;       Phone: 970-221-0438
;       E-mail: davidf@dfanning.com
;       Coyote's Guide to IDL Programming: http://www.dfanning.com
;
; CATEGORY:
;
;       Graphics
;
; CALLING SEQUENCE:
;
;       Plot, findgen(11), PSYM=SYMCAT(theSymbol)
;
;       To connect symbols with lines, use a negative value for the PSYM keyword:
;
;       Plot, findgen(11), PSYM=-SYMCAT(theSymbol)
;
; INPUTS:
;
;       theSymbol:    The number of the symbol you wish to use. Possible values are:
;
;       0  : No symbol.
;       1  : Plus sign.
;       2  : Asterisk.
;       3  : Dot (period).
;       4  : Open diamond.
;       5  : Open upward triangle.
;       6  : Open square.
;       7  : X.
;       8  : Defined by the user with USERSYM.
;       9  : Open circle.
;      10  : Histogram style plot.
;      11  : Open downward triangle.
;      12  : Open rightfacing triangle.
;      13  : Open leftfacing triangle.
;      14  : Filled diamond.
;      15  : Filled square.
;      16  : Filled circle.
;      17  : Filled upward triangle.
;      18  : Filled downward triangle.
;      19  : Filled rightfacing triangle.
;      20  : Filled leftfacing triangle.
;      21  : Hourglass.
;      22  : Filled Hourglass.
;      23  : Bowtie.
;      24  : Filled bowtie.
;      25  : Standing Bar.
;      26  : Filled Standing Bar.
;      27  : Laying Bar.
;      28  : Filled Laying Bar.
;      29  : Hat up.
;      30  : Hat down.
;      31  : Hat right.
;      32  : Hat down.
;      33  : Big cross.
;      34  : Filled big cross.
;      35  : Circle with plus.
;      36  : Circle with X.
;      37  : Upper half circle.
;      38  : Filled upper half circle.
;      39  : Lower half circle.
;      40  : Filled lower half circle.
;      41  : Left half circle.
;      42  : Filled left half circle.
;      43  : Right half circle.
;      44  : Filled right half circle.
;      45  : Star.
;      46  : Filled star.
;
; RETURN VALUE:
;
;       The return value is whatever is appropriate for passing along
;       to the PSYM keyword of (for example) a PLOT or OPLOT command.
;       For the vast majority of the symbols, the return value is 8.
;
; KEYWORDS:
; 
;       COLOR:  Set this keyword to the color (index or 24-bit value) of
;               the color desired. For example:
;               
;               Plot, Findgen(11), COLOR=FSC_COLOR('yellow'), PSYM=-SYMCAT(4, COLOR=FSC_COLOR('green'))
;
;       THICK:  Set this keyword to the thickness desired. Default is 1. 
;
; MODIFICATION HISTORY:
;
;       Written by David W. Fanning, 2 September 2006. Loosely based on the
;          program MC_SYMBOL introduced on the IDL newsgroup 1 September 2006,
;          and MPI_PLOTCONFIG__DEFINE from the Coyote Library.
;       2 October 2006. DWF. Modified to allow PSYM=8 and PSYM=10 to have
;          their normal meanings. This shifted previous symbols by two values
;          from their old meanings. For example, an hourglass went from symbol
;          number 19 to 21.
;       Whoops! Added two symbols but forgot to change limits to allow for them. 4 May 2007. DWF.
;       Added THICK keyword. 21 Aug 2007. DWF.
;       Added COLOR keyword and made THICK keyword apply to all symbols. 11 Nov 2008. DWF.
;-
;
;******************************************************************************************;
;  Copyright (c) 2008, by Fanning Software Consulting, Inc.                                ;
;  All rights reserved.                                                                    ;
;                                                                                          ;
;  Redistribution and use in source and binary forms, with or without                      ;
;  modification, are permitted provided that the following conditions are met:             ;
;                                                                                          ;
;      * Redistributions of source code must retain the above copyright                    ;
;        notice, this list of conditions and the following disclaimer.                     ;
;      * Redistributions in binary form must reproduce the above copyright                 ;
;        notice, this list of conditions and the following disclaimer in the               ;
;        documentation and/or other materials provided with the distribution.              ;
;      * Neither the name of Fanning Software Consulting, Inc. nor the names of its        ;
;        contributors may be used to endorse or promote products derived from this         ;
;        software without specific prior written permission.                               ;
;                                                                                          ;
;  THIS SOFTWARE IS PROVIDED BY FANNING SOFTWARE CONSULTING, INC. ''AS IS'' AND ANY        ;
;  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES    ;
;  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT     ;
;  SHALL FANNING SOFTWARE CONSULTING, INC. BE LIABLE FOR ANY DIRECT, INDIRECT,             ;
;  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED    ;
;  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;         ;
;  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND             ;
;  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT              ;
;  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS           ;
;  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                            ;
;******************************************************************************************;
FUNCTION YourSymbol, theSymbol, THICK=thick, COLOR=color

   On_Error, 2

   ; Error checking.
   IF N_Elements(theSymbol) EQ 0 THEN RETURN, 0
   IF N_Elements(thick) EQ 0 THEN thick = 1
   IF (theSymbol LT 0) OR (theSymbol GT 46) THEN Message, 'Symbol number out of defined range.'
   theSymbol = Fix(theSymbol)

   ; Define helper variables for creating circles.
   phi = Findgen(36) * (!PI * 2 / 36.)
   phi = [ phi, phi(0) ]

   ; Use user defined symbol by default.
   result = 8


   CASE theSymbol OF

       0  : result = 0                                                                               ; No symbol.
;       1  : result = 1   
 
21 : USERSYM, 0.6*[0,1.5,0,1,0,-1,0,-1.5,0,-1,0,1,0], 0.6*[0,0,0,1,0,1,0,0,0,-1,0,-1,0], color=color, thick=2.
22 : USERSYM, 0.6*COS(phi), 0.6*SIN(phi), /FILL, color=color
23 : USERSYM, 1.1*[-.8, 0, .8, 0, -.8], 1.1*[0, .8, 0, -.8, 0], color=color, thick=2., /fill
24 : USERSYM, 1.1*[-.8, 0, .8, 0, -.8], 1.1*[0, .8, 0, -.8, 0], color=color, thick=2.
25 : USERSYM, 0.7*COS(phi), 0.7*SIN(phi), color=color
26 : USERSYM, 0.4*COS(phi), 0.4*SIN(phi), color=color
27 : USERSYM, 0.9*COS(phi), 0.9*SIN(phi), color=color
28 : USERSYM, 0.9*[0,1.5,0,1,0,-1,0,-1.5,0,-1,0,1,0], 0.9*[0,0,0,1,0,1,0,0,0,-1,0,-1,0], color=color, thick=2.
29: USERSYM, 0.9*COS(phi), 0.9*SIN(phi), /FILL, color=color

   ENDCASE

   RETURN, result
END ;-----------------------------------------------------------------------------------------------------------------------------



