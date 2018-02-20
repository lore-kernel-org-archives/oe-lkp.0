Content-Type: multipart/mixed; boundary="===============5759073032980537967=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] e22c8d3cf4: BUG:KASAN:use-after-free_in_r
Date: Tue, 20 Feb 2018 11:09:25 +1100
Message-ID: <87371wldxm.fsf@notabene.neil.brown.name>
In-Reply-To: <20180219163912.25h6tn5l2gwcx5nv@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============5759073032980537967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20 2018, kernel test robot wrote:

> FYI, we noticed the following commit (built with gcc-7):
>
> commit: e22c8d3cf4cd6307228c9946a670fa548c359611 ("SUNRPC: add side chann=
el to use non-generic cred for rpc call.")
> url: https://github.com/0day-ci/linux/commits/NeilBrown/Remove-generic-rp=
c-credentials-and-associated-changed-V3/20180219-190836
> base: git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-------------------------------+------------+------------+
> |                               | a79c51c9c3 | e22c8d3cf4 |
> +-------------------------------+------------+------------+
> | boot_successes                | 6          | 4          |
> | boot_failures                 | 0          | 4          |
> | BUG:KASAN:use-after-free_in_r | 0          | 4          |
> +-------------------------------+------------+------------+
>
>
>
> [   66.551598] BUG: KASAN: use-after-free in rpc_free_task+0x5e/0x86
> [   66.552963] Read of size 8 at addr ffff8800093e93a8 by task kworker/0:=
3/201

Thanks.
The patch had

        rpc_release_calldata(task->tk_ops, task->tk_calldata);
+       put_rpccred(task->tk_op_cred);

It should have had

+       put_rpccred(task->tk_op_cred);
        rpc_release_calldata(task->tk_ops, task->tk_calldata);

as the rpc_release_calldata might free the task.

I'll send a revised patch.

Thanks,
NeilBrown

--===============5759073032980537967==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWxxTFp6VUFDZ2tRT2V5ZTNWWmkKZ2JucXpnLzdCeitmZFEwNzNX
SGhvRjRKbDRlUmhjdThNL3B6ai9VREJwZG5adHFvRUE4MlY3QXhMSTFqb09CYQpDTnZnRmZndjlJ
VW1iaUdqdE9aSmNFQlczbnBEL1lEK1BMaUxjMUdnZGlTaHg2Nk55WkJ2d1Z2c0VEUThMUFEzCnFr
REZ3cjlmanZpTWUrNVpnakVMZUQ3ZDJ5MVdXSEJsdGZ6amp0MFBNMFhtczNvTTZDQU4waDM0Z1Z1
TUdNdWoKZTBpdExBZ09BbG83THBuYk5ZOFpwdXFWSXJaVnJYY2ZRODVEMVowM0Jwa3A4UUtVd0tT
OGxzUFZNZ3VpcFJMZgoyY0lidUlYK0VMVFgwUjFURjVmSHVGOXJoUWpPRHlwUUJ3N3pHN0Q5eXU5
SEZqVnNRZ1ZFelc0dVB2bkFIWDh4CmxHZXBld1RIK2d3dnQ5NDJrSWxKRnh5Y21ZT0ozc2VlWHVM
KzZ3ZzFBM1BKZVk4aFR0RUQ1NUMrcTlnTzVwYlMKTjRSWVlub0ZQRExnUzdYQS93RWtBUGN0cGNT
eXhqT3kzSTJvbFZIVmtNSnQvNTAwSi8waFBrTW5jZnYwWXRTdgpoOWZvTm0rUXFvM2J5ZXlKNExk
NUMxb2ZKMW5DWDNSdE5RQnVJcnBZV2JsaXY3aGM2SGVUd1lFMDdZT1h1RVo3CjNhcGh6aGRXbFlJ
WXdYUXhmSU1SdzZZRFpndHBRRmlVbk94ZjRyR052UG5UVzJmT0pGOXZtclpieURMbXphaWsKSnNR
emRPb0lPYlRwNG4vNC91RERJQis1L0tTV1NhYVcvOStuV0VQK0M2RU5abE4yRExobVM5L0hoT21y
UTNwQQo3aDNIOWNiWWRDQ2U3NTNPRHphcTV5OXNrVStVZSs2NzhMUjdEeWpkQndBNUMrK2JPZms9
Cj1BcUR5Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============5759073032980537967==--

