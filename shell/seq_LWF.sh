export CUDA_VISIBLE_DEVICES=0,1
LOG_NAME=2card_seq_LWF
OUT_DIR=/kaggle/working/${LOG_NAME}

cd ../train/
python -m torch.distributed.run --nproc_per_node=2 --master_port=12600 train_LWF.py \
--config ../configs/exp/free.yaml \
--base_config ../configs/base_seqF.yaml \
--output_dir ${OUT_DIR} \
2>&1 | tee ../logger/${LOG_NAME}.log
