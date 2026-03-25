# 필요한 라이브러리 로드
library(dplyr)

# 시드 설정
set.seed(123)

# 랜덤 샘플 생성 함수
create_random_sample <- function(data, sample_size) {
  return(data[sample(nrow(data), sample_size), ])
}

# 샘플 크기 및 샘플 수 설정
sample_size <- 1345
num_samples <- 1000

# 새로운 폴더 생성
dir.create("random_sample1000")

# 랜덤 샘플 생성 및 저장
for (i in 1:num_samples) {
  random_sample <- create_random_sample(data, sample_size)
  file_name <- paste0("random_sample1000/random_sample_", i, ".bed")  # 새 폴더에 저장
  write.table(random_sample, file_name, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)
}
