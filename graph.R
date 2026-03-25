import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# CSV 파일에서 샘플 데이터 읽기
sample_data = pd.read_csv('C:/Users/pigeo/Desktop/과제실험/zzinmak/results1000.csv')

# 샘플 데이터가 있는 열 이름을 'count'라고 가정합니다. 실제 열 이름에 맞게 수정하세요.
data_values = sample_data['count'].values

# 실제 데이터 값 입력 받기
while True:
    try:
        actual_value = float(input("실제 데이터 값을 입력하세요: "))
        break  # 입력이 성공하면 루프 탈출
    except ValueError:
        print("유효한 숫자를 입력하세요.")

# 데이터 분포 시각화
plt.figure(figsize=(10, 6))

# 히스토그램 그리기 (샘플 데이터는 회색)
sns.histplot(data_values, bins=50, color='gray', stat='density', label='Sample Data Distribution', kde=False)

# 실제 데이터 값을 수직선으로 표시
plt.axvline(actual_value, color='red', label='Actual Data Value', linestyle='-', linewidth=5)

# 그래프 제목 및 레이블 추가
plt.title('Sample Data Distribution and Actual Data Value')
plt.xlabel('Value')
plt.ylabel('Density')
plt.legend()
plt.grid()

# 그래프 보여주기
plt.show()
