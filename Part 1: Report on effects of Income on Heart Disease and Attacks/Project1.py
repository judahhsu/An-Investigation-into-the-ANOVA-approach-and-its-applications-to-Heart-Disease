import matplotlib.pyplot as plt
import numpy as np

#I think this report is gonna focus on income

#MAYBE make a note that the bars are overlapping, not stacked

#Code chunk to take data from csv and input into dictionary
file = "heart_disease_health_indicators_BRFSS2015.csv"
infile = open(file)
header = infile.readline()
header = header.strip()
categories = header.split(",")
categoryDict = {}
for cat in categories:
    categoryDict[cat] = []    
for line in infile:
    currentLine = line.strip()
    currentLine = currentLine.split(",")
    for i in range(len(currentLine)):
        #I think the histo was weird bc it's taking strings...
        #Actually that's probably what was fudging up in my stevens project
        categoryDict[categories[i]].append(float(currentLine[i]))
infile.close()

#Income distribution for contigency table
#income1HD = 0
#income2HD = 0
#income3HD = 0
#income4HD = 0
#income5HD = 0
#income6HD = 0
#income7HD = 0
#income8HD = 0
#income1 = 0
#income2 = 0
#income3 = 0
#income4 = 0
#income5 = 0
#income6 = 0
#income7 = 0
#income8 = 0
#for index in range(len(categoryDict["Income"])):
#    if categoryDict["Income"][index] == 1:
#        income1+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income1HD += 1
#    if categoryDict["Income"][index] == 2:
#        income2+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income2HD += 1
#    if categoryDict["Income"][index] == 3:
#        income3+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income3HD += 1
#    if categoryDict["Income"][index] == 4:
#        income4+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income4HD += 1
#    if categoryDict["Income"][index] == 5:
#        income5+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income5HD += 1
#    if categoryDict["Income"][index] == 6:
#        income6+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income6HD += 1
#    if categoryDict["Income"][index] == 7:
#       income7+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income7HD += 1
#    if categoryDict["Income"][index] == 8:
#        income8+=1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            income8HD += 1

INCBMI110 =0
INCBMI120 =0
INCBMI130 =0
INCBMI140 =0
INCBMI150 =0
INCBMI160 =0
INCBMI170 =0
INCBMI180 =0
INCBMI190 =0
INCBMI1100 =0
INCBMI810 =0
INCBMI820 =0
INCBMI830 =0
INCBMI840 =0
INCBMI850 =0
INCBMI860 =0
INCBMI870 =0
INCBMI880 =0
INCBMI890 =0
INCBMI8100 =0

#I realize as I'm doing this that I probably could've made a function
#To count values given conditions now

#for index in range(len(categoryDict["BMI"])):
#    if categoryDict["BMI"][index] <=10:
#        if categoryDict["Income"][index] == 1:
#            INCBMI110 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI810 += 1
#    elif categoryDict["BMI"][index] <=20:
#        if categoryDict["Income"][index] == 1:
#            INCBMI120 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI820 += 1
#    elif categoryDict["BMI"][index] <=30:
#        if categoryDict["Income"][index] == 1:
#            INCBMI130 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI830 += 1
#    elif categoryDict["BMI"][index] <=40:
#        if categoryDict["Income"][index] == 1:
#            INCBMI140 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI840 += 1
#    elif categoryDict["BMI"][index] <=50:
#        if categoryDict["Income"][index] == 1:
#            INCBMI150 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI850 += 1
#    elif categoryDict["BMI"][index] <=60:
#        if categoryDict["Income"][index] == 1:
#            INCBMI160 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI860 += 1
#    elif categoryDict["BMI"][index] <=70:
#        if categoryDict["Income"][index] == 1:
#            INCBMI170 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI870 += 1
#    elif categoryDict["BMI"][index] <=80:
#        if categoryDict["Income"][index] == 1:
#            INCBMI180 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI880 += 1
#    elif categoryDict["BMI"][index] <=90:
#        if categoryDict["Income"][index] == 1:
#            INCBMI190 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI890 += 1
#    elif categoryDict["BMI"][index] <=100:
#        if categoryDict["Income"][index] == 1:
#            INCBMI1100 += 1
#        elif categoryDict["Income"][index] == 8:
#            INCBMI8100 += 1

        

