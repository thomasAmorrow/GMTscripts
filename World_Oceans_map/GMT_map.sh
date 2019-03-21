#!/bin/bash

## Documentation

# generates a GMT map based on supplied parameters as described below

# Dependencies:
#	GMT packages
#	ghostscript or equivalent for display

# ***** RECORD *****
# 21 March 2019   original script    T.Morrow
#
# ***** ***** *****

# Current map configuration produces a Mollweide projection focused on the Earth's oceans. Commented data includes options for plotting fracture zone traces from the Global Seafloor Fabric and Magnetic Lineation database

 

# EGG 1---------------------------------------------------

# Some gmtsettings that make it look nice
gmtset MAP_FRAME_TYPE=plain
gmtset MAP_FRAME_AXES=WesNz

#this is a big map, best on A3 paper
gmtset PS_MEDIA=A3

## Input 
	# Output file
	psfile=out.ps

	# Input grid file
	grdfile=Global.grd

	# Color scheme
	color=oleron.cpt

## Plot parameters
	#	range="W/E/S/N"
	range="20/110/0/90"

	#	depth="min/max/interval" for contour colors
	depth="-7000/7000/100"

	#	ticks="a(annotated interval north-south)f(interval north-south)/a(same EW)f(same EW)
	ticks="afg"

	#	projection="projection defined as in GMT (see man)"
	projection="w60/0.1"
	#"M6ih"

	#	baby_cont="contour interval" small interval, not annotated
	baby_cont="3000"

	#	annot_cont="contour interval" annotated contour interval optional font arg: +fnn
	annot_cont="2000+f5"

	#	landcolor="/r/g/b" color of continents used in pscoast
	landcolor="darkgreen"

	## Map construction

	# Basemap
	psbasemap -B${ticks} -J${projection} -R${range} -Y10 -K > ${psfile}

	# Shading
	#grdgradient ${grdfile} -Gshades.grd -A0/270 -Nt

	# Make color file
	makecpt -C${color} -T${depth} -Z10 > colorscheme.cpt
	colorscheme="colorscheme.cpt"

	# Fill contours
	grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -K -O >> ${psfile}
	#grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -Ishades.grd -K -O >> ${psfile}

	# Plot faults
	#psxy FTS_renumbered.csv -J${projection} -R${range} -g2z+0.1 -W0.5p,brown -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_JW.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_MC.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_RM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZLC_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_DZ_KM.gmt -J${projection} -R${range} -K -O >> ${psfile}
	#psxy GSFML_SF_ER_KM.gmt -J${projection} -R${range} -Wred -K -O >> ${psfile}
	#psxy GSFML_SF_PR_KM.gmt -J${projection} -R${range} -Wred -K -O >> ${psfile}
	#psxy GSFML_SF_UNCV_KM.gmt -J${projection} -R${range} -Wred -K -O >> ${psfile}
	#psxy GSFML_SF_VANOM_KM.gmt -J${projection} -R${range} -Wred -K -O >> ${psfile}

	#cat hotspots.gmt | awk -F' ' '{print $1, $2}' | psxy hotspots.gmt -J${projection} -R${range} -Sc0.08i -Gwhite -Wblack -K -O >> ${psfile}

	# Coastlines
	#pscoast -J${projection} -R${range} -Df -G${landcolor} -K -O >> ${psfile}

	# Contour
	#grdcontour ${grdfile} -J${projection} -Gn1+r5c -C${baby_cont} -A${annot_cont} -Wathick,black -Wcthin,darkgrey -K -O >> ${psfile}

	# Scale
	#psscale -D20c/3i/6i/0.5c -C${colorscheme}  -B${baby_cont} -O >> ${psfile}



# EGG 3---------------------------------------------------

gmtset MAP_FRAME_AXES=wesnz

## Input 
	# Output file
	psfile=out.ps

	# Input grid file
	grdfile=Global.grd

	# Color scheme
	color=oleron.cpt

