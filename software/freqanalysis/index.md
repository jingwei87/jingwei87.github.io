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

## Preparation

The toolkit is running under Linux (e.g., Ubuntu 14.04/18.04) with a C++ compiler (e.g., g++). To run the programs, you need to install/compile the following dependencies.

- G++-8: run the command ` sudo apt-get install g++-8` for installation.
- G++ Version: run the command ` export CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8` to specify the compiler's version.

- Libssl API: run the command `sudo apt-get install libssl-dev` for installation.
- Snappy compression library: run the command `sudo apt-get install libsnappy-dev` for installation.
- [Google Leveldb](https://github.com/google/leveldb): a version of 1.20 is provided in `util/`.
- [fs-hasher](http://tracer.filesystems.org/fs-hasher-0.9.4.tar.gz): a version of 0.9.4 is provided in `util/`.

All components of our toolkit depend on `fs-hasher` and `leveldb`. Before configuring each component (e.g., the attacks, the defenses, and the prototype), need to copy `util/fs-hasher/` and `util/leveldb/` into the corresponding directory (e.g., `locality-attack/basic/`, `locality-attack/locality/`, `distribution-attack/lib/`, `defense/minhash/`, `defense/scrambling/`, `defense/combined/`, and `prototype/`) and compile them, respectively.

For some machines, you need to change the maximum number of open files allowed:

```
$ sudo su
$ echo "* hard nofile 65535" >> /etc/security/limits.conf
$ echo "* soft nofile 65535" >> /etc/security/limits.conf
```

## Attacks

We provide the basic, the locality-based and the distribution-based attacks against encrypted deduplication.

### Basic Attack

The basic attack builds on classical frequency analysis. Follow the following steps to simulate the basic attack.

**Step 1, configure basic attack:** modify variables in `locality-attack/basic/basic_script.sh` to adapt expected settings:

- `fsl` specifies the path of the FSL trace.
- `users` specifies which users are collectively considered in backups.
- `date_of_aux` specifies the backup of which date is considered as auxiliary information.
- `date_of_latest` specifies the latest backup of which date is the target for inference.

**Step 2, run basic attack:** type the following commands to compile and run the basic attack.

```
$ cd locality-attack/basic/ && make
$ ./basic_script.sh
```

### Locality-based Attack

The locality-based attack exploits chunk locality to improve attack severity. To simulate the locality-based attack, follow the steps below.

**Step 1, configure locality-based attack:** In addition to the common variables (e.g., `fsl`, `users`, `date_of_aux` and `date_of_latest`), the locality-based attack builds on four specific parameters that are defined in `locality-attack/locality/locality_script.sh`:

- `u` specifies the number of most frequent chunk pairs to be returned by frequency analysis in initializing the inferred set.
- `v` specifies the number of most frequent chunk pairs to be returned by frequency analysis in each iteration.
- `w` specifies the maximum number of ciphertext-plaintext chunk pairs that can be held by the inferred set.
- `leakage_rate` specifies the ratio of the number of ciphertext-plaintext chunk pairs known by the adversary to the total number of ciphertext chunks in the latest backup.

**Step 2, run locality-based attack:** type the following commands to compile and run the locality-based attack.

```
$ cd locality-attack/locality/ && make
$ ./locality_script.sh
```

### Advanced Locality-based Attack

The advanced locality-based attack specifically targets variable-size chunks generated from content-defined chunking. It leverages the size information to increase the severity of locality-based attack.

Like the locality-based attack, the advanced locality-based attack is configured by the parameters `u`, `v`, `w`, and `leakage_rate`, which are defined in `locality-attack/advanced/advanced_script.sh`. To compile and run the attack, type the following commands:

```
$ cd locality-attack/advanced/ && make
$ ./advanced_script.sh
```

### Distribution-based Attack

The distribution-based attack extends locality to model the relative frequency distribution of chunks via a statistical approach, in order to improve the precision of the locality-based attack.

**Step 1, configure distribution-based attack:** In addition to parameter (`u`) of the locality-based attack, the distribution-based attack builds on another two parameters in `distribution-attack/distribution_script.sh`:

- `r` specifies the range of frequency ranks to be examined for each ciphertext.
- `t` specifies the euclidean distance threshold.


**Step 2, run distribution-based attack:** Type the following commands to compile and run the distribution-based attack.

```
$ cd distribution-attack/
$ mkdir build
$ cd build/ && cmake .. && make
$ cd ..
$ ./dataset.sh            # the script is used to untar FSL snapshots and simulate encryption on plaintext chunks
$ ./distribution_script.sh
```

## Defenses

We provide the MinHash encryption, the scrambling, and the combination of both to defend against frequency analysis.


### MinHash Encryption

MinHash encryption derives an encryption key based on the minimum fingerprint over a set (called segment) of adjacent chunks, such that some identical plaintext chunks can be encrypted into multiple distinct ciphertext chunks thereby disturbing frequency rank. To simulate the MinHash encryption, follow the steps below.

**Step 1, configure MinHash encryption:** the MinHash encryption builds on two parameters that are defined in `defense/minhash/k_minhash.cc`:

- Segment size: the MinHash implementation uses variable-size segmentation and identifies segment boundary based on chunk fingerprints. By default, we set the average segment size, maximum segment size and minimum segment size at 1MB, 2MB and 512KB, respectively. It is feasible to change segment sizes by modifying macro variables `SEG_SIZE`, `SEG_MIN` and `SEG_MAX`; note that when changing  `SEG_SIZE`, it is needed to adjust the code in line 112 of `defense/minhash/k_minhash.cc` to adapt the global divisor, for example if the average segment size is 512KB and 2MB, the line of code should be changed as follows.
```
if (sq_size + size > SEG_MAX || (sq_size >= SEG_MIN && (hash[5] << 3) >> 3 == 0x1f))	// correspond to an average segment size of 512KB
if (sq_size + size > SEG_MAX || (sq_size >= SEG_MIN && (hash[5] << 1) >> 1 == 0x7f))	// correspond to an average segment size of 2MB
```

- K: our implementation supports k-MinHash that derives an encryption key from a random k-minimum fingerprint of a segment. By default, we use MinHash and set `K_MINHASH` by 1.


**Step 2, configure locality-based attack:** it is identical to the Step 1 of the guideline of locality-based attack, except the attack parameters (e.g., `u`, `v` and `w`) locate in `defense/minhash/minhash.sh`.

**Step 3, run MinHash encryption to defend against locality-based attack:** type the following commands to compile and run.

```
$ cd defense/minhash/ && make
$ ./minhash.sh
```

### Scrambling

Scrambling disturbs the processing sequence of chunks, so as to prevent an adversary from correctly identifying the neighbors of each chunk in the locality-based attack. To simulate the scrambling scheme, follow the steps below.

**Step 1, configure scrambling scheme:** Like MinHash encryption, scrambling works on a segment basis, and builds on three parameters of `SEG_SIZE`, `SEG_MIN` and `SEG_MAX` to define variable-size segmentation. You can follow the Step 1 of the guideline of MinHash encryption to configure these parameters that are defined in `defense/scrambling/scrambling.cc`.

**Step 2, configure locality-based attack:** it is identical to the Step 1 of the guideline of locality-based attack, except the attack parameters (e.g., `u`, `v` and `w`) locate in `defense/scrambling/scrambling.sh`.

**Step 3, run scrambling to defend against locality-based attack:** type the following commands to compile and run.

```
$ cd defense/scrambling/ && make
$ ./scrambling.sh
```

### Combined

We also introduce a combined scheme that first scrambles the orders of chunks in a segment basis, and then encrypts each chunk via MinHash encryption. The guideline of the attack is identical with that of MinHash encryption.

## Deduplication Prototype

We design and implement a deduplication-based storage prototype based on DDFS. The key design is to store unique chunks in logical order and further exploit chunk locality to accelerate deduplication. Instead of storing actual data, our prototype works on metadata level. You can follow the following steps to evaluate the metadata access overhead of either message-locked encryption (MLE) or the combined scheme based on our prototype.


**Step 1, configure prototype:** the prototype builds on two types of parameters, all of which are defined in `prototype/ddfs.cc`:

- The cache-related parameter is the size `LRU_SIZE` of fingerprint cache. Note that we describe `LRU_SIZE` by the maximum number of fingerprints that the cache can hold.

- The Bloom filter-related parameters include the maximum number `BLOOM_lenth` of entries in the Bloom filter array, and the false positive rate `ERROR` of Bloom filter.

**Step 2, configure encryption scheme:** we provide the deduplication simulation from the ciphertext chunks by either the MLE or the combined scheme. You can configure the parameters of the combined scheme by modifying `SEG_MIN`, `SEG_MAX`, `SEG_SIZE`, and `K_MINHASH` in `prototype/combined.cc` (see the Step 1 of the guideline of MinHash encryption).


**Step 3, run storage simulation:** type the following commands to compile and run the simulation.

```
$ cd prototype/ && make
$ ./combined.sh  // run the combined scheme
$ ./mle.sh  // run the MLE scheme
```


## Outputs

### Locality-based Attack/Defense

The output format of  locality-based attack/defense is shown as follows.

```c
==========================Attack/Defense==========================
Auxiliary information: YYYY-MM-DD; 	Target backup: YYYY-MM-DD
[Parameters: (u, v, w) = ...]
Total number of unique ciphertext chunks: X
[Leakage rate: ...]
Correct inferences: Y
Inference rate: ...

Successfully inferred following chunks:
......
```

`X` is the number of unique ciphertext chunks in the encryption of the target backup, while `Y` is the number of (unique) chunks that can be successfully inferred by the attacks. The inference rate is computed by `Y/X`, that is slightly affected by the sorting algorithm in frequency analysis. The reason is different sorting algorithms may break tied chunks (that have the same frequency counts) in different ways and lead to (slightly) different results. The `parameters` and `leakage rate` are only available in the simulation of locality-based attack and its defense. We output the fingerprints of inferred plaintext chunks in both attack and  defense simulation.

### Distribution-based Attack

The output format of distribution-based attack is shown as follows. Since the information leakage does not help improve the precision of the inference attack, we always fix the leakage rate at zero (i.e., ciphertext-only attack).

```c
=========Distribution-based Attack=========
Parameters: u: , r: , t:, leakage_rate: 0
Source backup: YY-MM
Target backup: YY-MM
Total number of unique ciphertext chunks: X
[Zero Leakage rate: ...]
Successfully inferred following chunks:
......

Involve:Y
Correct:Z
Inferred rate: ......
Precision: ......
```

- `X` is the number of unique ciphertext chunks in the encryption of the target backup.
- `Y` is the number of (unique) chunks that are inferred by the attacks.
- `Z` is the number of (unique) chunks that can be successfully inferred by the attacks.

The inference rate is computed by `Z/X` and the precision is computed by `Z/Y`. Note that the inference results are slightly affected by the sorting algorithm in frequency analysis. The reason is that different sorting algorithms may break tied chunks (that have the same frequency counts) in different ways and lead to (slightly) different results. Also, different g++ versions may lead to slightly different results.

### Deduplication Simulation

We output the metadata access overhead in storage simulation in the following format:

```
fslhomes-userX-YYYY-MM-DD
Index access: A
Update access: B
Loading access: C
```

The information elaborates the metadata access overhead of storing user `X`'s backup on the date of `YYYY-MM-DD`. The metadata access overhead includes index access, update access and loading access, all of which are evaluated in the unit of times.


## Downloads
[![](https://img.shields.io/badge/freqanalysis-version
    1.3-blue.svg)](https://www.icloud.com.cn/iclouddrive/060zzAALwyU2ItbwN_RTbv0VA#freqanalysis-1)
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