################################################################################
#PLOTS

#AS VEG is somewhat irrelevant to my focus, I am taking it out
#VEG VS HD
    #Not doing age because the age only spans [1,13] so I don't think it's big enough
    #do veggies & income. at dif incomes, you spend less money on expensive food
#VEG1 = categoryDict["Veggies"].count(1)
#VEG0 = len(categoryDict["Veggies"]) - VEG1
#HC1 = categoryDict["HighChol"].count(1)
#HC0 = len(categoryDict["HighChol"]) - HC1
#    #FORMAT variable HD,VEG
#HDVEG11 = 0
#HDVEG10 = 0
#HCVEG11 = 0
#HCVEG10 = 0
#for index in range(len(categoryDict["Veggies"])):
#    if categoryDict["Veggies"][index] == 1:
#        if categoryDict["HeartDiseaseorAttack"][index]==1:
#            HDVEG11 += 1
#        if categoryDict["HighChol"][index] == 1:
#            HCVEG11 += 1
#    else:
#        if categoryDict["HeartDiseaseorAttack"][index]==1:
#            HDVEG10 += 1
#        if categoryDict["HighChol"][index] == 1:
#            HCVEG10 += 1
#HDVEG01 = VEG1 - HDVEG11
#HDVEG00 = VEG0 - HDVEG10
#HCVEG01 = VEG1 - HCVEG11
#HCVEG00 = VEG0 - HCVEG10
#plt.subplot(3,3,4)
#plt.bar(["Veggies", "No Veggies"], [HDVEG01, HDVEG00], color = "lightblue", label ="No Heart Issues") #No heart disease
#plt.bar(["Veggies", "No Veggies"], [HDVEG11, HDVEG10], alpha=0.5, color = "black", label="Heart Issues") #heart disease
#plt.legend(loc="upper right")
    #Basically, veggie already doesn't seem to have an effect on heart disease AND if chol->heartdisease, we see veggie also doesn't have much of an effect
    #on high chol (the only area we'd expect veggie to affect) so it's even more likely that veggie has no effect
        #FORMAT variable high cholesterol, veg
    #Veggie vs chol
#plt.subplot(3,3,5)
#plt.bar(["Veggies", "No Veggies"], [HCVEG01, HCVEG00], color = "green", label="Low Cholesterol") #low cholesterol
#plt.bar(["Veggies", "No Veggies"], [HCVEG11, HCVEG10], alpha=0.35, color = "blue", label="High Cholesterol") #high cholesterol
#plt.legend(loc="upper right")
    #DOUBLE CHECK High chol vs heart disease


#Mental Health leading to Smoker (alcohol has been removed for lack of relevance
    #I think I can do a side-by-side histogram, maybe just change widths
MHSM = []  #Variable to hold BMIs of people who have a heart disease/attack
for index in range(len(categoryDict["MentHlth"])):
    if categoryDict["Smoker"][index] == 1:
        MHSM.append(categoryDict["MentHlth"][index])
MHAL = []
for index in range(len(categoryDict["MentHlth"])):
    if categoryDict["HvyAlcoholConsump"][index]==1:
        MHAL.append(categoryDict["MentHlth"][index])

        #Smokers
    #Contingency Table for smokers-Mental health
        
#MentHlth0_5=0
#MentHlth6_10=0
#MentHlth11_15=0
#MentHlth16_20=0
#MentHlth21_25=0
#MentHlth26_30=0
#MHtot1 = 0
#MHtot2 = 0
#MHtot3 = 0
#MHtot4 = 0
#MHtot5 = 0
#MHtot6 = 0

