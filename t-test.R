import pandas as pd
from scipy import stats

# 엑셀 파일 경로
file_path = 'C:/Users/pigeo/Desktop/과제실험/zzinmak/results1000.csv'

# CSV 파일에서 데이터 읽기
data = pd.read_csv(file_path)

# 랜덤 샘플의 intersect 개수 배열 만들기
random_samples = data['count'].values

# 실제 데이터의 intersect 개수 (예시 값)
actual_count = 198  # 실제 데이터의 intersect 개수를 입력하세요.

# t-test 수행
t_statistic, p_value = stats.ttest_1samp(random_samples, actual_count)

print("T-statistic:", t_statistic)
print("P-value:", p_value)

# 유의수준 설정 (예: 0.05)
alpha = 0.01
if p_value < alpha:
    print("귀무가설을 기각합니다. 실제 데이터가 랜덤 샘플보다 유의미하게 큽니다.")
else:
    print("귀무가설을 기각하지 못합니다. 실제 데이터가 랜덤 샘플보다 유의미하게 크지 않습니다.")
