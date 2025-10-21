cd "/Users/ellacharles/Downloads/eco375/project"
use nhis_00003.dta, clear
rename racenew race

keep if hypertenev == 2
drop if inlist(race, 997, 998, 999, 530, 520)
regress climhyperc i.race

keep if race == 100 | race == 200
gen race_num = .
replace race_num = 1 if race == 200
replace race_num = 0 if race == 100
label define race_lbl 0 "White" 1 "Black"
label values race_num race_lbl
scatter climhyperc race_num, jitter(2) ///
    ytitle("Chronic Hypertension (climhyperc)") ///
    xtitle("Race") ///
    xlabel(0 "White" 1 "Black") ///
    title("Scatter Plot of Race vs. Chronic Hypertension")