#to get bar chart of mental health and smoking
IMH5= []
IMH10 = []
IMH15 = []
IMH20 = []
IMH25 = []
IMH30 = []
#Modified to also get distribution of incomes for certain mental health
#INCMH15 = 0
#INCMH110 = 0
#INCMH115 = 0
#INCMH120 = 0
#INCMH125 = 0
#INCMH130 = 0
#INCMH85 = 0
#INCMH810 = 0
#INCMH815 = 0
#INCMH820 = 0
#INCMH825 = 0
#INCMH830 = 0



for i in range(len(categoryDict["MentHlth"])):
    if categoryDict["MentHlth"][i] <= 5:
#        MHtot1 += 1
        IMH5.append(categoryDict["Income"][i])
#        if categoryDict["Income"][i] == 8:
#            INCMH85 += 1
#        elif categoryDict["Income"][i] == 1:
#            INCMH15 += 1
#        if categoryDict["Smoker"][i] == 1:
#            MentHlth0_5+=1
    elif categoryDict["MentHlth"][i] <= 10:
        IMH10.append(categoryDict["Income"][i])
#        MHtot2 += 1
#        if categoryDict["Income"][i] == 8:
#            INCMH810 += 1
#        elif categoryDict["Income"][i] == 1:
#            INCMH110 += 1
#        if categoryDict["Smoker"][i] == 1:
#            MentHlth6_10+=1
    elif categoryDict["MentHlth"][i] <= 15:
        IMH15.append(categoryDict["Income"][i])
#        MHtot3 += 1
#        if categoryDict["Income"][i] == 8:
#            INCMH815 += 1
#        elif categoryDict["Income"][i] == 1:
#            INCMH115 += 1
#        if categoryDict["Smoker"][i] == 1:
#            MentHlth11_15+=1
    elif categoryDict["MentHlth"][i] <= 20:
        IMH20.append(categoryDict["Income"][i])
#        MHtot4 += 1
#        if categoryDict["Income"][i] == 8:
#            INCMH820 += 1
#        elif categoryDict["Income"][i] == 1:
#            INCMH120 += 1
#        if categoryDict["Smoker"][i] == 1:
#            MentHlth16_20+=1
    elif categoryDict["MentHlth"][i] <= 25:
        IMH25.append(categoryDict["Income"][i])
#        MHtot5 += 1
#        if categoryDict["Income"][i] == 8:
#            INCMH825 += 1
#        elif categoryDict["Income"][i] == 1:
#            INCMH125 += 1
#        if categoryDict["Smoker"][i] == 1:
#            MentHlth21_25+=1
    elif categoryDict["MentHlth"][i] <= 30:
        IMH30.append(categoryDict["Income"][i])
#        MHtot6 += 1
#            INCMH830 += 1
#        elif categoryDict["Income"][i] == 1:
#            INCMH130 += 1
#        if categoryDict["Smoker"][i] == 1:
#            MentHlth26_30+=1


    #plot for smokers
        
plt.subplot(4,3,2)
plt.title("Spread of Mental Health days vs Smoke/Alc")
plt.xlabel("Mental Health scores")
plt.ylabel("Counts")
plt.tight_layout()
bins = np.arange(0, 31, 5)
plt.xticks(ticks=bins, labels=bins)
plt.hist(categoryDict["MentHlth"], bins=bins, color = "lightblue", edgecolor="black", label="Total")
plt.hist(MHSM, bins=bins, color = "black", alpha = 0.5, edgecolor="black", label="Smoker")
plt.hist(MHAL, bins=bins, color = "red", alpha = 0.5, edgecolor="black", label="Alcoholic")
plt.legend(loc="upper right")
    #Relation between smoking & Heart disease
SMOK1 = categoryDict["Smoker"].count(1)
SMOK0 = len(categoryDict["Smoker"]) - SMOK1
    #FORMAT variable HD,VEG
HDSMOK11 = 0
HDSMOK10 = 0
for index in range(len(categoryDict["Smoker"])):
    if categoryDict["Smoker"][index] == 1:
        if categoryDict["HeartDiseaseorAttack"][index]==1:
            HDSMOK11 += 1
    else:
        if categoryDict["HeartDiseaseorAttack"][index]==1:
            HDSMOK10 += 1
