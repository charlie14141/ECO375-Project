* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                    ///
  int     year          1-4      ///
  long    serial        5-10     ///
  int     strata        11-14    ///
  int     psu           15-17    ///
  str     nhishid       18-31    ///
  long    hhweight      32-37    ///
  byte    region        38-39    ///
  byte    pernum        40-41    ///
  str     nhispid       42-57    ///
  str     hhx           58-64    ///
  str     fmx           65-66    ///
  str     px            67-68    ///
  double  perweight     69-80    ///
  double  sampweight    81-92    ///
  double  fweight       93-104   ///
  byte    astatflg      105-105  ///
  byte    cstatflg      106-106  ///
  int     age           107-109  ///
  byte    sex           110-110  ///
  int     racenew       111-113  ///
  byte    citizen       114-114  ///
  byte    regionbr      115-116  ///
  int     educ          117-119  ///
  int     empstat       120-122  ///
  byte    impyfamflag1  123-123  ///
  byte    gotwelf       124-125  ///
  byte    gotdiv        126-127  ///
  byte    hinotcove     128-128  ///
  byte    hiatwork      129-129  ///
  byte    hypertenev    130-130  ///
  byte    climhyper     131-131  ///
  byte    climhyperc    132-132  ///
  byte    climhypermo   133-134  ///
  byte    climhypery    135-136  ///
  byte    flhyperc      137-137  ///
  byte    flhypermo     138-139  ///
  double  mortwt        140-147  ///
  byte    morthypr      148-148  ///
  double  mortwtsa      149-156  ///
  using `"nhis_00003.dat"'

replace sampweight   = sampweight   / 1000
replace fweight      = fweight      / 1000000

format perweight    %12.0f
format sampweight   %12.3f
format fweight      %12.6f
format mortwt       %8.0f
format mortwtsa     %8.0f

label var year         `"Survey year"'
label var serial       `"Sequential Serial Number, Household Record"'
label var strata       `"Stratum for variance estimation"'
label var psu          `"Primary sampling unit (PSU) for variance estimation"'
label var nhishid      `"NHIS Unique identifier, household"'
label var hhweight     `"Household weight, final annual"'
label var region       `"Region of residence"'
label var pernum       `"Person number within family/household (from reformatting)"'
label var nhispid      `"NHIS Unique Identifier, person"'
label var hhx          `"Household number (from NHIS)"'
label var fmx          `"Family number (from NHIS)"'
label var px           `"Person number of respondent (from NHIS)."'
label var perweight    `"Final basic annual weight"'
label var sampweight   `"Sample Person Weight"'
label var fweight      `"Final annual family weight"'
label var astatflg     `"Sample adult flag"'
label var cstatflg     `"Sample child flag"'
label var age          `"Age"'
label var sex          `"Sex"'
label var racenew      `"Self-reported Race (Post-1997 OMB standards)"'
label var citizen      `"U.S. citizenship"'
label var regionbr     `"Global region of birth"'
label var educ         `"Educational attainment"'
label var empstat      `"Employment status in past 1 to 2 weeks"'
label var impyfamflag1 `"Family income group imputation flag 1"'
label var gotwelf      `"Received income from welfare/public assistance, previous calendar year"'
label var gotdiv       `"Received income from dividends from stocks/funds, previous calendar year"'
label var hinotcove    `"Health Insurance coverage status"'
label var hiatwork     `"Health insurance offered through workplace"'
label var hypertenev   `"Ever told had hypertension"'
label var climhyper    `"Activity limitation from: Hypertension"'
label var climhyperc   `"Chronic status of limiting hypertension"'
label var climhypermo  `"Duration of limiting hypertension: Months"'
label var climhypery   `"Duration of limiting hypertension: Years"'
label var flhyperc     `"Chronic status of functionally limiting hypertension"'
label var flhypermo    `"Duration of functionally limiting hypertension: Months"'
label var mortwt       `"Weight adjusted for ineligible respondents in mortality analysis"'
label var morthypr     `"Hypertension flag from multiple cause of death (MCOD)"'
label var mortwtsa     `"Sample adult weight adjusted for ineligible respondents in mortality analysis"'

label define region_lbl 01 `"Northeast"'
label define region_lbl 02 `"North Central/Midwest"', add
label define region_lbl 03 `"South"', add
label define region_lbl 04 `"West"', add
label define region_lbl 08 `"NO DATA IN ROUND"', add
label define region_lbl 09 `"Unknown"', add
label values region region_lbl

