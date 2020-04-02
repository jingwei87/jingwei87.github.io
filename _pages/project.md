---
layout: splash
title: Project
permalink: /project/index.html
---

## Encrypted Deduplication (Current Focus) 

Encrypted deduplication seamlessly combines encryption and deduplication to simultaneously achieve
both data security and storage efficiency. It builds on the idea that encrypts each message 
with a key derived from the content of the message itself, so that identical messages are
always encrypted into identical ciphertexts for deduplication.

In this project, we address the practical issues of the encrypted deduplication approach, in order
to improve its usability in real systems.   

- [TED](/software/ted/index.html) proposes a tunable encrypted deduplication approach to balance data confidentiality and storage efficiency.
- [Metadedup](/software/metadedup/index.html) presents encrypted deduplication storage with space-efficient metadata management. 
- [Freqanalysis toolkit](/software/freqanalysis/index.html) reveals the underlying security risk against encrypted deduplication. 
- [REED](/software/reed/index.html) augments encrypted deduplication storage systems with dynamic access control. 
- [CDStore](/software/cdstore/index.html) provides a unified multi-cloud storage solution with reliability, security and cost efficiency. 
- [Dekey](http://doi.org/10.1109/TPDS.2013.284) provides a cost-efficient way for managing large-scale convergent keys. 

---

## Outsourced Attribute-based Cryptographic Primitives

In this project, we introduce outsourced computation into attribute-based primitives and enable to securely delegate the heavy computations from resource-constrained clients to third-party servers:

- We propose various outsourced attribute-based encryption (ABE) primitives that can delegate the computation of [key generation](/publication/jcs15.pdf) and [encryption](/publication/icics12.pdf) to third party. 
- We augment outsourced decryption with [checkability](/publication/tpds14check.pdf) that can verify the correctness of results. 
- We apply outsourcing computation to attribute-based signature and identity-based encryption, and delegate the [sign](http://doi.org/10.1109/TPDS.2013.2295809) and [revocation](/publication/tc15revoke.pdf) operation to third party, respectively. 