HDSMOK01 = SMOK1 - HDSMOK11
HDSMOK00 = SMOK0 - HDSMOK10
plt.subplot(4,3,3)
plt.bar(["Smoker", "Not a Smoker"], [HDSMOK01, HDSMOK00], color = "lightblue", label ="No Heart Issues") #No heart disease
plt.bar(["Smoker", "Not a Smoker"], [HDSMOK11, HDSMOK10], alpha=0.5, color = "black", label="Heart Issues") #heart disease
plt.legend(loc="upper right")

HDMH1 = []
HDMH0 = []
plt.subplot(4,3,11)
for i in range(len(categoryDict["HeartDiseaseorAttack"])):
    if categoryDict["HeartDiseaseorAttack"][i] == 1:
        HDMH1.append(categoryDict["MentHlth"][i])
    else:
        HDMH0.append(categoryDict["MentHlth"][i])
plt.xticks(ticks=bins, labels=bins)
plt.hist(HDMH0, bins=bins, color = "lightblue", edgecolor="black", label="Heart Issues")
plt.hist(HDMH1, bins=bins, color = "black", alpha = 0.5, edgecolor="black", label="No Heart Issues")
plt.xlabel("Mental Health Days in a Month")
plt.ylabel("Counts")
plt.legend(loc="upper right")

#Bar graph smokersxhigh chol vs hd
plt.subplot(4,3,12)
SMHCHD111 = 0
SMHCHD101 = 0
SMHCHD011 = 0
SMHCHD001 = 0
SMHCHD110 = 0
SMHCHD100 = 0
SMHCHD010 = 0
SMHCHD000 = 0

for i in range(len(categoryDict["HeartDiseaseorAttack"])):
    if(categoryDict["HeartDiseaseorAttack"][i]) == 1:
        if(categoryDict["Smoker"][i]) == 1:
            if(categoryDict["HighChol"][i]) == 1:
                SMHCHD111 += 1
            else:
                SMHCHD101 += 1
        else:
            if(categoryDict["HighChol"][i]) == 1:
                SMHCHD011 += 1
            else:
                SMHCHD001 += 1
    else:
        if(categoryDict["Smoker"][i]) == 1:
            if(categoryDict["HighChol"][i]) == 1:
                SMHCHD110 += 1
            else:
                SMHCHD100 += 1
        else:
            if(categoryDict["HighChol"][i]) == 1:
                SMHCHD010 += 1
            else:
                SMHCHD000 += 1

plt.bar(["SMHC11", "SMHC10", "SMHC01", "SMHC00"], [SMHCHD110, SMHCHD100, SMHCHD010, SMHCHD000], color = "lightblue", label ="No Heart Issues") #No heart disease
plt.bar(["SMHC11", "SMHC10", "SMHC01", "SMHC00"], [SMHCHD111, SMHCHD101, SMHCHD011, SMHCHD001],alpha=0.5, color = "black", label="Heart Issues") #heart disease
plt.ylabel("Counts")
plt.legend(loc="upper right")

# Income 
incomeHD = []
for index in range(len(categoryDict["Income"])):
    if categoryDict["HeartDiseaseorAttack"][index] == 1:
        incomeHD.append(categoryDict["Income"][index])
plt.subplot(4,3,6)
plt.title("Spread of people who had a heart disease/attack via Income")
plt.xlabel("Income")
plt.ylabel("Counts")
plt.tight_layout()
bins = np.arange(int(min(categoryDict["Income"])), int(max(categoryDict["Income"]) + 1), 1)
plt.xticks(ticks=bins, labels=bins)
plt.hist(categoryDict["Income"], bins=bins, color = "lightblue",
                     edgecolor="black", label="No Heart Issues")
plt.hist(incomeHD, bins=bins, color = "black", alpha = 0.5,
                     edgecolor="black", label="Heart Issues")
plt.legend(loc="upper right")