label define astatflg_lbl 0 `"NIU"'
label define astatflg_lbl 1 `"Sample adult, has record"', add
label define astatflg_lbl 2 `"Sample adult, no record"', add
label define astatflg_lbl 3 `"Not selected as sample adult"', add
label define astatflg_lbl 4 `"No one selected as sample adult"', add
label define astatflg_lbl 5 `"Armed forces member"', add
label define astatflg_lbl 6 `"AF member, selected as sample adult"', add
label values astatflg astatflg_lbl

label define cstatflg_lbl 0 `"NIU"'
label define cstatflg_lbl 1 `"Sample child-has record"', add
label define cstatflg_lbl 2 `"Sample child-no record"', add
label define cstatflg_lbl 3 `"Not selected as sample child"', add
label define cstatflg_lbl 4 `"No one selected as sample child"', add
label define cstatflg_lbl 5 `"Emancipated minor"', add
label values cstatflg cstatflg_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 7 `"Unknown-refused"', add
label define sex_lbl 8 `"Unknown-not ascertained"', add
label define sex_lbl 9 `"Unknown-don't know"', add
label values sex sex_lbl

label define racenew_lbl 100 `"White only"'
label define racenew_lbl 200 `"Black/African American only"', add
label define racenew_lbl 300 `"American Indian/Alaska Native only"', add
label define racenew_lbl 400 `"Asian only"', add
label define racenew_lbl 500 `"Other Race and Multiple Race"', add
label define racenew_lbl 510 `"Other Race and Multiple Race (2019-forward: Excluding American Indian/Alaska Native)"', add
label define racenew_lbl 520 `"Other Race"', add
label define racenew_lbl 530 `"Race Group Not Releasable"', add
label define racenew_lbl 540 `"Multiple Race"', add
label define racenew_lbl 541 `"Multiple Race (1999-2018: Including American Indian/Alaska Native)"', add
label define racenew_lbl 542 `"American Indian/Alaska Native and Any Other Race"', add
label define racenew_lbl 997 `"Unknown-Refused"', add
label define racenew_lbl 998 `"Unknown-Not ascertained"', add
label define racenew_lbl 999 `"Unknown-Don't Know"', add
label values racenew racenew_lbl

