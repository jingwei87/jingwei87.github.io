---
layout: splash
title: Software
permalink: /software/
---
## [SGXDedup: Accelerating Encrypted Deduplication via SGX](sgxdedup/index.html)
SGXDedup is an SGX-based encrypted deduplication system with high performance.

## [TED: Balancing Storage Efficiency and Data Confidentiality with Tunable Encrypted Deduplication](ted/index.html)
TED is a tunable encrypted deduplication approach for balancing the trade-off between data confidentiality and storage efficiency. It allows users to configure a storage blowup factor, under which the information leakage quantified by an information-theoretic measure is minimized for any input workload.

## [Metadedup: Deduplicating Metadata in Encrypted Deduplication via Indirection](metadedup/index.html) 
Metadedup is a new encrypted deduplication storage system, which suppresses metadata storage by also applying deduplication to metadata. Its idea builds on indirection, which adds another level of metadata chunks that record metadata information. We find that metadata chunks are highly redundant in real-world workloads and hence can be effectively deduplicated. In addition, metadata chunks can be protected under the same encrypted deduplication framework, thereby providing confidentiality guarantees for metadata as well.



## [Freqanalysis: Information Leakage in Encrypted Deduplication via Frequency Analysis](freqanalysis/index.html) 
The toolkit demonstrates the practical implication of frequency analysis against encrypted deduplication, from both attack and defense perspectives. It includes the attack and defense implementations against the FSL dataset, as well as a deduplication storage prototype based on an existing realistic deduplication system of data domain file system (DDFS).

---

## [REED: Rekying-aware Encrypted Deduplication Storage](reed/index.html)
REED is an encrypted deduplication storage system with rekeying enabled. It builds on a deterministic version of all-or-nothing transform (AONT) for secure and lightweight rekeying, while preserving the deduplication capability. It also exploits similarity to mitigate key generation overhead. 

---

## [CDStore: Toward Reliable, Secure, and Cost-Efficient Cloud Storage via Convergent Dispersal](cdstore/index.html)
CDStore builds on an augmented secret sharing scheme called convergent dispersal, which supports deduplication by using deterministic content-derived hashes as inputs to secret sharing. It combines convergent dispersal with two-stage deduplication to achieve both bandwidth and storage savings and be robust against side-channel attacks.

