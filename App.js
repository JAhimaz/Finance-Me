import React, { useState, useEffect } from 'react';
import {
  Text,
  SafeAreaView,
  StyleSheet,
  View,
  TouchableOpacity,
  Button,
} from 'react-native';
import type {Node} from 'react';


const App: () => Node = () => {

  const [count, setCount] = useState(0);
  const [savingsGoal, setSavingsGoal] = useState(0);

  useEffect(() => {    
    setCount(1500.70);
    setSavingsGoal(5000.00);
  });

  const addExpenditure = () => {
    
  } 
  
  return (
    <SafeAreaView style={styles.app}>
      <View style={styles.balanceSection}>
        <Text style={styles.balanceText}>Current Saving</Text>
        <Text style={styles.currentBalance}>RM{count.toFixed(2)}</Text>
        <Text style={styles.savingsText}>Savings Goal</Text>
        <Text style={styles.savingsGoal}>RM{savingsGoal.toFixed(2)}</Text>
      </View>
      <View style={styles.expenditureSection}>
          <View
            style={[
              styles.box,
              {
                flexBasis: 'auto',
                flexGrow: 1,
                flexShrink: 0,
              },
            ]}>
              <Text style={{
                    paddingTop: 10,
                    color: '#b4b5b9',
                    fontSize: 20,
                    fontFamily: 'MyriadPro-Regular',
              }}>Recent Expenditure</Text>
          </View>
          <View
            style={[
              styles.box,
              {
                flexBasis: 50,
                flexGrow: 0,
                flexShrink: 1,
              },
            ]}
          >
          <TouchableOpacity onPress={addExpenditure()} style={styles.appButtonContainer}>
            <Text style={styles.appButtonText}>+</Text>
          </TouchableOpacity>
          </View>
        </View>
      
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  app: {
    height: '100%',
    backgroundColor: '#071e3d',
  },
  balanceSection: {
    padding: 20,
  },
  balanceText: {
    color: '#b4b5b9',
    fontSize: 20,
    fontFamily: 'MyriadPro-Regular',
  },
  currentBalance: {
    color: '#21e6c1',
    fontSize: 45,
    fontFamily: 'MyriadPro-Regular',
  },
  savingsText: {
    color: '#0b3164',
    fontSize: 20,
    fontFamily: 'MyriadPro-Regular',
  },
  savingsGoal: {
    color: '#0b3164',
    fontSize: 25,
    fontFamily: 'MyriadPro-Regular',
  },
  expenditureSection: {
    borderTopColor: '#0b3164',
    borderTopWidth: 1,
    height: '20%',
    padding: 20,
    alignSelf: "center",
    flexDirection: "row",
  },
  appButtonContainer: {
    backgroundColor: "#009688",
    paddingVertical: 10,
    paddingHorizontal: 12,
    borderRadius: 5,
  },
  appButtonText: {
    fontSize: 20,
    color: "#fff",
    fontWeight: "bold",
    alignSelf: "center",
    textTransform: "uppercase"
  }
});

export default App;
