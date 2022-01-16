---
layout: single
permlink: /software/freqanalysis/
toc: true
sidebar:
  - title: "Freqanalysis Toolkit"
    image: "/software/freqanalysis/overview.jpg"
    text: "The toolkit demonstrates the practical implication of frequency analysis against encrypted deduplication, from both attack and defense perspectives. It includes the attack and defense implementations against the FSL dataset, as well as a deduplication storage prototype based on an existing realistic deduplication system of data domain file system (DDFS)."
---


# Freqanalysis Toolkit

This is a mirror (with minor changes) to the [site](http://adslab.cse.cuhk.edu.hk/software/freqanalysis/), where freqanalysis is first released.

## Introduction

Encrypted deduplication seamlessly combines encryption and deduplication to simultaneously achieve both data security and storage efficiency. State-of-the-art encrypted deduplication systems mostly adopt a deterministic encryption approach that encrypts each plaintext chunk with a key derived from the content of the chunk itself, so that identical plaintext chunks are always encrypted into identical ciphertext chunks for deduplication. However, such deterministic encryption inherently reveals the underlying frequency distribution of the original plaintext chunks. This allows an adversary to launch frequency analysis against the resulting ciphertext chunks, and ultimately infer the content of the original plaintext chunks.

We study how frequency analysis practically affects information leakage in encrypted deduplication storage, from both attack and defense perspectives.

- In the attack side, we propose a locality-based attack that exploits chunk locality to increase the coverage of inferred chunks against encrypted deduplication. Also, we  propose the distribution-based attack, which builds on a statistical approach to model the relative frequency distributions of plaintexts and ciphertexts, and improves the inference precision (i.e., have high confidence on the correctness of inferred ciphertext-plaintext pairs) of the locality-based attack.

- In the defense side, we present two schemes, namely MinHash encryption and scrambling, which aim to disturb the frequency rank or break the chunk locality of ciphertext workloads.

The toolkit includes the attack and defense implementations against the [FSL dataset](http://tracer.filesystems.org), as well as a deduplication storage prototype based on an existing realistic deduplication system of data domain file system (DDFS) to study the metadata access overhead of defense schemes.

### Publication

- Jingwei Li, Guoli Wei, Jiacheng LIANG, Yanjing Ren, Patrick P. C. Lee, Xiaosong Zhang. Revisiting Frequency Analysis against Encrypted Deduplication via Statistical Distribution. In Proc. of IEEE INFOCOM, 2022.
- Jingwei Li, Patrick P. C. Lee, Chufeng Tan, Chuan Qin, and Xiaosong Zhang. Information Leakage in Encrypted Deduplication via Frequency Analysis: Attacks and Defenses. ACM Transactions on Storage (TOS), 16(1), pp. 4:1-4:30, 2020.
- Jingwei Li, Chuan Qin, Patrick P. C. Lee, Xiaosong Zhang. Information Leakage in Encrypted Deduplication via Frequency Analysis. In Proc. of IEEE/IFIP DSN, 2017. Special thanks to Chufeng Tan for his help in preparing source code.


## Downloads

README is included in the source package.

[![](https://img.shields.io/badge/freqanalysis-version
    1.3-blue.svg)](https://www.icloud.com.cn/iclouddrive/03f9jvq7yP0X43IzH-v0ihvPA#freqanalysis-1)
[![](https://img.shields.io/badge/freqanalysis-version
    1.2-blue.svg)](https://www.icloud.com.cn/iclouddrive/030Xbk1HIIMvMKlrX-7qrezRw#freqanalysis-1)
[![](https://img.shields.io/badge/freqanalysis-version
    1.1-blue.svg)](https://www.icloud.com.cn/iclouddrive/049lu_l8z1WuPOudzk6ipadew#freqanalysis-1)
[![](https://img.shields.io/badge/freqanalysis-version
    1.0-blue.svg)](https://www.icloud.com.cn/iclouddrive/06cj7NTsLepiBgikaANu3BBIA#freqanalysis-1)

Change Log:

- Version 1.3 (December 2021)
    - Fix a bug of unexpected string truncation in locality-based attack in v1.2.
    - Include distribution-based attack.

- Version 1.2 (March 2019)
    - Include advanced locality-based attack

- Version 1.1 (November 2017)
	- Fix a bug of variable-size segmentation in Version 1.0.
	- Include new defenses: a scrambling scheme, and a combined scheme of MinHash encryption and scrambling.
	- Include a deduplication prototype based on DDFS.

- Version 1.0 (June 2017)
	- First release
