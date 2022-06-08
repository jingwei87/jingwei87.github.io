---
layout: single
permlink: /software/metadedup/
toc: true
sidebar:
  - title: "Metadedup"
    image: "/software/metadedup/overview.jpg"
    text: "
     Metadedup is an encrypted deduplication storage system with space-efficient metadata management. It records metadata information in another level called metadata chunks, which are highly redundant in real-world workloads and hence can be effectively deduplicated for storage efficiency. It also protects metadata chunks under the same encrypted deduplication framework, thereby providing confidentiality guarantees for metadata as well.
    "
---

# Metadedup: Deduplicating Metadata in Encrypted Deduplication via Indirection

## Introduction

Encrypted deduplication combines encryption and deduplication in a seamless way to provide confidentiality guarantees for the physical data in deduplication storage, yet it incurs substantial metadata storage overhead due to the additional storage of keys. We present a new encrypted deduplication storage system called Metadedup, which suppresses metadata storage by also applying deduplication to metadata. Its idea builds on indirection, which adds another level of metadata chunks that record metadata information. We find that metadata chunks are highly redundant in real-world workloads and hence can be effectively deduplicated. In addition, metadata chunks can be protected under the same encrypted deduplication framework, thereby providing confidentiality guarantees for metadata as well.

### Publications

*  Jingwei Li, Patrick P. C. Lee, Yanjing Ren, and Xiaosong Zhang. **Metadedup: Deduplicating Metadata in Encrypted Deduplication via Indirection**. Proceedings of the 35th International Conference on Massive Storage Systems and Technology (MSST 2019), Santa Clara, U.S.A, May 2019.

* Jingwei Li, Suyu Huang, Yanjing Ren, Zuoru Yang, Patrick P. C. Lee, Xiaosong Zhang, and Yao Hao. **Enabling Secure and Space-Efficient Metadata Management in Encrypted Deduplication**. IEEE Transactions on Computers (TC), vol. 71(4), pp. 959-970, April 2022.

## Limitation

We assume that the upload and download channels are secure (e.g., encrypted and authenticated), and do not implement  SSL/TLS mechanisms upon our protection (e.g., CAONT-RS) of data.

## Downloads

[![](https://img.shields.io/badge/metadedup-version
    1.1-blue.svg)](https://www.icloud.com.cn/iclouddrive/0ea6_shdR96XdlyAFce68WdAQ#metadedup-1)
[![](https://img.shields.io/badge/metadedup-version
    1.0-blue.svg)](https://www.icloud.com.cn/iclouddrive/0346EuJIOtBh0N_Ec6rAvCVfA#metadedup-1)

Change Log:

- Version 1.1 (June 2020)
  - Add the implementation of a distributed key management approach
- Version 1.0 (April 2019)
  - First release
