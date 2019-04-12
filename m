Content-Type: multipart/mixed; boundary="===============0072014907264156558=="
MIME-Version: 1.0
From: Mina Almasry <almasrymina@google.com>
To: lkp@lists.01.org
Subject: Re: [fs] 853fbf8946: BUG:unable_to_handle_kernel
Date: Fri, 12 Apr 2019 13:37:53 -0700
Message-ID: <CAHS8izMbjSx7D92+HGvH5gwQZ8mcr+-CiYWSyk00E3qwD6A2Dw@mail.gmail.com>
In-Reply-To: <20190412141927.GA24200@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0072014907264156558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry about that. I'm able to repro the bug with this config and I'll send
v2 with a fix.

On Fri, Apr 12, 2019 at 7:19 AM kernel test robot <rong.a.chen@intel.com>
wrote:

> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 853fbf894629ed7df6b3d494bdf0dca547325188 ("[PATCH] fs: Fix
> ovl_i_mutex_dir_key/p->lock/cred cred_guard_mutex deadlock")
> url:
> https://github.com/0day-ci/linux/commits/Mina-Almasry/fs-Fix-ovl_i_mutex_=
dir_key-p-lock-cred-cred_guard_mutex-deadlock/20190412-080519
>
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m
> 2G
>
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
>
>
>
> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 582549e3fb |
> 853fbf8946 |
>
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 39         | 0
>   |
> | boot_failures                                   | 24         | 5
>   |
> | BUG:kernel_reboot-without-warning_in_test_stage | 24         |
>   |
> | BUG:unable_to_handle_kernel                     | 0          | 5
>   |
> | Oops:#[##]                                      | 0          | 5
>   |
> | RIP:kfree                                       | 0          | 5
>   |
> | Kernel_panic-not_syncing:Fatal_exception        | 0          | 5
>   |
>
> +-------------------------------------------------+------------+---------=
---+
>
>
>
> [    0.775676] BUG: unable to handle kernel paging request at
> ffffebe9e000cac8
> [    0.775676] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.775676] #PF error: [normal kernel read fault]
> [    0.775676] PGD 0 P4D 0
> [    0.775676] Oops: 0000 [#1] SMP PTI
> [    0.775676] CPU: 1 PID: 21 Comm: kworker/u4:0 Not tainted
> 5.1.0-rc4-00059-g853fbf8 #2
> [    0.775676] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.10.2-1 04/01/2014
> [    0.775676] RIP: 0010:kfree+0xa1/0x153
> [    0.779952] futex hash table entries: 512 (order: 3, 32768 bytes)
> [    0.780581] xor: automatically using best checksumming function   avx
>
> [    0.779965] Code: 15 9c 1a 16 01 48 01 d8 72 0e 49 c7 c2 00 00 00 80 4c
> 2b 15 01 93 0b 01 49 01 c2 49 c1 ea 0c 49 c1 e2 06 4c 03 15 df 92 0b 01
> <49> 8b 42 08 a8 01 74 04 4c 8d 50 ff 49 8b 52 08 4c 89 d0 f6 c2 01
> [    0.779965] RSP: 0000:ffffc900003cbe60 EFLAGS: 00010286
> [    0.779965] RAX: 000002f88032b644 RBX: 000002f80032b644 RCX:
> 0000000000000000
> [    0.779965] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> 000002f80032b644
> [    0.779965] RBP: ffffc900003cbf08 R08: 0000000080000000 R09:
> ffffc900003cba68
> [    0.779965] R10: ffffebe9e000cac0 R11: 8080808080808080 R12:
> ffffffff812dcc00
> [    0.779965] R13: 00000000fffffffe R14: 00000000ffffff9c R15:
> 0000000000000000
> [    0.779965] FS:  0000000000000000(0000) GS:ffff88806e700000(0000)
> knlGS:0000000000000000
> [    0.782372] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.782372] CR2: ffffebe9e000cac8 CR3: 000000000240e000 CR4:
> 00000000000406e0
> [    0.782372] Call Trace:
> [    0.782372]  free_bprm+0x73/0x7c
> [    0.782372]  __do_execve_file+0x720/0x7a6
> [    0.782372]  do_execve+0x21/0x24
> [    0.782372]  call_usermodehelper_exec_async+0x141/0x16c
> [    0.782372]  ? umh_complete+0x1a/0x1a
> [    0.782372]  ret_from_fork+0x3a/0x50
> [    0.782372] Modules linked in:
> [    0.782372] CR2: ffffebe9e000cac8
> [    0.782372] ---[ end trace 803d9c656c15319d ]---
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.1.0-rc4-00059-g853fbf8 .config
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
>         make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in
> this email
>
>
>
> Thanks,
> Rong Chen
>
>

