#!/usr/bin/env bash

set -e;

MODEL_PATH="/extension/data/models";

ACCURATE_MODEL="unsloth/Qwen3.8-27B-UD-IQ3_S.gguf";
SPEED_MODEL="unsloth/Qwen3.6-35B-A3B-UD-IQ3_S.gguf";

MODEL="$MODEL_PATH/$SPEED_MODEL";

LLAMA_SERVER_API_KEY="free-ai-secret-key";

# docs: https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md
llama-server --model $MODEL \
  --host '0.0.0.0' --port 4141 --api-key $LLAMA_SERVER_API_KEY \
  --parallel 1 --n-gpu-layers 99 \
  --batch-size 2048 --ubatch-size 512 \
  --flash-attn on \
  --cache-type-k q8_0 --cache-type-v q8_0 \
  --kv-unified \
  --cache-prompt --cache-reuse 2048 \
  --ctx-size 98304 --fit-ctx 98304 \
  --context-shift \
  --reasoning on --no-reasoning-preserve \
  --cache-ram 4096 \
  --metrics --log-verbosity 4;
