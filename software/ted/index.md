---
layout: single
permalink: /software/ted/
toc: true
sidebar:
- title: TED
  image: /software/ted/overview.jpg
  text: "TED is a tunable encrypted deduplication approach for balancing the trade-off between data confidentiality and storage efficiency. It allows users to configure a storage blowup factor, under which the information leakage quantified by an information-theoretic measure is minimized for any input workload."
---

# TED: Balancing Storage Efficiency and Data Confidentiality with Tunable Encrypted Deduplication

## Introduction

Conventional encrypted deduplication approaches retain the deduplication capability on duplicate
chunks after encryption by always deriving the key for encryption/decryption from the chunk
content, but such a deterministic nature causes information leakage due to frequency analysis. We
present TED, a tunable encrypted deduplication primitive that provides a tunable mechanism for
balancing the trade-off between storage efficiency and data confidentiality. The core idea of
TED is that its key derivation is based on not only the chunk content but also the number of duplicate chunk
copies, such that duplicate chunks are encrypted by distinct keys in a controlled manner. In
particular, TED allows users to configure a storage blowup factor, under which the information
leakage quantified by an information-theoretic measure is minimized for any input workload. We implement an
encrypted deduplication prototype TEDStore to realize TED in networked environments. Evaluation on
real-world file system snapshots shows that TED effectively balances the trade-off between storage
efficiency and data confidentiality, with small performance overhead.

### Publications

* Zuoru Yang, Jingwei Li, Yanjing Ren, and Patrick P. C. Lee.
**Tunable Encrypted Deduplication with Attack-Resilient Key Management.**
ACM Transactions on Storage (TOS), 2022.

* Jingwei Li, Zuoru Yang, Yanjing Ren, Patrick P. C. Lee, and Xiaosong Zhang.
**Balancing Storage Efficiency and Data Confidentiality with Tunable Encrypted Deduplication.**
In Fifteenth European Conference on Computer Systems (EuroSys ’20), April 27–30, 2020.


## Downloads

[![](https://img.shields.io/badge/ted-version 1.1-blue.svg)](https://www.icloud.com.cn/iclouddrive/028sAnhdMPgZGC30XBYOz5l3w#ted-1)
[![](https://img.shields.io/badge/ted-version 1.0-blue.svg)](https://www.icloud.com.cn/iclouddrive/0edZTkfE4DYDfTvBdgLGpJsSg#ted-1)

Change Log:

- Version 1.1 (Jun 2021)
  - Add attack-resilient key management
- Version 1.0 (Feb 2020)
  - First release


## Maintainers

* Yanjing Ren, University of Electronic Science and Technology of China (UESTC), tinoryj@gmail.com
* Zuoru Yang, The Chinese University of Hong Kong (CUHK), zryang@cse.cuhk.edu.hk
