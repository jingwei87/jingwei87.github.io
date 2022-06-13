---
layout: single
permlink: /software/debe/
toc: true
sidebar:
    - title: DEBE
      image: /software/debe/overview.jpg
      text: "DEBE builds on frequency-based deduplication that first removes duplicates of frequent data in a space-constrained SGX enclave and then removes all remaining duplicates outside the enclave." 
---

# DEBE: Secure and Lightweight Deduplicated Storage via Shielded Deduplication-Before-Encryption

## Introduction

DEBE is a shielded DbE-based deduplicated storage system that protects deduplication via Intel SGX. DEBE builds on frequency-based deduplication that first removes duplicates of frequent data in a space-constrained SGX enclave and then removes all remaining duplicates outside the enclave.

## Publications

- Zuoru Yang, Jingwei Li, and Patrick P. C. Lee.
	**Secure and Lightweight Deduplicated Storage via Shielded Deduplication-Before-Encryption.**
	Proceedings of USENIX Annual Technical Conference (ATC 2022), July 2022.

## Downloads

Please refer the [Github site](https://github.com/yzr95924/DEBE) for source code and README. 

Change Log:

- Version 1.0.0 (Jun 2022)
	- First release