plt.subplot(4, 3, 7)
HDI11 = 0
HDI01 = 0
HDI18 = 0
HDI08 = 0
for index in range(len(categoryDict["HeartDiseaseorAttack"])):
    if categoryDict["HeartDiseaseorAttack"][index] == 1:
        if categoryDict["Income"][index] == 1:
            HDI11 += 1
        elif categoryDict["Income"][index] == 8:
            HDI18 += 1
    else:
        if categoryDict["Income"][index] == 1:
            HDI01 += 1
        elif categoryDict["Income"][index] == 8:
            HDI08 += 1
plt.bar(["Income 8", "Income 1"], [HDI08, HDI01], color = "lightblue", label ="No Heart Issues") #No heart disease
plt.bar(["Income 8", "Income 1"], [HDI18, HDI11], alpha=0.5, color = "black", label="Heart Issues") #heart disease
plt.ylabel("Counts")
plt.legend(loc="upper right")

#Income vs highchol

HC1 = []
HC0 = []

for index in range(len(categoryDict["Income"])):
    if categoryDict["HighChol"][index] == 1:
        HC1.append(categoryDict["Income"][index])
    else:
        HC0.append(categoryDict["Income"][index])

plt.subplot(4, 3, 10)

plt.hist(HC1, bins=bins, color = "pink",
                     edgecolor="black", label="High Chol 1")
plt.hist(HC0, bins=bins, color = "black", alpha = 0.35,
                     edgecolor="black", label="High Chol 0")
plt.xticks(ticks=bins, labels=bins)
plt.xlabel("Income Distribution")
plt.ylabel("Counts")
plt.legend(loc="upper right")



#I think for income vs mental health
#we can take the income histogram and then segment it with different ranges of mental health
#So let's think, we might have to use a dictionary for each income anyways... or a list at least

#List for mental healths at 0-5 and instead of adding mental healths
#for each mental health 0-5, we'll add that income (ie 1, 2, 3, etc...) to a list
#and then color that list

#don't have to modify bins since it carries on from above

plt.subplot(4, 3, 4)
plt.hist(categoryDict["Income"], bins=bins, color = "lightblue",
                     edgecolor="black", label="total")
plt.hist(IMH5, bins=bins, color = "red", alpha = 0.5,
                     edgecolor="black", label="0-5 MH Days")
plt.hist(IMH10, bins=bins, color = "green", alpha = 0.5,
                     edgecolor="black", label="6-10 MH Days")
plt.xticks(ticks=bins, labels=bins)
plt.xlabel("Income Distribution")
plt.ylabel("Counts")
plt.legend(loc="upper right")
#Split graphs up for readability
plt.subplot(4, 3, 5)
#Make a note about the scaling
plt.xlabel("Income Distribution")
plt.ylabel("Counts")
plt.hist(IMH30, bins=bins, color = "purple",
                     edgecolor="black", label="26-30 MH Days")
plt.hist(IMH15, bins=bins, color = "lightblue",
                     edgecolor="black", label="11-15 MH Days")
plt.hist(IMH20, bins=bins, color = "red",
                     edgecolor="black", label="16-20 MH Days")
plt.hist(IMH25, bins=bins, color = "green",
                     edgecolor="black", label="21-25 MH Days")
plt.xticks(ticks=bins, labels=bins)
plt.legend(loc="upper right")




#BMI VS HD
    #BMI Data organization
BMIHP = []  #Variable to hold BMIs of people who have a heart disease/attack
for index in range(len(categoryDict["BMI"])):
    if categoryDict["HeartDiseaseorAttack"][index] == 1:
        BMIHP.append(categoryDict["BMI"][index])

    #subplot BMI histogram
plt.subplot(4,3,1)
plt.title("Spread of people who had a heart disease/attack via BMI")
plt.xlabel("BMI")
plt.ylabel("Counts")
plt.tight_layout()
bins = np.arange(0, 100, 5)
plt.xticks(ticks=bins, labels=bins)
plt.hist(categoryDict["BMI"], bins=bins, color = "lightblue",
                     edgecolor="black", label="No Heart Issues")
