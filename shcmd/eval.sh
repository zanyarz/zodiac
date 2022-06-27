CUDA_VISIBLE_DEVICES=0 python3 eval.py --input_att_dir data/cocobu_att --beam_size 3 --dump_images 0 --num_images 5000 --model log_$id/model-best.pth --infos_path log_$id/infos_$id.pkl  --language_eval 1

