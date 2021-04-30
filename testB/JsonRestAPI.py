# -*- coding: utf-8 -*-
def get_activity(num_participants):
    activities = ["'Do a jigsaw puzzle'"
                  ,"'Compliment someone'"
                  ,"'Go to a concert with local artists with some friends'"
                  ,"'Hold a video game tournament with some friends'"
                  ,"'Have a jam session with your friends'"
                  ,"Json: [{'error': 'No activity found with the specified parameters'}]"
                 ]
    if num_participants < 6:
        response = "For %s participants, the activity we found is %s" % (num_participants, activities[num_participants-1])
    else:
        response = "For %s participants, an error occurred. %s" % (num_participants, activities[5])
    return response



def main():
    for i in range(1,7):
        print(get_activity(i))

if __name__ == "__main__":
    main()
    