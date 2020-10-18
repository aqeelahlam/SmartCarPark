"""
Created on 7 October 2020

@author: Bee Khee Siang
@student_id: 29578272
"""


import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime
import logging
import pandas as pd
import json

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class Firestore_db():

    def __init__(self):
        cred = credentials.Certificate('./fyp_credentials.json')
        self.default_app = firebase_admin.initialize_app(cred)
        self.db = firestore.client()


    def add_new_slot(self, slotNumber, status, floor):
        try:
            doc_ref = self.db.collection('slots').document(slotNumber)

            doc_ref.set({
                'floor': floor,
                'status': status,
                'created_at': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                'updated_at': datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            })
            logger.info('Slot {} added'.format(slotNumber))
        except Exception as e:
            logger.info(e)


    def update_slot_status(self, slotNumber, status):
        try:
            doc_ref = self.db.collection('slots').document(slotNumber)

            doc_ref.update({
                'status': status,
                'updated_at': datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            })
            logger.info('Slot {} updated'.format(slotNumber))
        except Exception as e:
            logger.info(e)


    def get_slot_data(self, slotNumber):
        try:
            doc_ref = self.db.collection('slots').document(slotNumber)
            doc = doc_ref.get().to_dict()
        except Exception as e:
            logger.info(e)
            doc = {}
        return doc


    def get_all_data(self):
        main_df = pd.DataFrame(columns=['slot', 'floor', 'status', 'updated_at'])
        try:
            doc_ref = self.db.collection('slots').stream()

            for docs in doc_ref:
                slotNumber = docs.id
                doc = docs.to_dict()
                data = {**{'slot': slotNumber}, **doc}
                main_df = main_df.append(data, ignore_index=True)
        except Exception as e:
            logger.info(e)
        return main_df






if __name__ == '__main__':
    firebase = Firestore_db()
    firebase.get_all_data



