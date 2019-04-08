Content-Type: multipart/mixed; boundary="===============2060773264030529691=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.com>
To: lkp@lists.01.org
Subject: Re: [MD] 4bc034d353: aim7.jobs-per-min -86.0% regression
Date: Mon, 08 Apr 2019 17:45:50 +1000
Message-ID: <875zrpym6p.fsf@notabene.neil.brown.name>
In-Reply-To: <20190408071204.GG11264@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2060773264030529691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08 2019, kernel test robot wrote:

> Greeting,
>
> FYI, we noticed a -86.0% regression of aim7.jobs-per-min due to commit:

That is expected.  The following commit
  2bc13b83e6298486371761de503faeffd15b7534
should restore the performance.

NeilBrown



>
>
> commit: 4bc034d35377196c854236133b07730a777c4aba ("Revert "MD: fix lock c=
ontention for flush bios"")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-5.=
2/block
>
> in testcase: aim7
> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wit=
h 384G memory
> with following parameters:
>
> 	disk: 4BRD_12G
> 	md: RAID0
> 	fs: xfs
> 	test: sync_disk_rw
> 	load: 300
> 	cpufreq_governor: performance
>
> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>
>

--===============2060773264030529691==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWx5cS9EQUFDZ2tRT2V5ZTNWWmkKZ2JuMStCQUFsQWNpdVV5N2xH
L3FxYWIxZ2ZFMU5FQkpaUmpHU3hOSGZ2ZGwxMm4zTEthY05DYlRzeThFZ2ttVQpvZkdqYUdHcWo4
VU5adlJ6SCtUaHlPUjVMd0JqMm5nMGRYR3piQlFZQlpRQWlzelBheEJ3bzQwREVWaFRYMUZFCmFw
RGJGRW4ySVBmS0xTaGo3UzhLKytlaHdUVWVST2RvZGJUZjM1VExKcVdUL0N5aXdZZnhyNm1qTnkx
VnJFeGMKNC9EbC9aVW9XVE5JOXVoODl0a2VmK3krNm5MejkvQzZmR0ZtQXBONGlTOFFYN1psK00z
SDE0Y0wyRXFGcFhZcgpGUHFFZXNhaFNpZ0hhU3U0dXVCRlU1SnZwUFhlbG9GVEJsbkowbTh2Q2FH
ZkNCcGgyY0xxa3NaZXAwN3BCRWNDCmJIRjlwSE9pMHhaVmRvYjdVVHBBM0FVNWJ6R3lPSklqWWdm
VlhCUkM1cGZndG1QZTNGK2QxcHllRi8vRjZhR1IKSmo0QmZYekU1MmZmQzVneXMwNXdEdEg0WWZR
R2grTHVYZVUrcDFBS1Bzb0hkRjBaWmt4cWREakkwOVd0VHVvZgoxOVY2ZkpQM2VzMXRzVkVNV2d0
UjlLcGNkODZFbHV1OTRxZlJtSHJvK2NjOGlsN2Zlc01ZdWoxVHJYTFdKbytwCldGY1dJT1pqWm5k
M25pcWcvSkJ6enh3WjBtcm9wZmpCVDl1aHppbzRBaWNzOG1FNm5NVGRaUTlGcVB2WWxPaloKR0lH
bFVSeVQ3Mmd5YjBIU3puOW1IcTRkeSsyMVN5cXFRemgyZHV0SDBRaVZpNDUycWZ1RnFuV0kzUXVZ
VW5FZApXcVVpNTFsSkVkYXlBZFFPcEhyMVVwcjU5TE4zWnZZWW13ZmR3NzUvKys0QVlsZUlGU2M9
Cj1OeURpCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============2060773264030529691==--

