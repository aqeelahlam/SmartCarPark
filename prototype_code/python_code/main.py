"""
Created on 7 October 2020

@author: Bee Khee Siang
@student_id: 29578272
"""


import serial 
import time
import pandas as pd
import os
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)
import sys
sys.path.append("..")
from firebase import Firestore_db

import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def get_updates(L1_A, L1_B, L2):
    """
    Function that gets the status of each parking slot in the prototype
    return: dataframe of all parking slots and their current status 
    """
    L1_A.flushInput()
    L1_B.flushInput()
    L2.flushInput()
    L1_A_list = []
    L1_B_list = []
    L2_list = []

    logger.info('Scraping Arduino data')
    for i in range(4):
        L1_A_list.append(L1_A.readline())
        L1_B_list.append(L1_B.readline())
        L2_list.append(L2.readline())

    main_list = L1_A_list + L1_B_list + L2_list
    final_list = []
    logger.info('Cleaning Arduino data')
    for slot in main_list:
        temp_list = slot.decode().strip().split(";")
        if temp_list[1] == 'True':
            temp_list[1] = True
        else:
            temp_list[1] = False
        final_list.append(temp_list)
        
        
    # Putting everything into a dataframe
    df = pd.DataFrame(final_list, columns=['slot', 'updated_status'])
    return df
    
    
def main(max_loop):
    """
    Function that gets the latest status of parking slots and updates the database accordingly
    :param (int)max_loop: number of times to loop 
    return: 
    """
    L2 = serial.Serial("/dev/ttyACM1")
    L2.baudrate = 9600

    L1_A = serial.Serial("/dev/ttyACM0")
    L1_A.baudrate = 9600

    L1_B = serial.Serial("/dev/ttyACM2")
    L1_B.baudrate = 9600
    
    # Gets the current version or the database
    firebase = Firestore_db()
    main_df = firebase.get_all_data()
    main_df = main_df[['slot', 'status']]
    counter = 0
    
    # Loop
    while counter <= max_loop:
        updated_df = get_updates(L1_A, L1_B, L2)
        
        logger.info('Checking for updates')
        # Merging both dataframes
        merged = pd.merge(main_df, updated_df, on='slot')
        # Checking for differences in status
        updates = merged[merged['status'].astype(str) != merged['updated_status'].astype(str)]
        
        if not updates.empty:
            logger.info('Number of slots to update: ' + str(len(updates)))
            for index, row in updates.iterrows():
                firebase.update_slot_status(row['slot'], row['updated_status'])

                # updates the main_df in the script as well, so that we only need to pull from db once
                main_df.loc[index]['status'] = row['updated_status']
            logger.info('All slots updated')
        
        time.sleep(10)
        counter += 1
    
    
    
    
if __name__ == '__main__':
    main(25)
    