## Plot parameters
	#	range="W/E/S/N"
	range="110/260/0/90"

	#	depth="min/max/interval" for contour colors
	depth="-7000/7000/100"

	#	ticks="a(annotated interval north-south)f(interval north-south)/a(same EW)f(same EW)
	ticks="afg"

	#	projection="projection defined as in GMT (see man)"
	projection="w190/0.1"
	#"M6ih"

	#	baby_cont="contour interval" small interval, not annotated
	baby_cont="3000"

	#	annot_cont="contour interval" annotated contour interval optional font arg: +fnn
	annot_cont="2000+f5"

	#	landcolor="/r/g/b" color of continents used in pscoast
	landcolor="darkgreen"

	## Map construction

	# Basemap
	psbasemap -B${ticks} -J${projection} -R${range} -X9.015 -K -O >> ${psfile}

	# Shading
	#grdgradient ${grdfile} -Gshades.grd -A0/270 -Nt

	# Make color file
	makecpt -C${color} -T${depth} -Z10 > colorscheme.cpt
	colorscheme="colorscheme.cpt"

	# Fill contours
	grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -K -O >> ${psfile}
	#grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -Ishades.grd -K -O >> ${psfile}

	# Plot faults
	#psxy FTS_renumbered.csv -J${projection} -R${range} -g2z+0.1 -W0.5p,brown -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_JW.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_MC.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_RM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZLC_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}

# EGG 5---------------------------------------------------

## Input 
	# Output file
	psfile=out.ps

	# Input grid file
	grdfile=Global.grd

	# Color scheme
	color=oleron.cpt

## Plot parameters
	#	range="W/E/S/N"
	range="-100/20/0/90"

	#	depth="min/max/interval" for contour colors
	depth="-7000/7000/100"

	#	ticks="a(annotated interval north-south)f(interval north-south)/a(same EW)f(same EW)
	ticks="afg"

	#	projection="projection defined as in GMT (see man)"
	projection="w-30/0.1"
	#"M6ih"

	#	baby_cont="contour interval" small interval, not annotated
	baby_cont="3000"

	#	annot_cont="contour interval" annotated contour interval optional font arg: +fnn
	annot_cont="2000+f5"

	#	landcolor="/r/g/b" color of continents used in pscoast
	landcolor="darkgreen"

	## Map construction

	# Basemap
	psbasemap -B${ticks} -J${projection} -R${range} -X15.015 -K -O >> ${psfile}

	# Shading
	#grdgradient ${grdfile} -Gshades.grd -A0/270 -Nt

	# Make color file
	makecpt -C${color} -T${depth} -Z10 > colorscheme.cpt
	colorscheme="colorscheme.cpt"

	# Fill contours
	grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -K -O >> ${psfile}
	#grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -Ishades.grd -K -O >> ${psfile}

	# Plot faults
	#psxy FTS_renumbered.csv -J${projection} -R${range} -g2z+0.1 -W0.5p,brown -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_JW.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_MC.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_RM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZLC_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}

# EGG 2---------------------------------------------------

gmtset MAP_FRAME_AXES=WesNz

## Input 
	# Output file
	#psfile=out.ps

	# Input grid file
	#grdfile=Global.grd

	# Color scheme
	#color=oleron.cpt

## Plot parameters

	#	range="W/E/S/N"
	range="20/140/-90/0"

	#	depth="min/max/interval" for contour colors
	#depth="-7000/7000/100"

	#	ticks="a(annotated interval north-south)f(interval north-south)/a(same EW)f(same EW)
	#ticks="afg"

	#	projection="projection defined as in GMT (see man)"
	projection="w90/0.1"
	#"M6ih"

	#	baby_cont="contour interval" small interval, not annotated
	#baby_cont="3000"

	#	annot_cont="contour interval" annotated contour interval optional font arg: +fnn
	#annot_cont="2000+f5"

	#	landcolor="/r/g/b" color of continents used in pscoast
	#landcolor="darkgreen"

	## Map construction

	# Basemap
	psbasemap -B${ticks} -J${projection} -R${range} -Y-9.015 -X-24.03 -K -O >> ${psfile}

	# Shading
	#grdgradient ${grdfile} -Gshades.grd -A0/270 -Nt

	# Make color file
	makecpt -C${color} -T${depth} -Z10 > colorscheme.cpt
	colorscheme="colorscheme.cpt"

	# Fill contours
	grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -K -O  >> ${psfile}
	#grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -Ishades.grd -K -O >> ${psfile}

	# Plot faults
	#psxy FTS_renumbered.csv -J${projection} -R${range} -g2z+0.1 -W0.5p,brown -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_JW.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_MC.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_RM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZLC_KM.gmt -J${projection} -R${range} -W1p,orange -K  -O >> ${psfile}