label define citizen_lbl 1 `"No, not U.S. citizen"'
label define citizen_lbl 2 `"Yes, U.S. citizen"', add
label define citizen_lbl 7 `"Unknown--refused"', add
label define citizen_lbl 8 `"Unknown--not ascertained"', add
label define citizen_lbl 9 `"Unknown--don't know"', add
label values citizen citizen_lbl

label define regionbr_lbl 01 `"United States"'
label define regionbr_lbl 02 `"Mexico, Central America, Caribbean Islands"', add
label define regionbr_lbl 03 `"South America"', add
label define regionbr_lbl 04 `"Europe"', add
label define regionbr_lbl 05 `"Russia (and former USSR areas)"', add
label define regionbr_lbl 06 `"Africa"', add
label define regionbr_lbl 07 `"Middle East"', add
label define regionbr_lbl 08 `"Indian Subcontinent"', add
label define regionbr_lbl 09 `"Asia"', add
label define regionbr_lbl 10 `"SE Asia"', add
label define regionbr_lbl 11 `"Elsewhere"', add
label define regionbr_lbl 99 `"Unknown"', add
label values regionbr regionbr_lbl

label define educ_lbl 000 `"NIU"'
label define educ_lbl 100 `"Grade 12 or less, no high school diploma or equivalent"', add
label define educ_lbl 101 `"Grade 8 or less (no further detail)"', add
label define educ_lbl 102 `"Never attended/kindergarten only"', add
label define educ_lbl 103 `"Grades 1-11 (no further detail)"', add
label define educ_lbl 104 `"Grade 1"', add
label define educ_lbl 105 `"Grade 2"', add
label define educ_lbl 106 `"Grade 3"', add
label define educ_lbl 107 `"Grade 4"', add
label define educ_lbl 108 `"Grade 5"', add
label define educ_lbl 109 `"Grade 6"', add
label define educ_lbl 110 `"Grade 7"', add
label define educ_lbl 111 `"Grade 8"', add
label define educ_lbl 112 `"Grade 9-12, no diploma (no further detail)"', add
label define educ_lbl 113 `"Grade 9"', add
label define educ_lbl 114 `"Grade 10"', add
label define educ_lbl 115 `"Grade 11"', add
label define educ_lbl 116 `"12th grade, no diploma"', add
label define educ_lbl 200 `"High school diploma or GED"', add
label define educ_lbl 201 `"High school graduate"', add
label define educ_lbl 202 `"GED or equivalent"', add
label define educ_lbl 300 `"Some college, no 4yr degree"', add
label define educ_lbl 301 `"Some college, no degree"', add
label define educ_lbl 302 `"AA degree: technical/vocational/occupational"', add
label define educ_lbl 303 `"AA degree: academic program"', add
label define educ_lbl 400 `"Bachelor's degree (BA,AB,BS,BBA)"', add
label define educ_lbl 500 `"Master's, Professional, or Doctoral Degree"', add
label define educ_lbl 510 `"Master's degree (MA,MS,Med,MBA)"', add
label define educ_lbl 520 `"Professional School or Doctoral degree (MD, DDS, DVM, JD, PhD, EdD)"', add
label define educ_lbl 521 `"Professional degree (MD,DDS,DVM,JD)"', add
label define educ_lbl 522 `"Doctoral degree (PhD, EdD)"', add
label define educ_lbl 530 `"Other degree"', add
label define educ_lbl 996 `"No degree, years of education unknown"', add
label define educ_lbl 997 `"Unknown--refused"', add
label define educ_lbl 998 `"Unknown--not ascertained"', add
label define educ_lbl 999 `"Unknown--don't know"', add
label values educ educ_lbl

label define empstat_lbl 000 `"NIU"'
label define empstat_lbl 100 `"Employed"', add
label define empstat_lbl 110 `"Working"', add
label define empstat_lbl 111 `"Working for pay at job/business"', add
label define empstat_lbl 112 `"Working, w/out pay, at job/business"', add
label define empstat_lbl 120 `"With job, but not at work"', add
label define empstat_lbl 121 `"With job, not at work: not laid-off, not looking"', add
label define empstat_lbl 122 `"With job, not at work: looking"', add
label define empstat_lbl 200 `"Not employed"', add
label define empstat_lbl 210 `"Unemployed"', add
label define empstat_lbl 211 `"Unemployed: On layoff"', add
label define empstat_lbl 212 `"Unemployed: On layoff and looking"', add
label define empstat_lbl 213 `"Unemployed: Unk if looking or laid off"', add
label define empstat_lbl 214 `"Unemployed: Looking or on layoff"', add
label define empstat_lbl 215 `"Unemployed: Have job to return to"', add
label define empstat_lbl 216 `"Unemployed: Had job during the round"', add
label define empstat_lbl 217 `"Unemployed: No job during reference period"', add
label define empstat_lbl 220 `"Not in labor force"', add
label define empstat_lbl 900 `"Unknown-all causes"', add
label define empstat_lbl 997 `"Unknown-refused"', add
label define empstat_lbl 998 `"Unknown-not ascertained"', add
label define empstat_lbl 999 `"Unknown-don't know"', add
label values empstat empstat_lbl

label define impyfamflag1_lbl 0 `"Family income reported"'
label define impyfamflag1_lbl 1 `"Imputed, no income information reported"', add
label define impyfamflag1_lbl 2 `"Imputed, some income information reported"', add
label values impyfamflag1 impyfamflag1_lbl

label define gotwelf_lbl 00 `"NIU"'
label define gotwelf_lbl 10 `"No"', add
label define gotwelf_lbl 20 `"Yes"', add
label define gotwelf_lbl 21 `"Yes, last calendar year"', add
label define gotwelf_lbl 22 `"Yes, last month"', add
label define gotwelf_lbl 70 `"Unknown-refused"', add
label define gotwelf_lbl 80 `"Unknown-not ascertained"', add
label define gotwelf_lbl 90 `"Unknown-don't know"', add
label values gotwelf gotwelf_lbl

label define gotdiv_lbl 00 `"NIU"'
label define gotdiv_lbl 10 `"No"', add
label define gotdiv_lbl 20 `"Yes"', add
label define gotdiv_lbl 21 `"Yes, last calendar year"', add
label define gotdiv_lbl 22 `"Yes, last month"', add
label define gotdiv_lbl 70 `"Unknown-refused"', add
label define gotdiv_lbl 80 `"Unknown-not ascertained"', add
label define gotdiv_lbl 90 `"Unknown-don't know"', add
label values gotdiv gotdiv_lbl

label define hinotcove_lbl 0 `"NIU"'
label define hinotcove_lbl 1 `"No, has coverage"', add
label define hinotcove_lbl 2 `"Yes, has no coverage"', add
label define hinotcove_lbl 7 `"Unknown-refused"', add
label define hinotcove_lbl 8 `"Unknown-not ascertained"', add
label define hinotcove_lbl 9 `"Unknown-don't know"', add
label values hinotcove hinotcove_lbl

