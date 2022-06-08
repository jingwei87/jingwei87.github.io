---
layout: single
permalink: /software/sgxdedup/
toc: true
sidebar:
- title: SGXDedup
  image: /software/sgxdedup/arch.jpg
  text: "SGXDedup is an SGX-based encrypted deduplication system with high performance. It directly runs sensitive operations in SGX enclaves, so as to improve the performance of encrypted deduplication, while maintaining its security, bandwidth efficiency, and storage efficiency."
---


# SGXDedup: Accelerating Encrypted Deduplication via SGX

## Introduction

Encrypted deduplication preserves the deduplication effectiveness on encrypted data and is attractive for outsourced storage.  However, existing encrypted deduplication approaches build on expensive cryptographic primitives that incur substantial performance slowdown.  We present SGXDedup, which leverages Intel SGX to speed up encrypted deduplication based on server-aided message-locked encryption (MLE) while preserving security via SGX.  SGXDedup implements a suite of secure interfaces to execute MLE key generation and proof-of-ownership operations in SGX enclaves.  It also proposes various designs to support secure and efficient enclave operations.  Evaluation of synthetic and real-world workloads shows that SGXDedup achieves significant speedups and maintains high bandwidth and storage savings.

### Publication

* Yanjing Ren, Jingwei Li, Zuoru Yang, Patrick P. C. Lee, and Xiaosong Zhang. Accelerating Encrypted Deduplication via SGX. In Proc of USENIX Annual Technical Conference (ATC'21), July 2021.

## Downloads

[![](https://img.shields.io/badge/sgxdedup-version 1.0-blue.svg)](https://www.icloud.com.cn/iclouddrive/016qFqA__XH_iX4Mu0xdtsAOQ#SGXDedup-1)
