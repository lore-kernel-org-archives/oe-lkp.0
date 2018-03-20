Content-Type: multipart/mixed; boundary="===============7567186945413937954=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.com>
To: lkp@lists.01.org
Subject: Re: [staging] 184ecc5ceb: BUG:unable_to_handle_kernel
Date: Tue, 20 Mar 2018 13:34:09 +1100
Message-ID: <87h8pba31a.fsf@notabene.neil.brown.name>
In-Reply-To: <20180319091931.gt6ijdw7ahkbtvrq@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============7567186945413937954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 19 2018, kernel test robot wrote:

> FYI, we noticed the following commit (built with gcc-6):
>
> commit: 184ecc5ceb379b43b29fc373f497fca88c73ad38 ("staging: lustre: allow=
 monolithic builds")
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/staging.git staging-t=
esting
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------+------------+------------+
> |                                          | 26f7a294e5 | 184ecc5ceb |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 14         | 4          |
> | boot_failures                            | 0          | 12         |
> | BUG:unable_to_handle_kernel              | 0          | 12         |
> | Oops:#[##]                               | 0          | 12         |
> | EIP:cfs_cpt_spread_node                  | 0          | 12         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 12         |
> +------------------------------------------+------------+------------+
>
>
>
> [  123.548190] BUG: unable to handle kernel NULL pointer dereference at 0=
0000008
> [  123.551023] IP: cfs_cpt_spread_node+0x31/0x100

Thanks.
This happens when both USERIO and LNET are built into the kernel
drivers/staging/lustre/TODO says
  LNET_MINOR conflicts with USERIO_MINOR

I'll add a Kconfig rule preventing them from being built together until
this is resolved properly.
I'll also lok into making the module init routine more robust.

Thanks,

NeilBrown

--===============7567186945413937954==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWxxd2N5RUFDZ2tRT2V5ZTNWWmkKZ2JreVVRLy9YYnVieWZQMTgv
VnBpRXpaU2hRNERnTFdwb0VnbThPWkxyd2dnY2s5ZHMrdkdZd2Ryd0gzNU10eQpobDExZWMrdWtR
VCtrNWIzVktzLytjaVMxSzJxc2ZEUlVwemJjVHBHTEVRRnZ0dVZxb0prUXozSVBDUXV6MnZHCng0
dkxXVjdmQnVBZUpTa2czQUlCYS9WU1Vta0JwL1ExcWRIRXpOOENqaDRzQi9NcTc3eEZodzY5eWlv
QUNoMUMKeDBJdmV1cnh1ck5sVzVJaUpiQzNQVzR3M1M5QlQrZ0ljWUt3cDFHYisrSjJDZEdvczVw
NitaTFpobUsxTHpFcAptMEtlQS9mbnhXQ2o5TW84WjhOMk8zM0xFOGFCMHZNdm5XL2FBZmNmaGdp
TFZOTUdrNURobUtneHNmRXU3azh2CjJURmdWVEY2N2VtYUZGU0ZTUUExNTJzcldUM3UvQzFBci9Z
V3lBZzhYdkVON3hQNFBUSGlUQmozT2Q4Q3p0Y3QKNm1SUVVTS1ZFektOaS9VczhlcHNZdmM3Vk5C
SVQ1bUwzNnoxSERqd2t5UWprVUtTR3hOUVU3RUJ6S0V0cDhhUwo1UFJzcDBSdVl1RkZzSXNORWRx
RWprRWtGY1Z6NTcwQzFQaHlwWDhRbzRtbEc2YXpWT2I3VGxRL1prNmlsQ1lHCmlaYmJ2SnlTQnZy
VGJXUVpkYk10cXBlZUowbnVrc043Uzg3ZVhMdk9NUEZ6dG9TWGg3M0hWdU9iVTVuNVRWT3UKQkhG
Z2dmZGJJMkh6cGE2ZDhINWRZWGJUWTdpQmo4MG5jQ01sU2EyMTJLc3lGVHBWaS9zTWJVdFp3Smk1
dEpXTQpxUURSME9UT0RRdTVmL3owNlYwdDBVWnZvU2Q2SkhPSEZvU0o4OTQ5VFlKWU5IOXNJb0k9
Cj1Vbm5WCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============7567186945413937954==--