plt.hist(BMIHP, bins=bins, color = "black", alpha = 0.5,
                     edgecolor="black", label="Heart Issues")
plt.legend(loc="upper right")

#BMI vs HD Cont. table
#HDBMI110 = 0
#HDBMI120 = 0
#HDBMI130 = 0
#HDBMI140 = 0
#HDBMI150 = 0
#HDBMI160 = 0
#HDBMI170 = 0
#HDBMI180 = 0
#HDBMI190 = 0
#HDBMI1100 = 0
#BMI10 = 0
#BMI20 = 0
#BMI30 = 0
#BMI40 = 0
#BMI50 = 0
#BMI60 = 0
#BMI70 = 0
#BMI80 = 0
#BMI90 = 0
#BMI100 = 0

#for index in range(len(categoryDict["BMI"])):
#    if categoryDict["BMI"][index] <=10:
#        BMI10 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI110 += 1
#    elif categoryDict["BMI"][index] <=20:
#        BMI20 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI120 += 1
#    elif categoryDict["BMI"][index] <=30:
#        BMI30 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI130 += 1
#    elif categoryDict["BMI"][index] <=40:
#        BMI40 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI140 += 1
#    elif categoryDict["BMI"][index] <=50:
#        BMI50 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI150 += 1
#    elif categoryDict["BMI"][index] <=60:
#        BMI60 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI160 += 1
#    elif categoryDict["BMI"][index] <=70:
#        BMI70 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI170 += 1
#    elif categoryDict["BMI"][index] <=80:
#        BMI80 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI180 += 1
#    elif categoryDict["BMI"][index] <=90:
#        BMI90 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI190 += 1
#    elif categoryDict["BMI"][index] <=100:
#        BMI100 += 1
#        if categoryDict["HeartDiseaseorAttack"][index] == 1:
#            HDBMI1100 += 1

#BMI vs Income
plt.subplot(4, 3, 8)
INCBMI1 = []
INCBMI2 = []
INCBMI3 = []
INCBMI4 = []
INCBMI5 = []
INCBMI6 = []
INCBMI7 = []
INCBMI8 = []
for index in range(len(categoryDict["Income"])):
    if categoryDict["Income"][index] == 1:
        INCBMI1.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 2:
        INCBMI2.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 3:
        INCBMI3.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 4:
        INCBMI4.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 5:
        INCBMI5.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 6:
        INCBMI6.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 7:
        INCBMI7.append(categoryDict["BMI"][index])
    if categoryDict["Income"][index] == 8:
        INCBMI8.append(categoryDict["BMI"][index])
plt.xlabel("BMI")
plt.ylabel("Counts")

#bins carry on from BMI

#MAYBE TAKE OUT the total so we can see it to scale, just move the
#other total down lower
#plt.hist(categoryDict["BMI"], bins=bins, color = "lightblue",
#                     edgecolor="black", label="total")
plt.hist(INCBMI4, bins=bins, color = "yellow",
                     edgecolor="black", label="Income 4")
plt.hist(INCBMI3, bins=bins, color = "green",
                     edgecolor="black", label="Income 3")
plt.hist(INCBMI2, bins=bins, color = "red",
                     edgecolor="black", label="Income 2")
plt.hist(INCBMI1, bins=bins, color = "lightblue",
                     edgecolor="black", label="Income 1")
plt.legend(loc="upper right")

plt.subplot(4, 3, 9)
plt.hist(INCBMI8, bins=bins, color = "yellow",
                     edgecolor="black", label="Income 8")
plt.hist(INCBMI7, bins=bins, color = "green",
                     edgecolor="black", label="Income 7")
plt.hist(INCBMI6, bins=bins, color = "red",
                     edgecolor="black", label="Income 6")
plt.hist(INCBMI5, bins=bins, color = "lightblue",
                     edgecolor="black", label="Income 5")
plt.xlabel("BMI")
plt.ylabel("Counts")
plt.legend(loc="upper right")
plt.show()
