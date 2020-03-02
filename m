Content-Type: multipart/mixed; boundary="===============5179323346662437171=="
MIME-Version: 1.0
From: Roberto Sassu <roberto.sassu@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ima] 9165b814d2: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 02 Mar 2020 09:46:23 +0000
Message-ID: <0b454d6825824d3d9e4a99b552cc5f84@huawei.com>
In-Reply-To: <20200302012218.GU6548@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5179323346662437171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: kernel test robot [mailto:rong.a.chen(a)intel.com]
> Sent: Monday, March 2, 2020 2:22 AM
> To: Roberto Sassu <roberto.sassu@huawei.com>
> Cc: zohar(a)linux.ibm.com; James.Bottomley(a)HansenPartnership.com;
> jarkko.sakkinen(a)linux.intel.com; linux-integrity(a)vger.kernel.org; lin=
ux-
> security-module(a)vger.kernel.org; linux-kernel(a)vger.kernel.org; Silviu
> Vlasceanu <Silviu.Vlasceanu@huawei.com>; Roberto Sassu
> <roberto.sassu@huawei.com>; lkp(a)lists.01.org
> Subject: [ima] 9165b814d2:
> BUG:kernel_NULL_pointer_dereference,address
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 9165b814d2bea8cfeb557505bb206396331e8192 ("[PATCH v2 8/8]
> ima: Use ima_hash_algo for collision detection in the measurement list")
> url: https://github.com/0day-ci/linux/commits/Roberto-Sassu/ima-support-
> stronger-algorithms-for-attestation/20200205-233901
> base: https://git.kernel.org/cgit/linux/kernel/git/zohar/linux-integrity.=
git
> next-integrity

Hi

thanks for the report.

Yes, version 2 had a bug:

---
		ima_algo_array[i++].algo =3D HASH_ALGO_SHA1;
	}

	if (ima_hash_algo_idx >=3D nr_allocated_banks) {
		ima_algo_array[i].tfm =3D ima_shash_tfm;
		ima_algo_array[i].algo =3D ima_hash_algo;
	}
---

The code allocated ima_algo_array with size 1 (TPM was not found and
the default algorithm is SHA1).

However, later it initializes ima_algo_array for SHA1 and increments the
i variable. Since the code does not check if the default algorithm is SHA1,
the last part is also executed and causes corruption, because ima_algo_array
has only one element.

I fixed already this bug in version 3 of the patch set.

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Li Jian, Shi Yanli

--===============5179323346662437171==--