# EGG 4---------------------------------------------------

gmtset MAP_FRAME_AXES=wesNz

## Input 
	# Output file
	#psfile=out.ps

	# Input grid file
	#grdfile=Global.grd

	# Color scheme
	#color=oleron.cpt

## Plot parameters

	#	range="W/E/S/N"
	range="140/290/-90/0"

	#	depth="min/max/interval" for contour colors
	#depth="-7000/7000/100"

	#	ticks="a(annotated interval north-south)f(interval north-south)/a(same EW)f(same EW)
	#ticks="afg"

	#	projection="projection defined as in GMT (see man)"
	projection="w220/0.1"
	#"M6ih"

	#	baby_cont="contour interval" small interval, not annotated
	#baby_cont="3000"

	#	annot_cont="contour interval" annotated contour interval optional font arg: +fnn
	#annot_cont="2000+f5"

	#	landcolor="/r/g/b" color of continents used in pscoast
	#landcolor="darkgreen"

	## Map construction

	# Basemap
	psbasemap -B${ticks} -J${projection} -R${range} -X12.015 -K -O >> ${psfile}

	# Shading
	#grdgradient ${grdfile} -Gshades.grd -A0/270 -Nt

	# Make color file
	makecpt -C${color} -T${depth} -Z10 > colorscheme.cpt
	colorscheme="colorscheme.cpt"

	# Fill contours
	grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -K -O  >> ${psfile}
	#grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -Ishades.grd -K -O >> ${psfile}

	# Plot faults
	#psxy FTS_renumbered.csv -J${projection} -R${range} -g2z+0.1 -W0.5p,brown -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_JW.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_MC.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_RM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZLC_KM.gmt -J${projection} -R${range} -W1p,orange -K  -O >> ${psfile}

# EGG 5---------------------------------------------------

## Input 
	# Output file
	#psfile=out.ps

	# Input grid file
	#grdfile=Global.grd

	# Color scheme
	#color=oleron.cpt

## Plot parameters

	#	range="W/E/S/N"
	range="-70/20/-90/0"

	#	depth="min/max/interval" for contour colors
	#depth="-7000/7000/100"

	#	ticks="a(annotated interval north-south)f(interval north-south)/a(same EW)f(same EW)
	#ticks="afg"

	#	projection="projection defined as in GMT (see man)"
	projection="w-20/0.1"
	#"M6ih"

	#	baby_cont="contour interval" small interval, not annotated
	#baby_cont="3000"

	#	annot_cont="contour interval" annotated contour interval optional font arg: +fnn
	#annot_cont="2000+f5"

	#	landcolor="/r/g/b" color of continents used in pscoast
	#landcolor="darkgreen"

	## Map construction

	# Basemap
	psbasemap -B${ticks} -J${projection} -R${range} -X15.015 -K -O >> ${psfile}

	# Shading
	#grdgradient ${grdfile} -Gshades.grd -A0/270 -Nt

	# Make color file
	makecpt -C${color} -T${depth} -Z10 > colorscheme.cpt
	colorscheme="colorscheme.cpt"

	# Fill contours
	grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -K -O  >> ${psfile}
	#grdimage ${grdfile} -J${projection} -C${colorscheme} -R${range} -Ishades.grd -K -O >> ${psfile}

	# Plot faults
	#psxy FTS_renumbered.csv -J${projection} -R${range} -g2z+0.1 -W0.5p,brown -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_JW.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_MC.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZ_RM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}
	#psxy GSFML_SF_FZLC_KM.gmt -J${projection} -R${range} -W1p,orange -K -O >> ${psfile}

## Final conversion
# pdf
ps2pdf ${psfile} output.pdf



