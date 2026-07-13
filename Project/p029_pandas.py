import pandas as pd

#주식 데이터와 회사 이름으로 시리즈 생성
data =[100, 200, 300, 400]
index = ['삼성전자', 'LG전자', 'SK하이닉스', '네이버']
series = pd.Series(data, index=index)