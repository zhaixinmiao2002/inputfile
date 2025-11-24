#!/bin/bash
for((i=1;i<=5;i++))
do
	 mkdir mode_${i}
               cd ./mode_${i}			
                	cp ../mode.in ./
			cp ../xfc_${i}/09_socs_${i}_evecs.dat ./

			     sed -i "s/wt_atp_bbg_1_evecs/09_socs_${i}_evecs/g" mode.in
			     sed -i "s/wt_atp_bbg_1_extreme/09_socs_${i}_extreme/g" mode.in
			     sed -i "s/wt_atp_bbg_1_rmsfluct/09_socs_${i}_rmsfluct/g" mode.in
			     sed -i "s/wt_atp_bbg_1_frac/09_socs_${i}_frac/g" mode.in

									                                                                                  cpptraj -i mode.in
																			  cd ../
																		  done

