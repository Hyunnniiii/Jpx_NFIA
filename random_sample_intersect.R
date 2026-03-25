# 기준 파일 이름 (intersect할 파일)
reference_file="Jpx.mm10.peakcall_summits.bed"  # 기준 파일의 경로를 입력하세요.

# 샘플 파일이 저장된 디렉토리
sample_directory="/home/bboyamm/zzinmak/random_sample1000/"  # 샘플 파일이 저장된 디렉토리 경로를 입력하세요.

# 결과를 저장할 디렉토리
output_directory="/home/bboyamm/zzinmak/output1000/"  # 결과를 저장할 디렉토리 경로를 입력하세요.

# 샘플 파일 개수
num_samples=1000

# intersect 실행
for i in $(seq 1 $num_samples); do
  sample_file="${sample_directory}random_sample_${i}.bed"
  output_file="${output_directory}intersected_sample_${i}.bed"
  
  # bedtools intersect 명령어 실행
  bedtools intersect -a "$sample_file" -b "$reference_file" > "$output_file"
done

echo "All intersects completed."
