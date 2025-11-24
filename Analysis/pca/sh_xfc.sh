#!/bin/bash
for((i=1;i<=5;i++))
do
	    mkdir xfc_${i}
	        cd ./xfc_${i}
		    cp ../xfc.cpptraj ./
		        sed -i "s/02_jak1_sosc2_1_complex/01_jak1_sosc1_${i}_complex/g" xfc.cpptraj
			#sed -i "s/1-646/1-471/g" xfc.cpptraj
			#sed -i "s/1-646/1-289/g" xfc.cpptraj
		        sed -i "s/1-646/290-471/g" xfc.cpptraj
		        sed -i "s/wt_atp_bbg_1_RmsToAvg/01_socs_${i}_RmsToAvg/g" xfc.cpptraj
		        sed -i "s/wt_atp_bbg_1_Matrix/01_socs_${i}_Matrix/g" xfc.cpptraj
		        sed -i "s/wt_atp_bbg_1_evecs/01_socs_${i}_evecs/g" xfc.cpptraj
		        sed -i "s/wt_atp_bbg_1_nmwiz/01_socs_${i}_nmwiz/g" xfc.cpptraj
		        sed -i "s/wt_atp_bbg_1_project/01_socs_${i}_project/g" xfc.cpptraj	
		  	        cpptraj -i xfc.cpptraj
			
				    cd ../
			    done

