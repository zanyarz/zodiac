
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

COPY . /workspace/self-critical

# ----------------------------------------------------------------------------
# -- install apt and pip dependencies
# ----------------------------------------------------------------------------

RUN apt-get update && \
    apt-get install -y \
    ant \
    gcc \
    vim \
    ca-certificates-java \
    nano \
    openjdk-8-jdk \
    python3 \
    unzip \
    wget && \
    apt-get clean

#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
#RUN update-ca-certificates -f && export JAVA_HOME

RUN pip install --upgrade pip

RUN pip install Cython && pip install h5py \
    matplotlib \
    nltk \
    numpy \
    yacs \
    tensorboard \
    transformers \
    gensim \
    pycocotools \
    scikit-image \
    lmdb \
#   smart-open \
#   stanfordcorenlp \
#   tensorflow \
#   torchtext \
    tqdm && python -c "import nltk; nltk.download('punkt')"


# ----------------------------------------------------------------------------
# -- download pretrained imagenet weights for resnet-101
# ----------------------------------------------------------------------------
#RUN mkdir /workspace/self-critical/data/
#RUN cd /workspace/self-critical/data/ && \
#    wget http://cs.stanford.edu/people/karpathy/deepimagesent/caption_datasets.zip && \
#    unzip caption_datasets.zip && \
#    cd /workspace/self-critical/data/caption_datasets && \
#    get_stanford_models.sh

#RUN python scripts/prepro_labels.py --input_json data/caption_datasets/dataset_coco.json --output_json data/caption_datasets/cocotalk.json --output_h5 data/cocotalk


#WORKDIR /workspace/neuralbabytalk
#RUN python prepro/prepro_dic_coco.py \
#    --input_json data/coco/dataset_coco.json \
#    --split normal \
#    --output_dic_json data/coco/dic_coco.json \
#    --output_cap_json data/coco/cap_coco.json && \
#    python prepro/prepro_dic_coco.py \
#    --input_json data/coco/dataset_coco.json \
#    --split robust \
#    --output_dic_json data/robust_coco/dic_coco.json \
#    --output_cap_json data/robust_coco/cap_coco.json && \
#    python prepro/prepro_dic_coco.py \
#    --input_json data/coco/dataset_coco.json \
#    --split noc \
#    --output_dic_json data/noc_coco/dic_coco.json \
#    --output_cap_json data/noc_coco/cap_coco.json

#EXPOSE 8888

