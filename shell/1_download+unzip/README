# download data

## shell
Try 'bash download_sra_to_fastq.sh h' for help



## software used in shell

### sratoolkit prefecth		Download data from NCBI to directory sra/

#### 多数据
prefetch -p(显示进度) --max-size 100G(最大可下载数据大小，默认20G) --option-file SRR_Acc_List.txt(SRR数据列表)
#### 单个数据
prefetch --max-size 100G(最大可下载数据大小，默认20G) SRRXXXX

### sra to fastq		Unzip sra file into fastq.gz to directory fastq/
fastq-dump --gzip --split-3 SRRXXX -O path/