label define hiatwork_lbl 0 `"NIU"'
label define hiatwork_lbl 1 `"No"', add
label define hiatwork_lbl 2 `"Yes"', add
label define hiatwork_lbl 7 `"Unknown-refused"', add
label define hiatwork_lbl 8 `"Unknown-not ascertained"', add
label define hiatwork_lbl 9 `"Unknown-don't know"', add
label values hiatwork hiatwork_lbl

label define hypertenev_lbl 0 `"NIU"'
label define hypertenev_lbl 1 `"No"', add
label define hypertenev_lbl 2 `"Yes"', add
label define hypertenev_lbl 7 `"Unknown-refused"', add
label define hypertenev_lbl 8 `"Unknown-not ascertained"', add
label define hypertenev_lbl 9 `"Unknown-don't know"', add
label values hypertenev hypertenev_lbl

label define climhyper_lbl 0 `"NIU"'
label define climhyper_lbl 1 `"Not mentioned"', add
label define climhyper_lbl 2 `"Mentioned"', add
label define climhyper_lbl 6 `"No condition at all"', add
label define climhyper_lbl 7 `"Unknown-refused"', add
label define climhyper_lbl 8 `"Unknown-not ascertained"', add
label define climhyper_lbl 9 `"Unknown-don't know"', add
label values climhyper climhyper_lbl

label define climhyperc_lbl 0 `"NIU"'
label define climhyperc_lbl 1 `"Not chronic"', add
label define climhyperc_lbl 2 `"Chronic"', add
label define climhyperc_lbl 9 `"Unknown if chronic"', add
label values climhyperc climhyperc_lbl

label define climhypermo_lbl 00 `"NIU"'
label define climhypermo_lbl 10 `"Less than 3 months"', add
label define climhypermo_lbl 20 `"3 to 5 months"', add
label define climhypermo_lbl 30 `"6 to 12 months"', add
label define climhypermo_lbl 40 `"More than 12 months"', add
label define climhypermo_lbl 90 `"Unknown"', add
label define climhypermo_lbl 91 `"Unknown number of days"', add
label define climhypermo_lbl 92 `"Unknown number of weeks"', add
label define climhypermo_lbl 93 `"Unknown number of months"', add
label define climhypermo_lbl 94 `"Unknown number of years"', add
label define climhypermo_lbl 95 `"Unknown time with condition"', add
label define climhypermo_lbl 97 `"Unknown-refused"', add
label define climhypermo_lbl 98 `"Unknown-not ascertained"', add
label define climhypermo_lbl 99 `"Unknown-don' t know"', add
label values climhypermo climhypermo_lbl

label define climhypery_lbl 00 `"Less than 1 year"'
label define climhypery_lbl 01 `"1 year"', add
label define climhypery_lbl 02 `"2 years"', add
label define climhypery_lbl 03 `"3 years"', add
label define climhypery_lbl 04 `"4 years"', add
label define climhypery_lbl 05 `"5 years"', add
label define climhypery_lbl 06 `"6 years"', add
label define climhypery_lbl 07 `"7 years"', add
label define climhypery_lbl 08 `"8 years"', add
label define climhypery_lbl 09 `"9 years"', add
label define climhypery_lbl 10 `"10 years"', add
label define climhypery_lbl 11 `"11 years"', add
label define climhypery_lbl 12 `"12 years"', add
label define climhypery_lbl 13 `"13 years"', add
label define climhypery_lbl 14 `"14 years"', add
label define climhypery_lbl 15 `"15 years"', add
label define climhypery_lbl 16 `"16 years"', add
label define climhypery_lbl 17 `"17 years"', add
label define climhypery_lbl 18 `"18 years"', add
label define climhypery_lbl 19 `"19 years"', add
label define climhypery_lbl 20 `"20 years"', add
label define climhypery_lbl 21 `"21 years"', add
label define climhypery_lbl 22 `"22 years"', add
label define climhypery_lbl 23 `"23 years"', add
label define climhypery_lbl 24 `"24 years"', add
label define climhypery_lbl 25 `"25 years"', add
label define climhypery_lbl 26 `"26 years"', add
label define climhypery_lbl 27 `"27 years"', add
label define climhypery_lbl 28 `"28 years"', add
label define climhypery_lbl 29 `"29 years"', add
label define climhypery_lbl 30 `"30 years"', add
label define climhypery_lbl 31 `"31 years"', add
label define climhypery_lbl 32 `"32 years"', add
label define climhypery_lbl 33 `"33 years"', add
label define climhypery_lbl 34 `"34 years"', add
label define climhypery_lbl 35 `"35 years"', add
label define climhypery_lbl 36 `"36 years"', add
label define climhypery_lbl 37 `"37 years"', add
label define climhypery_lbl 38 `"38 years"', add
label define climhypery_lbl 39 `"39 years"', add
label define climhypery_lbl 40 `"40 years"', add
label define climhypery_lbl 41 `"41 years"', add
label define climhypery_lbl 42 `"42 years"', add
label define climhypery_lbl 43 `"43 years"', add
label define climhypery_lbl 44 `"44 years"', add
label define climhypery_lbl 45 `"45 years"', add
label define climhypery_lbl 46 `"46 years"', add
label define climhypery_lbl 47 `"47 years"', add
label define climhypery_lbl 48 `"48 years"', add
label define climhypery_lbl 49 `"49 years"', add
label define climhypery_lbl 50 `"50 years"', add
label define climhypery_lbl 51 `"51 years"', add
label define climhypery_lbl 52 `"52 years"', add
label define climhypery_lbl 53 `"53 years"', add
label define climhypery_lbl 54 `"54 years"', add
label define climhypery_lbl 55 `"55 years"', add
label define climhypery_lbl 56 `"56 years"', add
label define climhypery_lbl 57 `"57 years"', add
label define climhypery_lbl 58 `"58 years"', add
label define climhypery_lbl 59 `"59 years"', add
label define climhypery_lbl 60 `"60 years"', add
label define climhypery_lbl 61 `"61 years"', add
label define climhypery_lbl 62 `"62 years"', add
label define climhypery_lbl 63 `"63 years"', add
label define climhypery_lbl 64 `"64 years"', add
label define climhypery_lbl 65 `"65 years"', add
label define climhypery_lbl 66 `"66 years"', add
label define climhypery_lbl 67 `"67 years"', add
label define climhypery_lbl 68 `"68 years"', add
label define climhypery_lbl 69 `"69 years"', add
label define climhypery_lbl 70 `"70 years"', add
label define climhypery_lbl 71 `"71 years"', add
label define climhypery_lbl 72 `"72 years"', add
label define climhypery_lbl 73 `"73 years"', add
label define climhypery_lbl 74 `"74 years"', add
label define climhypery_lbl 75 `"75 years"', add
label define climhypery_lbl 76 `"76 years"', add
label define climhypery_lbl 77 `"77 years"', add
label define climhypery_lbl 78 `"78 years"', add
label define climhypery_lbl 79 `"79 years"', add
label define climhypery_lbl 80 `"80 years"', add
label define climhypery_lbl 81 `"81 years"', add
label define climhypery_lbl 82 `"82 years"', add
label define climhypery_lbl 83 `"83 years"', add
label define climhypery_lbl 84 `"84 years"', add
label define climhypery_lbl 85 `"85+ years"', add
label define climhypery_lbl 96 `"NIU"', add
label define climhypery_lbl 97 `"Unknown-refused"', add
label define climhypery_lbl 98 `"Unknown-not ascertained"', add
label define climhypery_lbl 99 `"Unknown-don't now"', add
label values climhypery climhypery_lbl

label define flhyperc_lbl 0 `"NIU"'
label define flhyperc_lbl 1 `"Not chronic"', add
label define flhyperc_lbl 2 `"Chronic"', add
label define flhyperc_lbl 9 `"Unknown if chronic"', add
label values flhyperc flhyperc_lbl

label define flhypermo_lbl 00 `"NIU"'
label define flhypermo_lbl 10 `"Less than 3 months"', add
label define flhypermo_lbl 20 `"3 to 5 months"', add
label define flhypermo_lbl 30 `"6 to 12 months"', add
label define flhypermo_lbl 40 `"More than 12 months"', add
label define flhypermo_lbl 90 `"Unknown"', add
label define flhypermo_lbl 91 `"Unknown number of days"', add
label define flhypermo_lbl 92 `"Unknown number of weeks"', add
label define flhypermo_lbl 93 `"Unknown number of months"', add
label define flhypermo_lbl 94 `"Unknown number of years"', add
label define flhypermo_lbl 95 `"Unknown time with condition"', add
label define flhypermo_lbl 97 `"Unknown-refused"', add
label define flhypermo_lbl 98 `"Unknown-not ascertained"', add
label define flhypermo_lbl 99 `"Unknown-don't know"', add
label values flhypermo flhypermo_lbl

label define morthypr_lbl 1 `"No"'
label define morthypr_lbl 2 `"Yes"', add
label define morthypr_lbl 9 `"NIU"', add
label values morthypr morthypr_lbl


