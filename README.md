# ZoDIAC: Zoneout Dropout Injection Attention Calculation

This repo includes the code for ZoDIAC paper submitted to Springer Nature AIRE (Currently Under Review). Arxiv preprint in progress.

## Performance

Performance using Cross Entropy Loss and Adam Optimizer.

| Model  | B1 | B2 | M | S | C
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| ZoDIAC(Tanh)  | 77.4  | 36.6 | 28.0 | 21.4 | 115.9 |
| ZoDIAC(Sigmoid)  | 77.0 | 36.1 | 27.9 | 21.3 | 115.5 |
| Transformer(ours)  | 76.1 | 34.0 | 27.6 | 21.0 | 113.3 |
| ZoDIAC+AoA(tanh) | 77.4 | 36.8 | 28.2 | 21.6 | 117.6 |
| ZoDIAC+AoA(sigmoid) | 77.3 | 36.8 | 28.2 | 21.6 | 117.4 |
| AoA(ours) | 77.1 | 36.7 | 28.1 | 21.5 | 117.3 |

## Requirements

Python 3.6 and above.

PyTorch 1.6 (along with torchvision)

Other requirements are handled by the DockerFile.

## Prepare data

See details in [data.md](data/README.md). 

## Prepare Envinronment

With docker installed on the machine, you can run the following command to prepare the environment from project root directory.

```bash
$ docker build -t zodiac:self-critical .
```
We also need to mount the data folder to the docker container. First move the data folder to any folder you want from the root directory. Then, run the following command.

```bash
$ EXPORT ZODICA_DATA_DIR="/path/to/data"
```

Then you can run the following command to run the docker image.

```bash
$ docker run --runtime=nvidia --name zc1 -it \
        -v $ZODICA_DATA_DIR:/workspace/self-critical/data \
        --shm-size 32G -p 777:777 zodiac:self-critical /bin/bash \
```

Lastly, when inside the docker container, we need to define an ID for the code tor run as the following:

```bash
$ EXPORT ID="zc1"
```

Of course, for other runs, you can use other IDs.

## Training & Evaluation

For training and evaluation we have created shell scripts available in [shcmd](\shcmd) folder. You can use them directly from the project directory.

### Training

For training Transformer model we use the following command:

```bash
$ sh shcmd/train.sh --caption_model transformer
```

For training ZoDIAC-Sigmoid model we use the following command:

```bash 
$ sh shcmd/train.sh --caption_model zodiac-sigmoid
```

For training ZoDIAC-Tanh model we use the following command:

```bash
$ sh shcmd/train.sh --caption_model zodiac-tanh
```

### Evaluate on Karpathy's test split

For evalutaing all models use the following command:

```bash
$ sh shcmd/eval.sh
```

### Evaluate on COCO test set

```bash
$ sh shcmd/eval.sh --input_json cocotest.json
```

### Ensemble Evaluation

First modify the shcmd/eval_ensemble.sh based on the IDs of multiple runs for ensemble evaluation. Then, run the following command:

```bash
$ sh shcmd/ensemble.sh
```

## Acknowledgements

Thanks to the [self-critical](https://github.com/ruotianluo/self-critical.pytorch/) repo by Ruotian Luo.