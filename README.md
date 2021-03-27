# crop_management
This project handles pricing of crops for mandi/markets across India on daily basis.

**Notes**
1) During implementation did not think about thread safety
2) Did not write testcases as it is in-memory and preparing testdata and persisting it for multiple testcase was a hard task and it required some more effort
3) To undestand code better go through APIs and librarys
4) I have used Singleton design pattern at multiple places


**Prerequisite**
ruby-2.7.1
any OS with ruby support

**Steps to start server**
1) _bundle install_
2) rails s

**End Points**
1) route = _/insert_entry_
   type = **post**
   request_body = 
      {
    "state": "haryana",
    "dist": "bhiwani",
    "mandi": "grain market",
    "crop": "tomato",
    "variety": "hybrid",
    "price": 25,
    "date": "2021-01-01"
      }
response = {success}

2) route = _/get_latest_
   type = get
   params = {
      "state": "haryana",
      "dist": "bhiwani",
      "crop": "tomato",
    }
    response = [
      ["haryana, bhiwani, grain market","tomato, hybrid",{"date":"2021-01-01","price":25}]
    ]
3) route = _/get_limited_result_
   type = get
   params = 
      {
    "state": "haryana",
    "dist": "bhiwani",
    "mandi": "grain market",
    "crop": "tomato",
    "variety": "hybrid",
    "points": 1,
    "days": 120
      }
    response = [
    {"date":"2021-01-01","price":25}
    ]
   
