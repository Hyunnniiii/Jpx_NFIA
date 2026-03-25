
# 필요한 패키지 설치 및 로드
if (!requireNamespace("biomaRt", quietly = TRUE)) {
  install.packages("biomaRt")
}
if (!requireNamespace("data.table", quietly = TRUE)) {
  install.packages("data.table")
}


# 작업 디렉토리 설정
setwd("C:/Users/codak/Desktop/과제/지현")

library(data.table)
library(biomaRt)

# BED 파일 읽기
bed_file <- fread("trippleintersects__.bed", header = FALSE)
colnames(bed_file) <- c("chr", "start", "end")
bed_file[, chr := gsub("^chr", "", chr)]

# Ensembl 연결 설정
ensembl_version <- 99
ensembl <- useEnsembl(biomart = "ensembl", dataset = "mmusculus_gene_ensembl", version = ensembl_version)

# 지정된 범위 내의 유전자 쿼리
genes <- getBM(
  attributes = c("chromosome_name", "start_position", "end_position", "external_gene_name"),
  filters = c("chromosome_name", "start", "end"),
  values = list(bed_file$chr, bed_file$start, bed_file$end),
  mart = ensembl
)

# 결과를 data.table로 변환
genes <- as.data.table(genes)
genes[, start_position := as.integer(start_position)]
genes[, end_position := as.integer(end_position)]
genes[, chromosome_name := as.character(chromosome_name)]

# data.table에 키 설정
setkey(bed_file, chr, start, end)
setkey(genes, chromosome_name, start_position, end_position)

# 겹침 계산
merged_data <- foverlaps(bed_file, genes, by.x = c("chr", "start", "end"), 
                         by.y = c("chromosome_name", "start_position", "end_position"), 
                         type = "any", nomatch = 0L)

# 중복 매칭 제거
merged_data_unique <- unique(merged_data[, .(chr, start, end, external_gene_name)])

# 고유한 겹치는 유전자 출력
print(merged_data_unique)

# 고유한 유전자 수 확인
num_unique_genes <- uniqueN(merged_data_unique$external_gene_name)
print(num_unique_genes)
