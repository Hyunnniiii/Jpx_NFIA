#directory containing the intersected BED files
input_dir="/directory"
output_file="/directory"

#initialize the output BED file (CSV 형식으로 저장할 수 있도록 설정)
echo -e "chr\tstart\tend\tgene" > $output_file

#specify the intersected BED file for a single sample
intersect_file="${input_dir}jpx3kb_peak_itsct.bed"

#Check if intersect file exists
if [ -f "intersect_file"]; then
  echo "Processing $intersect_file"

  #Extract unique peaks (chr, start, end) and keep all original information
   awk '!seen[$1,$2,$3]++' "$intersect_file" >>output_file

   echo "Unique peaks saved to $output_file"
else 
   echo"Intersect file $intersect_file not found"
fi
