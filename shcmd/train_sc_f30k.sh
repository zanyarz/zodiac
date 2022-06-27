CUDA_VISIBLE_DEVICES=0,1,2,3 python3 train.py --cfg configs/transformer_f30k_sc.yml --id $id --batch_size 50 --language_eval 1
