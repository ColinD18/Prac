class BayesianNetwork:
    def __init__(self):
        self.cpt_alarm = {
            (True, True): {'True': 0.94, 'False': 0.06},
            (True, False): {'True': 0.95, 'False': 0.04},
            (False, True): {'True': 0.31, 'False': 0.69},
            (False, False): {'True': 0.001, 'False': 0.999}
        }
        self.cpt_david = {
            True: {'True': 0.91, 'False': 0.09},
            False: {'True': 0.05, 'False': 0.95}
        }
        self.cpt_sophia = {
            True: {'True': 0.75, 'False': 0.25},
            False: {'True': 0.02, 'False': 0.98}
        }

    def compute_alarm_probability(self, burglary, earthquake):
        return self.cpt_alarm[(burglary, earthquake)]

    def compute_david_probability(self, alarm):
        return self.cpt_david[alarm]

    def compute_sophia_probability(self, alarm):
        return self.cpt_sophia[alarm]
    
def main():
    network = BayesianNetwork()

    burglary_input = input("Burglary occurred (True/False): ").lower() == 'true'
    earthquake_input = input("Earthquake occurred (True/False): ").lower() == 'true'

    alarm_probability = network.compute_alarm_probability(burglary_input, earthquake_input)
    print("Probability of Alarm given Burglary and Earthquake:", alarm_probability)

    david_probability = network.compute_david_probability(True)['True']
    print("Probability of David's call given Alarm:", david_probability)
    
    sophia_probability = network.compute_sophia_probability(True)['True']
    print("Probability of Sophia's call given Alarm:", sophia_probability)

if __name__ == "__main__":
    main()
