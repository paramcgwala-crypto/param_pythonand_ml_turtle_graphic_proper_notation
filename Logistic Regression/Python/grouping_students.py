#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 15 22:45:20 2022

@author: shubhamjuneja
"""
#%%
import random
import pandas as pd
#%%
def chunks(l, n):
    """Yield successive n-sized chunks from l."""
    for i in range(0, len(l), n):
        yield l[i:i + n]
#%%

n = ['SHAGUFA NAHID',
'TUSHAR SHENDE',
'SOUMYA KESHARWANI',
'MONIKA CHHATWANI',
'PRIYANKA SAHU',
'SRISHTI SEN',
'SIMRAN RATHORE',
'SHRUTI AHIR',
'VARNITA KERKETTA',
'MADHUMITA AICH',
'NIKITA SONKAR',
'AVNISH KOUR REHAL',
'AYUSHI AGRAWAL',
'PRIYA PARASHAR',
'PRIYA KESHWANI',
'SAIFY ALI',
'Tefestin Anthony',
'Ruchi Katendra']

random.shuffle(n)

a = list(chunks(n, 3))
#%%
# [['B', 'H', 'G'], ['D', 'A', 'C'], ['E', 'F', 'I'], ['J', 'K']]
req_dict = {}
for i in range(len(a)):
    req_dict[i] = a[i]
#%%
final_df = pd.DataFrame.from_dict(req_dict,orient='index')
final_df.columns = ['student_1','student_2','student_3']
 #%%
final_df.to_csv('assignment_group.csv')   