--===============0072014907264156558==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+U29ycnkgYWJvdXQgdGhhdC4gSSYjMzk7bSBhYmxlIHRvIHJlcHJvIHRo
ZSBidWcgd2l0aCB0aGlzIGNvbmZpZyBhbmQgSSYjMzk7bGwgc2VuZCB2MiB3aXRoIGEgZml4Ljwv
ZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9Imdt
YWlsX2F0dHIiPk9uIEZyaSwgQXByIDEyLCAyMDE5IGF0IDc6MTkgQU0ga2VybmVsIHRlc3Qgcm9i
b3QgJmx0OzxhIGhyZWY9Im1haWx0bzpyb25nLmEuY2hlbkBpbnRlbC5jb20iPnJvbmcuYS5jaGVu
QGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21h
aWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4
IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+RllJLCB3ZSBub3RpY2Vk
IHRoZSBmb2xsb3dpbmcgY29tbWl0IChidWlsdCB3aXRoIGdjYy03KTo8YnI+Cjxicj4KY29tbWl0
OiA4NTNmYmY4OTQ2MjllZDdkZjZiM2Q0OTRiZGYwZGNhNTQ3MzI1MTg4ICgmcXVvdDtbUEFUQ0hd
IGZzOiBGaXggb3ZsX2lfbXV0ZXhfZGlyX2tleS9wLSZndDtsb2NrL2NyZWQgY3JlZF9ndWFyZF9t
dXRleCBkZWFkbG9jayZxdW90Oyk8YnI+CnVybDogPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
LzBkYXktY2kvbGludXgvY29tbWl0cy9NaW5hLUFsbWFzcnkvZnMtRml4LW92bF9pX211dGV4X2Rp
cl9rZXktcC1sb2NrLWNyZWQtY3JlZF9ndWFyZF9tdXRleC1kZWFkbG9jay8yMDE5MDQxMi0wODA1
MTkiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS8w
ZGF5LWNpL2xpbnV4L2NvbW1pdHMvTWluYS1BbG1hc3J5L2ZzLUZpeC1vdmxfaV9tdXRleF9kaXJf
a2V5LXAtbG9jay1jcmVkLWNyZWRfZ3VhcmRfbXV0ZXgtZGVhZGxvY2svMjAxOTA0MTItMDgwNTE5
PC9hPjxicj4KPGJyPgo8YnI+CmluIHRlc3RjYXNlOiBib290PGJyPgo8YnI+Cm9uIHRlc3QgbWFj
aGluZTogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUgU2FuZHlCcmlkZ2UgLXNt
cCAyIC1tIDJHPGJyPgo8YnI+CmNhdXNlZCBiZWxvdyBjaGFuZ2VzIChwbGVhc2UgcmVmZXIgdG8g
YXR0YWNoZWQgZG1lc2cva21zZyBmb3IgZW50aXJlIGxvZy9iYWNrdHJhY2UpOjxicj4KPGJyPgo8
YnI+CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rPGJyPgp8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDU4MjU0OWUz
ZmIgfCA4NTNmYmY4OTQ2IHw8YnI+CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rPGJyPgp8IGJvb3Rfc3Vj
Y2Vzc2VzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fCAzOcKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfDxicj4KfCBib290X2ZhaWx1cmVz
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDI0
wqAgwqAgwqAgwqAgwqB8IDXCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IEJVRzprZXJuZWxfcmVib290
LXdpdGhvdXQtd2FybmluZ19pbl90ZXN0X3N0YWdlIHwgMjTCoCDCoCDCoCDCoCDCoHzCoCDCoCDC
oCDCoCDCoCDCoCB8PGJyPgp8IEJVRzp1bmFibGVfdG9faGFuZGxlX2tlcm5lbMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCA1wqAgwqAgwqAgwqAgwqAg
fDxicj4KfCBPb3BzOiNbIyNdwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfCAwwqAgwqAgwqAgwqAgwqAgfCA1wqAgwqAgwqAgwqAgwqAgfDxi
cj4KfCBSSVA6a2ZyZWXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgNcKgIMKgIMKgIMKgIMKgIHw8YnI+
CnwgS2VybmVsX3BhbmljLW5vdF9zeW5jaW5nOkZhdGFsX2V4Y2VwdGlvbsKgIMKgIMKgIMKgIHwg
MMKgIMKgIMKgIMKgIMKgIHwgNcKgIMKgIMKgIMKgIMKgIHw8YnI+CistLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0rPGJyPgo8YnI+Cjxicj4KPGJyPgpbwqAgwqAgMC43NzU2NzZdIEJVRzogdW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgZmZmZmViZTllMDAwY2FjODxicj4KW8KgIMKg
IDAuNzc1Njc2XSBjbG9ja3NvdXJjZTogamlmZmllczogbWFzazogMHhmZmZmZmZmZiBtYXhfY3lj
bGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogNzY0NTA0MTc4NTEwMDAwMCBuczxicj4KW8Kg
IMKgIDAuNzc1Njc2XSAjUEYgZXJyb3I6IFtub3JtYWwga2VybmVsIHJlYWQgZmF1bHRdPGJyPgpb
wqAgwqAgMC43NzU2NzZdIFBHRCAwIFA0RCAwIDxicj4KW8KgIMKgIDAuNzc1Njc2XSBPb3BzOiAw
MDAwIFsjMV0gU01QIFBUSTxicj4KW8KgIMKgIDAuNzc1Njc2XSBDUFU6IDEgUElEOiAyMSBDb21t
OiBrd29ya2VyL3U0OjAgTm90IHRhaW50ZWQgNS4xLjAtcmM0LTAwMDU5LWc4NTNmYmY4ICMyPGJy
PgpbwqAgwqAgMC43NzU2NzZdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBG
WCArIFBJSVgsIDE5OTYpLCBCSU9TIDEuMTAuMi0xIDA0LzAxLzIwMTQ8YnI+ClvCoCDCoCAwLjc3
NTY3Nl0gUklQOiAwMDEwOmtmcmVlKzB4YTEvMHgxNTM8YnI+ClvCoCDCoCAwLjc3OTk1Ml0gZnV0
ZXggaGFzaCB0YWJsZSBlbnRyaWVzOiA1MTIgKG9yZGVyOiAzLCAzMjc2OCBieXRlcyk8YnI+ClvC
oCDCoCAwLjc4MDU4MV0geG9yOiBhdXRvbWF0aWNhbGx5IHVzaW5nIGJlc3QgY2hlY2tzdW1taW5n
IGZ1bmN0aW9uwqAgwqBhdnjCoCDCoCDCoCDCoDxicj4KW8KgIMKgIDAuNzc5OTY1XSBDb2RlOiAx
NSA5YyAxYSAxNiAwMSA0OCAwMSBkOCA3MiAwZSA0OSBjNyBjMiAwMCAwMCAwMCA4MCA0YyAyYiAx
NSAwMSA5MyAwYiAwMSA0OSAwMSBjMiA0OSBjMSBlYSAwYyA0OSBjMSBlMiAwNiA0YyAwMyAxNSBk
ZiA5MiAwYiAwMSAmbHQ7NDkmZ3Q7IDhiIDQyIDA4IGE4IDAxIDc0IDA0IDRjIDhkIDUwIGZmIDQ5
IDhiIDUyIDA4IDRjIDg5IGQwIGY2IGMyIDAxPGJyPgpbwqAgwqAgMC43Nzk5NjVdIFJTUDogMDAw
MDpmZmZmYzkwMDAwM2NiZTYwIEVGTEFHUzogMDAwMTAyODY8YnI+ClvCoCDCoCAwLjc3OTk2NV0g
UkFYOiAwMDAwMDJmODgwMzJiNjQ0IFJCWDogMDAwMDAyZjgwMDMyYjY0NCBSQ1g6IDAwMDAwMDAw
MDAwMDAwMDA8YnI+ClvCoCDCoCAwLjc3OTk2NV0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTog
MDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMmY4MDAzMmI2NDQ8YnI+ClvCoCDCoCAwLjc3OTk2
NV0gUkJQOiBmZmZmYzkwMDAwM2NiZjA4IFIwODogMDAwMDAwMDA4MDAwMDAwMCBSMDk6IGZmZmZj
OTAwMDAzY2JhNjg8YnI+ClvCoCDCoCAwLjc3OTk2NV0gUjEwOiBmZmZmZWJlOWUwMDBjYWMwIFIx
MTogODA4MDgwODA4MDgwODA4MCBSMTI6IGZmZmZmZmZmODEyZGNjMDA8YnI+ClvCoCDCoCAwLjc3
OTk2NV0gUjEzOiAwMDAwMDAwMGZmZmZmZmZlIFIxNDogMDAwMDAwMDBmZmZmZmY5YyBSMTU6IDAw
MDAwMDAwMDAwMDAwMDA8YnI+ClvCoCDCoCAwLjc3OTk2NV0gRlM6wqAgMDAwMDAwMDAwMDAwMDAw
MCgwMDAwKSBHUzpmZmZmODg4MDZlNzAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDA8
YnI+ClvCoCDCoCAwLjc4MjM3Ml0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzM8YnI+ClvCoCDCoCAwLjc4MjM3Ml0gQ1IyOiBmZmZmZWJlOWUwMDBjYWM4
IENSMzogMDAwMDAwMDAwMjQwZTAwMCBDUjQ6IDAwMDAwMDAwMDAwNDA2ZTA8YnI+ClvCoCDCoCAw
Ljc4MjM3Ml0gQ2FsbCBUcmFjZTo8YnI+ClvCoCDCoCAwLjc4MjM3Ml3CoCBmcmVlX2Jwcm0rMHg3
My8weDdjPGJyPgpbwqAgwqAgMC43ODIzNzJdwqAgX19kb19leGVjdmVfZmlsZSsweDcyMC8weDdh
Njxicj4KW8KgIMKgIDAuNzgyMzcyXcKgIGRvX2V4ZWN2ZSsweDIxLzB4MjQ8YnI+ClvCoCDCoCAw
Ljc4MjM3Ml3CoCBjYWxsX3VzZXJtb2RlaGVscGVyX2V4ZWNfYXN5bmMrMHgxNDEvMHgxNmM8YnI+
ClvCoCDCoCAwLjc4MjM3Ml3CoCA/IHVtaF9jb21wbGV0ZSsweDFhLzB4MWE8YnI+ClvCoCDCoCAw
Ljc4MjM3Ml3CoCByZXRfZnJvbV9mb3JrKzB4M2EvMHg1MDxicj4KW8KgIMKgIDAuNzgyMzcyXSBN
b2R1bGVzIGxpbmtlZCBpbjo8YnI+ClvCoCDCoCAwLjc4MjM3Ml0gQ1IyOiBmZmZmZWJlOWUwMDBj
YWM4PGJyPgpbwqAgwqAgMC43ODIzNzJdIC0tLVsgZW5kIHRyYWNlIDgwM2Q5YzY1NmMxNTMxOWQg
XS0tLTxicj4KPGJyPgo8YnI+ClRvIHJlcHJvZHVjZTo8YnI+Cjxicj4KwqAgwqAgwqAgwqAgIyBi
dWlsZCBrZXJuZWw8YnI+CsKgIMKgIMKgIMKgIGNkIGxpbnV4PGJyPgrCoCDCoCDCoCDCoCBjcCBj
b25maWctNS4xLjAtcmM0LTAwMDU5LWc4NTNmYmY4IC5jb25maWc8YnI+CsKgIMKgIMKgIMKgIG1h
a2UgSE9TVENDPWdjYy03IENDPWdjYy03IEFSQ0g9eDg2XzY0IG9sZGRlZmNvbmZpZzxicj4KwqAg
wqAgwqAgwqAgbWFrZSBIT1NUQ0M9Z2NjLTcgQ0M9Z2NjLTcgQVJDSD14ODZfNjQgcHJlcGFyZTxi
cj4KwqAgwqAgwqAgwqAgbWFrZSBIT1NUQ0M9Z2NjLTcgQ0M9Z2NjLTcgQVJDSD14ODZfNjQgbW9k
dWxlc19wcmVwYXJlPGJyPgrCoCDCoCDCoCDCoCBtYWtlIEhPU1RDQz1nY2MtNyBDQz1nY2MtNyBB
UkNIPXg4Nl82NCBTSEVMTD0vYmluL2Jhc2g8YnI+CsKgIMKgIMKgIMKgIG1ha2UgSE9TVENDPWdj
Yy03IENDPWdjYy03IEFSQ0g9eDg2XzY0IGJ6SW1hZ2U8YnI+Cjxicj4KPGJyPgrCoCDCoCDCoCDC
oCBnaXQgY2xvbmUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5n
aXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9p
bnRlbC9sa3AtdGVzdHMuZ2l0PC9hPjxicj4KwqAgwqAgwqAgwqAgY2QgbGtwLXRlc3RzPGJyPgrC
oCDCoCDCoCDCoCBiaW4vbGtwIHFlbXUgLWsgJmx0O2J6SW1hZ2UmZ3Q7IGpvYi1zY3JpcHQgIyBq
b2Itc2NyaXB0IGlzIGF0dGFjaGVkIGluIHRoaXMgZW1haWw8YnI+Cjxicj4KPGJyPgo8YnI+ClRo
YW5rcyw8YnI+ClJvbmcgQ2hlbjxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0072014907264156558==--

