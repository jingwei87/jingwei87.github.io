---
layout: single
permalink: /software/reed/
toc: true
sidebar:
- title: REED
  image: /software/reed/overview.jpg
  text: "REED is an encrypted deduplication storage system with rekeying enabled. It builds on a deterministic version of all-or-nothing transform (AONT) for secure and lightweight rekeying, while preserving the deduplication capability. It also exploits similarity to mitigate key generation overhead."
---

# REED

This is a mirror (with minor changes) to the [site](http://adslab.cse.cuhk.edu.hk/software/reed/), where REED is first released.

## Introduction

REED is an encrypted deduplication storage system with rekeying enabled. Specifically, it can replace an existing key with a new key so as to protect against key compromise and enable dynamic access control. REED builds on a deterministic version of all-or-nothing transform (AONT) for secure and lightweight rekeying, while preserving the deduplication capability. It also exploits similarity to mitigate key generation overhead. We implement a REED prototype with various performance optimization techniques.

### Publications

- Jingwei Li, Chuan Qin, Patrick P. C. Lee, and Jin Li.
**Rekeying for Encrypted Deduplication Storage.**
Proceedings of the 46th Annual IEEE/IFIP International Conference on Dependable Systems and Networks (DSN 2016) (Regular paper), Toulouse, France, June 2016.

- Chuan Qin, Jingwei Li, and Patrick P. C. Lee.
**The Design and Implementation of a Rekeying-aware Encrypted Deduplication Storage System.**
ACM Transactions on Storage (TOS), 13(1), 9:1-9:30, March 2017.

## Limitations & Known Bugs

- In an ABE cryptosystem, a trusted party (e.g., authority) maintains an ABE master secret to generate ABE private keys. In REED, we do not implement the authority, and assume all REED clients own the system-wide master secret (that has already been generated). Each client can use the secret to generate its private keys (e.g., via the keygen interface).

- We test REED with a special case of CP-ABE: (i) assign a single attribute (e.g., id) with private key and (ii) express policy in access tree with an OR gate connecting all authorized identifiers. We cannot guarantee REED works well with generic tree-based access control (that is supported by the CP-ABE toolkit).

- We do not expose interface for lazy revocation (but we implement key regression for policy update). Currently, REED only supports active revocation that immediately revokes the access privileges of old keys.

- In our test, REED works well with most of files. However, for a few files, we face chunking crashes in upload or integrity check failures (missing the data chunks in the last container) in download. The bugs possibly depend on the content of test files.


## Downloads

[![](https://img.shields.io/badge/reed-version
    1.1-blue.svg)](https://www.icloud.com.cn/iclouddrive/0b1DDnSUUAb8__gZHbhAQ1SAw#reed-1)
[![](https://img.shields.io/badge/reed-version
    1.0-blue.svg)](https://www.icloud.com.cn/iclouddrive/048KBe7OJljNZWJ-NxMiCGU5g#reed-1)

Change Log:

- Version 1.1 (November 2017)
	- Fix a bug of upload and download in Version 1.0.
	- Fix a bug of key management in Version 1.0.
	- Change upload and download interfaces in Version 1.0.
	- Include keygen and rekeying interfaces.
	- Create client.conf for easy configuration.
	- Include protection of stubs.
	- Include SSL communications.
	- Include key regression for policy update.
	- Include similarity-based key generation.

- Version 1.0 (April 2016)
	- First release

### Maintainers

- Origin maintainer:
	- Chuan Qin, CUHK, chintran27@gmail.com

- Current maintainers:
    - Yanjing Ren, UESTC, tinoryj@gmail.com
    - Jingang Ma, UESTC, demon64523@gmail.com
